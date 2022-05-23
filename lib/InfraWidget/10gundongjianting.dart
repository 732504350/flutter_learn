import 'dart:ffi';
import 'dart:io';
import 'dart:math';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//可以通过两种方式监听滚动
/*
* controller:
*   1.可以设置默认值offset
*   2.可以监听滚动，也可以监听滚动的位置
* NotificationListener:
*   1.可以监听开始滚动和结束滚动的时间
*/
class _HomePageState extends State<HomePage> {
  ScrollController sc = ScrollController();
  bool _isShowFloatingButton = false;
  //初始化初始的滚动偏移量
  //ScrollController sc = ScrollController(initialScrollOffset: 300);

  @override
  void initState() {
    super.initState();
    sc.addListener(() {//添加监听状态
      //print('监听到滚动发生${sc.offset}');
      setState(() {
        _isShowFloatingButton = sc.offset>=1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification noti){
          if(noti is ScrollStartNotification) print('开始滚动');
          else if(noti is ScrollEndNotification) print('结束滚动');
          else if(noti is ScrollUpdateNotification) print('正在滚动${noti.metrics}');

          return true;
        },
        child: ListView.builder(
            controller: sc,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.people),
                title: Text("联系人$index"),
              );
            }
        ),
      ),
      floatingActionButton: _isShowFloatingButton ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          setState(() {
            sc.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
          });
        },
      ):null,
    );
  }
}

