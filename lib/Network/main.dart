import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Network/http_request.dart';


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
        title: Text('Network'),
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
  void initState() {
    super.initState();
    //发送网络请求
    //1.创建dio对象
    final dio = Dio();
    //2.发送网络请求,get方法返回的是一个future对象
    //dio.get("https://httpbin.org/get").then((value) => print(value));
    HttpRequest.request("https://httpbin.org/get",
        params: {"name":"lzh"}).then((value) => print(value));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

