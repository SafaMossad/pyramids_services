import 'package:provider/provider.dart';
import 'package:pyramidsservices/models/http_exception.dart';
import 'package:pyramidsservices/moduels/categories_screen.dart';
import 'package:pyramidsservices/provider/auth.dart';

import 'login_screen.dart';
import '../shared/components/components.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  Map<String, String> _authData = {
    'name': '',
    'email': '',
    'password': '',
    'phone': '',
  };

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          MaterialButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      setState(() {
        _isLoading = true;
      });
      // Log user in
      await Provider.of<Auth>(context, listen: false).signUp(
        _authData['name'],
        _authData['email'],
        _authData['password'],
        _authData['phone'],
      );


       Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CategoriesScreen()));
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error
          .toString()
          .contains(' "errors": "Invalid email or password"')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      print(",esssssage $error");

      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.grey[100],

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: size.height / 4,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SigUp Now to Use Our Services",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  onSaved: (value) {
                    _authData['name'] = value;
                  },
                  label: "Name",
                  hint: "Enter Your Name",
                  prefix: Icons.person,
                  type: TextInputType.visiblePassword,
                  controller: _nameController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Enter Your Name';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),


                defaultTextFormField(
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                  label: "E-Mail",
                  hint: "Enter Your Email",
                  prefix: Icons.email,
                  // type: TextInputType.emailAddress,
                  controller: _emailController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Enter Valid Email';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                  label: "Password",
                  hint: "Enter Password",
                  prefix: Icons.lock_outline,
                  type: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Password is Short';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  onSaved: (value) {
                    _authData['phone'] = value;
                  },
                  label: "Phone Number",
                  hint: "Enter Your Phone Number",
                  prefix: Icons.phone,
                  type: TextInputType.visiblePassword,
                  controller: _phoneController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'من فضلك أدخل رقم تليفونك';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : defaultButton(
                        context: context,
                        function: () {
                          _submitForm();
                        },
                        text: "Submit",
                        radius: 8.0,
                        background: Theme.of(context).accentColor,
                      ),
                SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                  function: () => navigateTo(context, LoginScreen()),
                  context: context,
                  text: "Back To Login",
                  radius: 8.0,
                  background: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
