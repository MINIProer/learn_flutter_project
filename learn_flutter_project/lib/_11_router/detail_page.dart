import 'package:flutter/material.dart';

class JRDetailPage extends StatelessWidget {
  static const String routeName = '/detail';

  String detailMessage;

  JRDetailPage({this.detailMessage});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop('详情页返回数据');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '详情页',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.of(context).pop('详情页返回数据');
                }),
            Text(
              '${this.detailMessage}',
              style: TextStyle(fontSize: 20),
            )
          ],
        )),
      ),
    );
  }
}
