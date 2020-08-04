import 'package:flashcards_try/blocs/training/training_cubit.dart';
import 'package:flashcards_try/ui/screens/home.dart';
import 'package:flashcards_try/ui/screens/training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingCubit(),
      child: MaterialApp(
        title: 'Fleengo Experiments',
        theme: ThemeData(
          backgroundColor: Colors.black,

          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
