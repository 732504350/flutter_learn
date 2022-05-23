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
        title: Text('ImageWidget'),
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
    return Container(
      //Container会根据child的大小自动适配变成child的大小
        color: Colors.red,
        child: Text('Hello world')
    );
  }
}

//Padding用来设置边距
class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          //padding: const EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(5),
          child: Text(
            '你好啊，梦心痛',
            style: TextStyle(
                fontSize: 30,
                backgroundColor: Colors.blue
            ),
          ),
        ),
        Text(
          '你好啊，梦心痛',
          style: TextStyle(
              fontSize: 30,
              backgroundColor: Colors.blue
          ),
        ),
        Text(
          '你好啊，梦心痛',
          style: TextStyle(
              fontSize: 30,
              backgroundColor: Colors.blue
          ),
        ),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
        widthFactor: 5,//根据child的宽度扩展的大小
        heightFactor: 5,
        alignment: Alignment(0,0),
        child: Icon(
          Icons.pets,
          size: 40,
        )
    );
  }
}
