import 'package:flutter/material.dart';

class JRAboutPage extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    // 从命名有参数路由获取参数的方式
    final message = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('关于页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('$message'),
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
