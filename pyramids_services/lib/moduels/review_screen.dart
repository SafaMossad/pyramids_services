import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pyramidsservices/models/review_model.dart';
import 'package:pyramidsservices/provider/review.dart';
import 'package:pyramidsservices/shared/components/components.dart';

class ReviewsScreen extends StatefulWidget {
  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final String imageLink =
      "https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";

  final TextEditingController _reviewController = TextEditingController();

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
      // Log user in
      await Provider.of<ReviewProvider>(context, listen: false)
          .addReview(_reviewController.text);
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
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Write Your Review",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 160.0,
                  child: defaultTextFormField(
                    label: "Review",
                    hint: "Enter Your Review",
                    maxLines: 6,
                    prefix: Icons.description,
                    type: TextInputType.text,
                    controller: _reviewController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Email';
                      }
                    },
                  ),
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : defaultButton(
                        function: () {
                          setState(() {
                            _submit();
                            _reviewController.clear();
                          });
                        },
                        context: context,
                        text: "Send Your Review",
                        isUpperCase: false,
                        radius: 8.0,
                        background: Theme.of(context).accentColor,
                      ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "All Reviews",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                FutureBuilder(
                    future: Provider.of<ReviewProvider>(context, listen: false)
                        .fetchAllReviews(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print("waiting");
                        return LinearProgressIndicator(
                          backgroundColor: Colors.grey[300],
                          semanticsLabel: 'Linear progress indicator',
                        );
                      } else {
                        if (snapshot.hasError) {
                          print("error snap  error ${snapshot.error}");
                          return Center(
                            child: Text('An error occurred!'),
                          );
                        } else {
                          print("success $snapshot");
                          return Consumer<ReviewProvider>(
                            builder: (ctx, oneReviewData, child) =>
                                SingleChildScrollView(
                              child: Container(
                                child: ListView.separated(
                                  itemCount: oneReviewData.allReviews.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      listOfAllReviews(
                                          context: ctx,
                                          model:
                                              oneReviewData.allReviews[index]),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Theme.of(context).accentColor,
                                    thickness: 2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listOfAllReviews({context, AllReviewsModel model}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(imageLink),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "${model.id}",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                ),

                //for red dot and picture
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 15.0),
            child: Text(
              "${model.description}",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              //maxLines: 6,
              //overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
