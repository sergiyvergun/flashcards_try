import 'package:flashcards_try/ui/screens/pick_images.dart';
import 'package:flashcards_try/ui/screens/training.dart';
import 'package:flashcards_try/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Fleengo Experiments',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          CustomButton(
            title: 'Training',
            onPressed: () {
              context.push(MaterialPageRoute(builder: (context) => Training()));
            },
          ),
          CustomButton(
            title: 'Pick Images',
            onPressed: () {
              context.push(MaterialPageRoute(builder: (context) => PickImages()));
            },
          ),
        ],
      ),
    );
  }
}
