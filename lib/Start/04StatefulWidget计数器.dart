import 'dart:io';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButton(),
          Text("当前计数：$_counter")
        ],
      ),
    );
  }

  Widget _getButton()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            setState(() {
              ++_counter;
            });
          },
          color: Colors.lightGreen,
          child: const Text(
            '+',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              if(_counter == 0) return;
              --_counter;
            });
          },
          color: Colors.lightBlue,
          child: const Text(
            '-',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
