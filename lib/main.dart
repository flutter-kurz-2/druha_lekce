import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Widget? floatingButton;
  bool buttonIsAdding = true;

  @override
  void initState() {
    setState(() {
      floatingButton = FloatingActionButton(
        onPressed: () {_addCounter(1);},
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
    if(buttonIsAdding) {
      setState(() {
        floatingButton = FloatingActionButton(
          onPressed: () {_addCounter(-1);},
          tooltip: 'Decrement',
          child: const Icon(Icons.exposure_minus_1),
        );
        buttonIsAdding = false;
      });
    }
    else {
      setState(() {
        floatingButton = FloatingActionButton(
          onPressed: () {_addCounter(1);},
          tooltip: 'Increment',
          child: const Icon(Icons.exposure_plus_1),
        );
        buttonIsAdding = true;
      });
    }
  }

  Widget addButton(int add) {
    String text = "";
    if(add >= 0) {
     text = "+" + add.toString();
    }
    else {
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
    if(DateTime.now().weekday == DateTime.wednesday) {
      return "Dneska máme lekci!";
    }
    else {
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
          ],
        ),
      ),
      floatingActionButton: floatingButton ?? Container(),
    );
  }
}
