// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindly_flutter/empty.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _checkbox = false;
  bool _isLoading = false;
  late String _name = "";
  late String _email = "";
  late String _password = "";
  late String _conformpassword = "";
  var _imagFile = null;
  bool _secure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/signup-bg.png'), fit: BoxFit.fill),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 55,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 200,
            child: RawMaterialButton(
              fillColor: Colors.greenAccent,

              onPressed: () {
                print("Clicked camera !!");

                showModalBottomSheet(
                  context: context,
                  builder: ((build) => BottomSheet()),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  // backgroundColor: Colors.yellowAccent
                );
              },
              // hoverColor: Colors.red,
              shape: CircleBorder(),
              child: Icon(Icons.camera_alt),
            ),
          ),
          Container(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.fromLTRB(25, 200, 20, 0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Name',
                              suffixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter you Name';
                              } else {
                                return null;
                              }
                            },
                            onChanged: ((value) {
                              _name = value;
                            }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                suffixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter valid mail Id';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (item) {
                                _email = item;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: _secure,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secure = !_secure;
                                  });
                                },
                                icon: _secure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            validator: ((value) {
                              if (value!.length < 6) {
                                return 'Enter the valid password';
                              } else {
                                return null;
                              }
                            }),
                            onChanged: (value) {
                              _password = value;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: _secure,
                            decoration: InputDecoration(
                              hintText: 'Conform Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secure = !_secure;
                                  });
                                },
                                icon: _secure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            validator: ((value) {
                              if (value!.length < 6) {
                                return 'Enter conform password';
                              }
                              return null;
                            }),
                            onChanged: (item) {
                              _conformpassword = item;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Checkbox(
                              value: _checkbox,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox = value!;
                                });
                              },
                            ),
                            const Text(
                                'I would like to receive your newsletter and \nother promotional information'),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: double.infinity,
                            height: 50,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              color: const Color.fromARGB(255, 10, 192, 247),
                              elevation: 40,
                              onPressed: () {
                                SignUp();
                              },
                              shape: const StadiumBorder(),
                              child: const Text('Sign Up'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future picImage() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imagFile = _imagFile;
    });
  }

  void SignUp() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // ignore: avoid_print
      print(_name);
      print(_email);
      print(_password);
      print(_conformpassword);
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(msg: 'Sign Up succussfully');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const EmptyScreen()),
            (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(msg: 'Error$onError');
      });
    }
  }

  Addimages(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);

    final File imagefile = File(image!.path);
    Fluttertoast.showToast(msg: 'Image added succussfully');
    setState(() {
      _imagFile = imagefile;
    });
  }

  // ignore: non_constant_identifier_names
  BottomSheet() {
    return Container(
      height: 150,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        const Text(
          'Choose Your profile',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(8.0)),
            FlatButton.icon(
              onPressed: () {
                Addimages(ImageSource.camera);
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 60,
              ),
              label: const Text(
                'Camera',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  Addimages(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  size: 60,
                ),
                label: const Text(
                  'Gallary',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
