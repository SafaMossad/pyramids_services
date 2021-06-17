import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pyramidsservices/shared/components/components.dart';

class ParCodeScreen extends StatefulWidget {
  @override
  _ParCodeScreenState createState() => _ParCodeScreenState();
}

class _ParCodeScreenState extends State<ParCodeScreen> {
  File _parCodeImage;

  final picker = ImagePicker();

  Future<void> _pickParCodeImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _parCodeImage = File(pickedFile.path);
      } else {
        print('No ParCode selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Pick Your Image ParCode",
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
                padding: EdgeInsets.all(20.0),
height: size.height/2,
                width: double.infinity,
                decoration: BoxDecoration(
                  //image: DecorationImage(image: FileImage(_image)),
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: _parCodeImage == null
                    ? Center(child: Text('No ParCode Image Selected.'))
                    : Image.file(_parCodeImage,fit: BoxFit.cover,),
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
                          _pickParCodeImage();
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
                          setState(() {
                            _parCodeImage=null;
                            //_reportController.clear();
                          });

                        },
                        context: context,
                        text: "Send Your ParCode",
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
    );
  }
}
