import 'package:flutter/material.dart';
import 'dart:math';
import 'home_screen.dart';

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
    if (guess > numberToGuess) {
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
        title: Column(
          children: <Widget>[
            if (english) const Text('Simple game')
            else const Text('Jednoduchá hra')
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (!won) if (english) const Text("Let's play a game...")
            else const Text("Pojďme si zahrát hru"),
            if (!won) const Text("0 < ? < 100"),
            if (!won)
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: guessController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(30)
                              )
                          )
                ),
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
                        if (isGuessLarger(int.parse(guessController.text))) {
                          if (english) wrongGuessText = "Your guess is too large!";
                          else wrongGuessText = "Tvůj odhad je příliš velký";
                        } else {
                          if (english) wrongGuessText = "Your guess is too small!";
                          else wrongGuessText = "Tvůj odhad je příliš malý";
                        }
                        guessController.clear();
                      });
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      if (english) const Text("Submit!")
                      else const Text("Zkusit!")
                    ],
                  )),
            if (won)
            if (won) if (english) const Text("You won!")
            else const Text("Vyhrál jsi!"),
            if (won)
              TextButton(
                  onPressed: () {
                    setState(() {
                      numberToGuess = generateNumber();
                      won = false;
                      wrongGuess = false;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      if (english) const Text('Play again!')
                      else const Text('Hrát znovu!')
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
