import 'package:bloc/bloc.dart';
import 'package:flashcards_try/blocs/training/training_states.dart';
import 'package:flutter/cupertino.dart';

class Flashcard {
  final String front;
  final String back;

  ValueNotifier<bool> expanded = ValueNotifier(false);

  Flashcard(this.front, this.back);
}

class TrainingCubit extends Cubit<TrainingState> {
  int currIndex = 0;

  static List<Flashcard> flashcards = [
    Flashcard('Math', 'How are you?'),
    Flashcard('2nd', 'Flashcard'),
    Flashcard('3rd', 'Flashcard'),
    Flashcard('4th', 'Flashcard'),
    Flashcard('5th', 'Flashcard'),
  ];

  TrainingCubit() : super(InitialTrainingState(flashcards));

  // void showAnswer() {
  //   emit(ShowAnswerState());
  // }

  // void respond() {
  //   currIndex++;
  //   if (currIndex != flashcards.length - 1)
  //     emit(NextFlashcardState(flashcards[currIndex]));
  //   else
  //     emit(FinishTrainingState());
  // }
}
