import 'dart:ui';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: JRHomePage());
  }
}

class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: JRHomeContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class JRHomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  Widget build(BuildContext context) {
    return JRTextFieldDemo();
  }
}

class JRTextFieldDemo extends StatelessWidget {
  String userName;
  final pwdTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.green
      ), 
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                icon: Icon(Icons.people), // 左侧图标
                hintText: '请输入用户名', // 占位文本
                border: OutlineInputBorder(), // 边框
                fillColor: Colors.red[100], // 这种个写法代表颜色的透明度
                filled: true, // 该属性默认false，只有为true时，fillcolor属性才能生效
              ),
              onChanged: (value) {
                this.userName = value;
                print(value); // 监听用户输入的文本
              },
              onSubmitted: (value) {
                this.userName = value;
                print('监听用户输入完成提交的文本 = $value');
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: pwdTextFieldController,
              decoration: InputDecoration(
                labelText: '密码',
                icon: Icon(Icons.people), // 左侧图标
                hintText: '请输入密码', // 占位文本
                border: InputBorder.none, // 边框(InputBordr.none 移除边框)
                fillColor: Colors.red[100], // 这种个写法代表颜色的透明度
                filled: true, // 该属性默认false，只有为true时，fillcolor属性才能生效
              ),
              onChanged: (value) {
                print(value); // 监听用户输入的文本
              },
              onSubmitted: (value) {
                print('监听用户输入完成提交的文本 = $value');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity, // 这个属性的意思就是能填充多少就填充多少
              height: 32,
              child: FlatButton(
                onPressed: () {
                  final pwd = pwdTextFieldController.text;
                  print('\n 用户名 = ${this.userName} \n 密码 = $pwd');
                  pwdTextFieldController.text = ''; // 清空文本输入框内的文本的作用
                },
                child: Text(
                  '登 录',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.blue,
              ),
            )
          ],
        ),
      )
    );
  }
}
