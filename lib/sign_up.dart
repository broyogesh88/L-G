import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_sign_in_demo/View_Model/sign_in_view_model.dart';
import 'package:flutter_google_sign_in_demo/base/base_view.dart';
import 'package:flutter_google_sign_in_demo/sign_up.dart';
import 'package:flutter_google_sign_in_demo/splash.dart';
import 'package:flutter_google_sign_in_demo/utils/routeNames.dart';
import 'package:flutter_google_sign_in_demo/utils/util.dart';
import 'package:flutter_google_sign_in_demo/utils/view_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import 'login_screen.dart';

void main() => runApp(Signup());

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Student Registration';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

bool _passwordVisible;

@override
void initState() {
  _passwordVisible = false;
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue;
  bool _agreedToTOS = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 15, left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            obscureText: true,
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'Password is required';
                              }
                            },
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Password",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                            cursorColor: Colors.black,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Address",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Contact No.",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Standard',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              DropdownButton<String>(
                                hint: Text("Select Class"),
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'VI',
                                  'VII',
                                  'VIII',
                                  'IX',
                                  'X',
                                  'XI',
                                  'XII',
                                  'College Student'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Checkbox(
                                value: _agreedToTOS,
                                onChanged: _setAgreedToTOS,
                              ),
                              GestureDetector(
                                onTap: () => _setAgreedToTOS(!_agreedToTOS),
                                child: const Text(
                                  'I agree to the Terms of Services and Privacy Policy',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }), ModalRoute.withName('/'));
                                },
                                child: Text('Go back!'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text('Processing Data')));
                                  }
                                },
                                child: Text('Register'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}

/// This is the private State class that goes with MyStatefulWidget
