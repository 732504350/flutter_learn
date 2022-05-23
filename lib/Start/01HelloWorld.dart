import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhome()
    );
  }
}

class Myhome extends StatelessWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Myapp",
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Hello flutter",
          style: TextStyle(
              fontSize: 30,
              color: Colors.lightGreen
          ),
        ),
      ),
    );
  }
}

