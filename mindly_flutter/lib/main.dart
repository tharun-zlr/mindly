import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindly_flutter/avatar.dart';
import 'package:mindly_flutter/claculator.dart';
import 'package:mindly_flutter/homepage.dart';
import 'package:mindly_flutter/translate.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const trans());
  }
}
