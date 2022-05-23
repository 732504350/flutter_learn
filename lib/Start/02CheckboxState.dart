import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhomest()
    );
  }
}

class Myhomest extends StatefulWidget {
  const Myhomest({Key? key}) : super(key: key);

  @override
  _MyhomestState createState() => _MyhomestState();
}

class _MyhomestState extends State<Myhomest> {
  var flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Myapp",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: flag,
                onChanged: (value) {
                  setState(() {
                    flag = value!;
                  });
                }),
              Text(
                "同意本协议",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue
                ),
              )
            ],
          ),
        )
    );
  }
}


