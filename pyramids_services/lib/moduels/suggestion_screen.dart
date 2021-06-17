import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pyramidsservices/provider/suggestion.dart';
import 'package:pyramidsservices/shared/components/components.dart';

class SuggestionScreen extends StatefulWidget {

  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  final TextEditingController _suggestionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Thank You'),
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

  Future<void> _submit() async {
    print("submit clicked");
    if (!_formKey.currentState.validate()) {
      // Invalid!
      print("not valid");
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
      await Provider.of<SuggestionProvider>(context, listen: false)
          .addSuggestion(_suggestionController.text);
      _showErrorDialog("Review Sent Successfully");
    }

    catch (error) {
      print("messsssage $error");

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Write Your Suggestion",
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
                Container(
                  height: 160.0,
                  child: defaultTextFormField(
                    label: "Suggestion",
                    hint: "Enter Your Suggestion",
                    maxLines: 6,
                    prefix: Icons.description,
                    type: TextInputType.text,
                    controller: _suggestionController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Suggestion';
                      }
                    },
                  ),
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : defaultButton(
                  function: () => _submit(),
                  context: context,
                  text: "Send Your Suggestion",
                  isUpperCase: false,
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
