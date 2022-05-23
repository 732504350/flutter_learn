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
        title: Text('InfraWidget'),
      ),
      body: HomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('FloatingActionButton'),
      ),
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
    return ButtonDemo();
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1.RaisedButton
        RaisedButton(
          onPressed: () => print('RaisedButton'),
          color: Colors.orange,
          child: const Text("RaisedButton"),
        ),
        //2.FlatButton
        FlatButton(
          onPressed: () => print('FlatButton'),
          color: Colors.purple,
          child: const Text("FlatButton"),
        ),
        //3.OutlineButton
        OutlinedButton(
          onPressed: () => print('OutlinedButton'),
          child: const Text("OutlinedButton"),
        ),

        //4.自定义Button:图标+文字+背景+圆角
        FlatButton(
            color: Colors.amberAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            onPressed: (){},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, color: Colors.red,),
                Text('喜欢作者')
              ],
            )
        )
      ],
    );
  }
}


