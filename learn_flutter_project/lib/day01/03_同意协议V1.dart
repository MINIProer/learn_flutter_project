import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JRHomePage(),
    );
  }
}

// 封装首页代码，自定义首页部件JRHomePage
class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Hello Flutter',
        textDirection: TextDirection.ltr,
      )),
      body: JRHomePageContentBody(),
    );
  }
}

class JRHomePageContentBody extends StatelessWidget {
  
  var isChecked = true; // 写法错误，定义变量无法改变chekcbox的状态，因为这是一个statelessWidget无状态的widget

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 主轴(纵向)
        // crossAxisAlignment: ,
        children: <Widget>[
          Checkbox(
            value: isChecked, 
            onChanged: (value) => print(isChecked)
          ),
          Text('同意协议', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}