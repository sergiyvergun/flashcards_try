import 'package:flashcards_try/blocs/training/training_cubit.dart';

abstract class TrainingState {}

class InitialTrainingState extends TrainingState {
  final List<Flashcard> flashcards;

  InitialTrainingState(this.flashcards);
}

class FinishTrainingState extends TrainingState {}
