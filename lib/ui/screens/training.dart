import 'package:flashcards_try/blocs/training/training_cubit.dart';
import 'package:flashcards_try/blocs/training/training_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingCubit, TrainingState>(builder: (context, state) {
      return ListenableProvider(
        create: (context) => PageController(),
        child: (state is InitialTrainingState)
            ? FlashcardsTrainingPageView(
                flashcards: state.flashcards,
              )
            : Container(),
      );
    });
  }
}

class FlashcardsTrainingPageView extends StatefulWidget {
  const FlashcardsTrainingPageView({Key key, this.flashcards})
      : super(key: key);

  @override
  _FlashcardsTrainingPageViewState createState() =>
      _FlashcardsTrainingPageViewState();

  final List<Flashcard> flashcards;
}

class _FlashcardsTrainingPageViewState
    extends State<FlashcardsTrainingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: Provider.of<PageController>(context),
      itemBuilder: (context, int index) {
        Flashcard flashcard = widget.flashcards[index];
        return Scaffold(
          backgroundColor: Colors.black,
          body: FlashcardView(
            flashcard: flashcard,
          ),
          bottomNavigationBar: AnswerBtn(flashcard: flashcard),
        );
      },
      itemCount: widget.flashcards.length,
    );
  }
}

class FlashcardView extends StatelessWidget {
  final Flashcard flashcard;

  const FlashcardView({Key key, this.flashcard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String front = flashcard.front;
    String back = flashcard.back;

    return ValueListenableBuilder<bool>(
        valueListenable: flashcard.expanded,
        builder: (context, bool expanded, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 50),
              Text(
                front,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Container(height: 30),
              expanded
                  ? Text(
                      back,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  : Container(),
              Container(height: 30),
            ],
          );
        });
  }
}

class AnswerBtn extends StatefulWidget {
  AnswerBtn({Key key, @required this.flashcard}) : super(key: key);

  @override
  _AnswerBtnState createState() => _AnswerBtnState();

  final Flashcard flashcard;
}

class _AnswerBtnState extends State<AnswerBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TrainingCubit, TrainingState>(
          builder: (context, TrainingState state) {
        return ValueListenableBuilder<bool>(
            valueListenable: widget.flashcard.expanded,
            builder: (context, bool expanded, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: () {
                    if (!expanded) {
                      _showAnswer();
                    } else {
                      _respond();
                    }
                  },
                  color: Colors.white,
                  child: Text(!expanded ? 'Show Answer' : 'I know it',
                      style: TextStyle(fontSize: 20)),
                ),
              );
            });
      }),
    );
  }

  _showAnswer() {
    widget.flashcard.expanded.value = true;
  }

  _respond() {
    Provider.of<PageController>(context, listen: false)
        .nextPage(duration: Duration(milliseconds: 450), curve: Curves.easeOut);
  }
}
