import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class trans extends StatefulWidget {
  const trans({Key? key}) : super(key: key);

  @override
  State<trans> createState() => _transState();
}

class _transState extends State<trans> {
  TextEditingController _Textcontroller = TextEditingController();
  TextEditingController _transcontroller = TextEditingController();
  final translator = GoogleTranslator();
  void translate() {
    translator.translate(_Textcontroller.text, from: 'en', to: 'te').then(
      (value) {
        _transcontroller.text = value.toString();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              maxLength: 20,
              controller: _Textcontroller,
              decoration: const InputDecoration(
                hintText: 'Text',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: _transcontroller,
              decoration: const InputDecoration(
                hintText: 'Translate',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                translate();
              },
              child: Text('Translate text'),
            )
          ],
        ),
      ),
    );
  }
}
