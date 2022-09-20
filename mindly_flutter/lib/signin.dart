// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mindly_flutter/empty.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _sinin = GlobalKey<FormState>();
  late String _email = '';
  late String _password = '';
  

  // ignore: unused_field
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/mobile-bg.png'), fit: BoxFit.cover),
            ),
            child: Column(
              children: const [
                Padding(padding: EdgeInsets.only(top: 40)),
                Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Form(
              key: _sinin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(40)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Logo.png',
                            height: 55,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      const Expanded(
                        child: Text(
                          'mindly',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.white)),
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Enter Valid mail';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: RaisedButton(
                      onPressed: () {
                        signIn();
                      },
                      shape: const StadiumBorder(),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'sign in with',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset('assets/Facebook.png'),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        child: Image.asset('assets/Google.png'),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        child: Image.asset('assets/Twitter.png'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signIn() {
    if (_sinin.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('validation is ready'),
        ),
      );
    }
    setState(() {
      _isLoading = true;
    });
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: 'Login succsussfully');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const EmptyScreen()),
          (Route<dynamic> route) => false);
    }).catchError((onError) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: 'Error' + onError.toString());
    });
  }
}
