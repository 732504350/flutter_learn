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
    final imageURL = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpica.zhimg.com%2Fv2-732d099256efe4c2625eab80602798e0_1440w.jpg%3Fsource%3D172ae18b&refer=http%3A%2F%2Fpica.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?'
        'sec=1655539699&t=af54cf9b29aa2016001d632a5326c8b3';
    return ImageDemo(imageURL: imageURL);
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Image(
              width: 400,
              height: 200,
              //alignment范围(-1,1)
              //alignment: Alignment(1,1),
              //alignment: Alignment.bottomCenter,
              //color: Colors.lightBlue,设置颜色，默认全部覆盖
              //colorBlendMode: BlendMode.colorDodge,设置一些混入模式
              fit: BoxFit.fitWidth,//宽度一定，高度自适应
              image: NetworkImage(
                  imageURL
              )
          ),
          const Image(
            //创建本地图片的操作
            //1.在Flutter项目中创建一个文件夹来存储图片
            //2.在pubspec.yaml中进行配置
              image: AssetImage("assets/images/dalian.jpg")
          )
        ]

    );
  }
}

