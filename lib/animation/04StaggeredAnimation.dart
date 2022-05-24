import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}
/*
  * 1.Animation:抽象类
  * 监听动画值的改变
  * 监听动画状态的改变
  * value值
  * status状态
  * 2.AnimationController继承自Animation
  * vsync:同步信号，屏幕的刷新率
  * forward:向前执行动画
  * reverse:反转动画
  * 3.CurvedAnimation:执行动画执行速率
  * 4.Tween:设置动画执行的value范围
  * begin:开始值
  * end:结束值
  * */
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  late Animation _sizeAnim;
  late Animation _colorAnim;
  late Animation _opacityAnim;
  late Animation _rotateAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 2),
    );
    //2.设置Curved值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    //3.Tween
    //3.1创建size的Tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    //3.2创建color的Tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    //3.3创建opacity的Tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    //3.4创建rotate的Tween
    _rotateAnim = Tween(begin: 0.0, end: 2*pi).animate(_controller);

    //4.监听动画状态的改变
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //1、大小变化动画
    //2、颜色变化动画
    //3、透明度变化动画

    print('Build running!!!');
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (ctx, child){
              return Opacity(//改变透明度
                opacity: _opacityAnim.value,
                child: Transform(
                  transform: Matrix4.rotationZ(_rotateAnim.value),
                  alignment: Alignment.center,
                  child: Container(
                    width: _sizeAnim.value,
                    height: _sizeAnim.value,
                    color: _colorAnim.value,
                  ),
                ),
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          if(_controller.isAnimating){
            _controller.stop();
          }else{
            _controller.forward();
          }
        },
      ),
    );
  }
}