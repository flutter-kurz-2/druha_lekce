import 'package:flutter/material.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Widget? floatingButton;
  bool buttonIsAdding = true;

  @override
  void initState() {
    setState(() {
      floatingButton = FloatingActionButton(
        onPressed: () {
          _addCounter(1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.exposure_plus_1),
      );
    });
    super.initState();
  }

  void _addCounter(int add) {
    setState(() {
      _counter = _counter + add;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _changeButton() {
    if (buttonIsAdding) {
      setState(() {
        floatingButton = FloatingActionButton(
          onPressed: () {
            _addCounter(-1);
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.exposure_minus_1),
        );
        buttonIsAdding = false;
      });
    } else {
      setState(() {
        floatingButton = FloatingActionButton(
          onPressed: () {
            _addCounter(1);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.exposure_plus_1),
        );
        buttonIsAdding = true;
      });
    }
  }

  Widget addButton(int add) {
    String text = "";
    if (add >= 0) {
      text = "+" + add.toString();
    } else {
      text = "-" + add.toString();
    }
    return ElevatedButton(
      onPressed: () {
        _addCounter(add);
      },
      child: Text(text),
    );
  }

  String returnTitle() {
    return "Reset";
  }

  String returnSubtitle() {
    if (DateTime.now().weekday == DateTime.wednesday) {
      return "Dneska máme lekci!";
    } else {
      return "Dneska nemáme lekci :(";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Titulek"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tlačítko jsi zmáčkl:',
            ),
            Text(returnSubtitle()),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline2,
            ),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text(returnTitle()),
            ),
            ElevatedButton(
              onPressed: _changeButton,
              child: const Text("Change button"),
            ),
            addButton(10),
            addButton(100),
            addButton(1000),
            addButton(-10),
            addButton(-100),
            addButton(-1000),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ));
                },
                child: const Text("Second Screen")),
          ],
        ),
      ),
      floatingActionButton: floatingButton ?? Container(),
    );
  }
}
