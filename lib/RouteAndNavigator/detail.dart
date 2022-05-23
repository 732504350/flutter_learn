import 'package:flutter/material.dart';

class MyDetailPage extends StatelessWidget {
  final String _message;
  MyDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_message'),
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
    Navigator.of(context).pop('Passed from detail');
  }
}
