import 'package:flutter/material.dart';

class JRUnKnowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('错误页'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('返回首页'),
            )
          ],
        ),
      ),
    );
  }
}
