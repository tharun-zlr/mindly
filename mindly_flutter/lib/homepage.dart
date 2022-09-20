import 'package:flutter/material.dart';
import 'package:mindly_flutter/signin.dart';
import 'package:mindly_flutter/signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mobile-bg.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.all(40)),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Logo.png',
                          height: 55,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(
                      child: Text(
                        'mindly',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      shape: const StadiumBorder(),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      shape: const StadiumBorder(),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      color: Colors.white,
                      // backgroundColor: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'sign in with',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      color: Colors.white,
                      fontStyle: FontStyle.normal),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
