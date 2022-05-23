import 'package:flutter/material.dart';

class MyAboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => _backToHome(context),
                child: Text('Back to home')
            )
          ],
        ),
      ),
    );
  }

  void _backToHome(BuildContext context){
    Navigator.of(context).pop('Passed from about');
  }
}
