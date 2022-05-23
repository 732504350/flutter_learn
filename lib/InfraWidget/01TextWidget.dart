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
        title: Text('InfraWidget'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextDemo();
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
        TextSpan(
            children: [
              TextSpan(text: 'Hello, world', style: TextStyle(color: Colors.red)),
              WidgetSpan(child: Icon(Icons.favorite_border)),
              TextSpan(text: 'Hello, flutter', style: TextStyle(color: Colors.green)),
              WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
              TextSpan(text: 'Hello, dart', style: TextStyle(color: Colors.blue)),
            ]
        )
    );
  }
}


// class TextDemo extends StatelessWidget {
//   const TextDemo({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       'Hello Infra.\nI heared, that you settled down, and you found a girl'
//           'and you married now aho.',
//       textAlign: TextAlign.center,
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         fontSize: 20,
//         color: Colors.red,
//         fontWeight: FontWeight.bold
//       ),
//     );
//   }
// }



