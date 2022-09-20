import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  final _Controller = TextEditingController();

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the controller Page'),
      ),
      body: Column(
        children: [
          Text(name),
          Container(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: _Controller,
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                name = _Controller.text;
              });
            },
            child: Text('click that'),
          ),
        ],
      ),
    );
  }
}
