import 'package:flutter/material.dart';
import 'package:flutter_learn/RouteAndNavigator/about.dart';
import 'package:flutter_learn/RouteAndNavigator/detail.dart';
import 'package:event_bus/event_bus.dart';

//1.创建全局的eventbus对象
final eventBus = EventBus();

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (ctx) => HomePage(),
        "/about" : (ctx) => MyAboutPage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/",//初始路由，即首页
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
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String? _message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('$_message'),
          ElevatedButton(
              child: Text("跳转到详情"),
              onPressed: () => _jumpToDetail(context)),
          ElevatedButton(
              child: Text("跳转到关于"),
              onPressed: () => _jumpToAbout(context)),
        ],
      ),
    );
  }

  //1.普通的跳转方式
  void _jumpToDetail(BuildContext context) {
    Future future = Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MyDetailPage("Passed from mainPage");
    }));
    future.then((value){
      setState(() {
        _message = value;
      });
    });
  }

  //2.使用命名路由进行跳转
  void _jumpToAbout(BuildContext context) {
    Future future = Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MyAboutPage();
    }));
    future.then((value){
      setState(() {
        _message = value;
      });
    });
  }
}
