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
        title: const Text(
          'MLP',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeProductItem("九寨沟", "In Sichuan province", "/Users/liuzihan/learn_flutter/flutter_learn/picture/jiuzhaigou.jpg"),
        SizedBox(height: 5,),
        HomeProductItem("西安", "In Shanxi province", "/Users/liuzihan/learn_flutter/flutter_learn/picture/xian.jpg"),
        SizedBox(height: 5,),
        HomeProductItem("大连", "In Liaoning province", "/Users/liuzihan/learn_flutter/flutter_learn/picture/dalian.jpg")
      ],
    );
  }
}

class HomeProductItem extends StatelessWidget {
  HomeProductItem(this.title, this.desc, this.imageURL);
  final String title;
  final String desc;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(//设置边框
              width: 5,
              color: Colors.black
          )
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                color: Colors.orange
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            desc,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.lightGreen
            ),
          ),
          const SizedBox(height: 8,),
          Image.file(File(imageURL))
        ],
      ),
    );
  }
}