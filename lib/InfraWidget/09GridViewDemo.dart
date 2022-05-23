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

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
        ),
        itemBuilder: (BuildContext ctx, int index){
          return Container(
              color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256))
          );
        }
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1
      ),
      children: List.generate(100, (index) {
        return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256))
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,//交叉轴最大能放多少个
            childAspectRatio: 1,//高度和宽度的比例
            crossAxisSpacing: 5,//交叉轴每个widget的间距
            mainAxisSpacing: 5//主轴每个widget的间距
        ),
        children: List.generate(
            100,
                (index) {
              return Container(
                  color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256))
              );
            }
        ),
      ),
    );
  }
}

class ListViewDemo3 extends StatelessWidget {
  const ListViewDemo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext bct, int idx) {
          return Text(
            'Hello world',
            style: TextStyle(fontSize: 20),
          );
        },
        separatorBuilder: (BuildContext bct, int idx) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: 100);
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 25,
      itemBuilder: (BuildContext bct, int idx) {
        return Text(
          'Hello world',
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      //默认滚动方向为垂直
        scrollDirection: Axis.vertical,
        children: List.generate(100, (index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text("联系人：${index + 1}"),
            subtitle: Text("Phone:1865555"),
          );
        }));
  }
}
