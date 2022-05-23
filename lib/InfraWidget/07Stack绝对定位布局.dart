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
        title: Text('Widget'),
      ),
      body: HomeContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return StackDemo();
  }
}

class StackDemo extends StatefulWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  bool _favor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/dalian.jpg"),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Color.fromARGB(150, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MXT',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(
                        Icons.favorite,
                        color: _favor ? Colors.red : Colors.white
                    ),
                    onPressed: () {
                      setState(() {
                        _favor = !_favor;
                      });
                    },
                  )
                ],
              ),
            ))
      ],
    );
  }
}

//Row和Column继承自Flex
//当direction属性设置为Axis.vertical时等于Column
//当direction属性设置为Axis.horizontal时等于Row
//一般使用Flex较少，直接使用Row和Column
class RowDemo extends StatelessWidget {
  const RowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //默认mainAxisSize为max最大值
      //mainAxisSize: MainAxisSize.max,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              width: 60,
              height: 60,
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              width: 80,
              height: 80,
            )),
        Container(
          color: Colors.green,
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.orange,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
