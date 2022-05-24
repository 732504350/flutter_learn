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
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 2),
    );
    //2.设置Curved值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    //3.改变组件大小
    _animation = Tween(begin: 50.0,end: 150.0).animate(_animation);

    //3.监听动画值的改变,但是每次执行都会重新调用build，需要进行优化
    _controller.addListener(() {
      setState(() {});
    });

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: _animation.value),
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

