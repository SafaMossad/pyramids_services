import 'package:provider/provider.dart';
import 'package:pyramidsservices/models/http_exception.dart';
import 'package:pyramidsservices/provider/auth.dart';

import 'categories_screen.dart';
import 'register_screen.dart';
import '../shared/components/social_icon.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';

import '../shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'This is Not a Valid Email',
          style: TextStyle(color: Colors.indigo),
        ),
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
  bool isVisible = false;

  @override
  void initState() {
    isVisible = true;
    super.initState();
  }
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  Future<void> submitData(context) async {
    if (!_formKey.currentState.validate()) {
      return null;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).login(
        _authData["email"],
        _authData["password"],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Please Enter a Valid Account';
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
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: size.height / 4 + 60,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "SignIn Now ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Valid E-Mail";
                      } else {
                        return null;
                      }
                    },
                    controller: _emailController,

                    onSaved: (value) {
                      _authData['email'] = value;
                    },

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.0),
                            bottom: Radius.circular(10.0),
                          )),
                      labelText: "Email",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      hintText: "Enter Your Email",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),

                    )
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return "Enter Valid Password";
                    } else {
                      return null;
                    }
                  },
                    controller: _passwordController,

                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                  obscureText: isVisible
                  //&& "Enter Your Password" == 'Enter Your Password'
                      ? true
                      : false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                          bottom: Radius.circular(10.0),
                        )),
                    labelText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(
                      Icons.lock,
                       color: Colors.grey,
                    ),
                    suffixIcon: isVisible
                    //&& 'Enter Your Password' == 'Enter Your Password'
                        ? IconButton(
                      icon: Icon(Icons.visibility_off),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          isVisible = false;
                        });
                      },
                    )
                        : IconButton(
                        icon: Icon(Icons.visibility),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            isVisible = true;
                          });
                        }),

                  )
                ),
                SizedBox(
                  height: 15.0,
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : defaultButton(
                        function: () => submitData(context),
                        context: context,
                        text: "Login",
                        radius: 8.0,
                        background: defaultColor,
                      ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Don't Have Account ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                        //textDirection: TextDirection.rtl,
                      ),
                      defaultTextButton(
                          text: "SignIn Now",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                          function: () {
                            navigateTo(context, RegisterScreen());
                          }),
                    ],
                  ),
                ),
/*
                orDivider(context),
*/
/*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                      // color: Colors.indigo,
                      iconColor: Colors.indigo,
                    ),
                    SocialIcon(
                      iconSrc: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                  ],
                ),
*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
