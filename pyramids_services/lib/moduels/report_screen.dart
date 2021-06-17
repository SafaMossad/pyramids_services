import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pyramidsservices/provider/report.dart';
import 'package:pyramidsservices/shared/components/components.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _reportController = TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: Text('Thank You',style: TextStyle(color: Colors.black),),
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
      await Provider.of<ReportsProvider>(context, listen: false)
          .addReport(_reportController.text);
      _showErrorDialog("Report Sent Successfully");

    }
    catch (error) {
      print("messsssage $error");

      const errorMessage =
          'Some Thing Go Wrong';
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
                    height: size.height /4,
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
                      "Write Your Report",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 160.0,
                  child: defaultTextFormField(
                    label: "Report",
                    hint: "Enter Your Report",
                    maxLines: 6,
                    prefix: Icons.description,
                    type: TextInputType.text,
                    controller: _reportController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Report';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: size.height/2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //image: DecorationImage(image: FileImage(_image)),
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: _image == null
                      ? Center(child: Text('No  Image Selected.'))
                      : Image.file(_image,fit: BoxFit.cover,),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        //alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            size: 40.0,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: (){
                            _pickImage();
                            print("Piked Image");
                          },

                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultButton(
                           function: () {
                             _submit();
                            setState(() {
                              _image=null;
                              _reportController.clear();
                            });

                           },
                          context: context,
                          text: "Send Your Report",
                          isUpperCase: false,
                          radius: 8.0,
                          background: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
