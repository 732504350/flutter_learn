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
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (details){
              print('Outer click');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
          IgnorePointer(//阻止冒泡
            child: GestureDetector(
              onTapDown: (details){
                print('Inner click');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details){
          print('手指按下');
          print(details.globalPosition);
          print(details.localPosition);
        },
        onTapUp: (details){
          print('手指抬起');
        },
        onTap: (){
          print('手指点击');
        },
        onDoubleTap: (){
          print('手指双击');
        },
        onLongPress: (){
          print('手指长按');
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}

