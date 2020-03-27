import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

// 状态管理组件
class JRCounterWidget extends InheritedWidget {

  // 1.共享数据
  final int counter;

  // 2.自定义构造方法
  JRCounterWidget({this.counter, Widget child}) : super(child: child);

  // 3.获取组件最近的当前InheritedWidget
  static JRCounterWidget of(BuildContext context) {
    // 沿着Element树，去找到最近的JRCounterElement，从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.决定要不要回调didChangeDependencies
  // 如果返回true：执行依赖当前的InheritedWidget的State中的didChangeDependencies
  // 比钱两次数据是否存在变化，来决定是否需要执行didChangeDependencies这个方法
  @override
  bool updateShouldNotify(JRCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: JRHomePage());
  }
}

class JRHomePage extends StatefulWidget {
  @override
  _JRHomePageState createState() => _JRHomePageState();
}

class _JRHomePageState extends State<JRHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InheritedWidget')),
      body: JRCounterWidget(
        counter: _counter,
        child: Column(
          children: <Widget>[JRShowData01(), JRShowData02()],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _counter++;
        });
      }),
    );
  }
}

class JRShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = JRCounterWidget.of(context).counter;

    return Card(
      color: Colors.cyan,
      child: Text('当前计数 = $counter'),
    );
  }
}

class JRShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = JRCounterWidget.of(context).counter;

    return Container(
      color: Colors.orange,
      child: Text('当前计数 = $counter'),
    );
  }
}
