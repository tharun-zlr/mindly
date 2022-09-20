// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  // ignore: avoid_init_to_null
  var imageadd = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('avatar'),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 120),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 71,
                  child: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    radius: 65,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 200,
            child: RawMaterialButton(
              fillColor: Colors.greenAccent,
              onPressed: () {
                BottomBar();
                // Addimages();
                showModalBottomSheet(
                    context: context, builder: ((builder) => BottomBar()));
              },
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.camera,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Addimages(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);

    File imagefile = File(image!.path);
    Fluttertoast.showToast(msg: 'Image added succussfully');
    setState(() {
      imagefile = imageadd;
    });
  }

  BottomBar() {
    return Container(
      height: 120,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose your profile',
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: () {
                    Addimages(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                    size: 70,
                  ),
                  label: Text('Camera')),
              Expanded(
                child: FlatButton.icon(
                  onPressed: () {
                    Addimages(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.photo,
                    size: 70,
                    color: Colors.grey,
                  ),
                  label: Text('Galary'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
