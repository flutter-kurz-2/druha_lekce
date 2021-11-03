import 'package:flutter/material.dart';
import 'dart:math';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController guessController = TextEditingController();
  late int numberToGuess;
  bool won = false;
  bool wrongGuess = false;
  String wrongGuessText = "";

  @override
  void initState() {
    numberToGuess = generateNumber();
    super.initState();
  }

  int generateNumber() {
    Random rnd = Random();
    return rnd.nextInt(100);
  }

  bool checkIfCorrect(int guess) {
    if (guess == numberToGuess) {
      return true;
    }
    return false;
  }

  bool isGuessLarger(int guess) {
    if(guess > numberToGuess) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Second Screen"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            if (!won) const Text("Let's play a game..."),
            if (!won) const Text("0 < ? < 100"),
            if (!won)
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: guessController,
              ),
            if (!won && wrongGuess) Text(wrongGuessText),
            if (!won)
              ElevatedButton(
                  onPressed: () {
                    bool correct =
                        checkIfCorrect(int.parse(guessController.text));

                    if (correct) {
                      setState(() {
                        won = true;
                        wrongGuess = false;
                        guessController.clear();
                      });
                    } else {
                      setState(() {
                        wrongGuess = true;
                        if(isGuessLarger(int.parse(guessController.text))) {
                          wrongGuessText = "Your guess is too large!";
                        }
                        else {
                          wrongGuessText = "Your guess is too small!";
                        }
                        guessController.clear();
                      });
                    }
                  },
                  child: const Text("Submit")),
            if (won) const Text("You won!"),
            if (won) ElevatedButton(onPressed: () {
              setState(() {
                numberToGuess = generateNumber();
                won = false;
                wrongGuess = false;
              });
            }, child: const Text("Play again!")),
          ],
        ),
      ),
    );
  }
}
