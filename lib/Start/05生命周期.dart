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
        title: Text("生命周期"),
      ),
      //body: HomeContent("StatelessWidget的生命周期"),
      body: HomeContent(),
    );
  }
}

//StatelessWidget的生命周期
// class HomeContent extends StatelessWidget {
//   final String message;
//   HomeContent(this.message){
//     print('调用构造函数');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('调用build方法');
//     return Text(
//       message
//     );
//   }
// }

//StatefulWidget的生命周期
class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key)
  {
    print('1.调用HomeContent的构造函数');
  }

  @override
  _HomeContentState createState(){
    print('2.调用HomeContent的createState方法');
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  int _counter = 0;
  _HomeContentState(){
    print('3.调用_HomeContextState的构造函数');
  }

  @override
  void initState() {
    // TODO: implement initState
    print('4.调用_HomeContextState的initState函数');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('5.调用_HomeContextState的build函数');
    return Column(
      children: [
        RaisedButton(
          onPressed: (){
            setState(() {
              _counter++;
            });
          },
          child: Icon(Icons.add),
        ),
        Text("数字 $_counter")
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('6.调用_HomeContextState的dispose函数');
    super.dispose();
  }
}
