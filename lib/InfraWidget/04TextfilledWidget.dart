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
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: usernameTextEditController,
            decoration: InputDecoration(
              labelText: 'Username',
              icon: Icon(Icons.people),
              hintText: 'Please input username',
              border: OutlineInputBorder(//轮廓
                  borderRadius: BorderRadius.circular(20)
              ),
              filled: true,
            ),
            onChanged: (value){
              print('onChanged:$value');
            },
            onSubmitted: (value){
              print('onSubmitted:$value');
            },
          ),
          SizedBox(height: 8,),
          TextField(
            controller: passwordTextEditController,
            decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
                hintText: 'Please input password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
              height: 40,
              color: Colors.blue,
              onPressed: (){
                //1.获取用户名和密码
                final username = usernameTextEditController.text;
                final password = passwordTextEditController.text;
                print('账号：$username\n密码：$password');
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              )
          )
        ],
      ),
    );
  }
}
