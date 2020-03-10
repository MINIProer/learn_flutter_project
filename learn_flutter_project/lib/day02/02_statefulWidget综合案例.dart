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
      body: JRHomeContent('我去你大爷，什么都没有'),
    );
  }
}

class JRHomeContent extends StatefulWidget {
  final String message;
  JRHomeContent(this.message);

  @override
  State<StatefulWidget> createState() {
    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getRiseButtons()),
        Text('当前计数：${this._counter}'),
        Text('我收到了信息：${this.widget.message}')
      ],
    ));
  }

  List<Widget> _getRiseButtons() {
    return <Widget>[
      RaisedButton(
          child: Text('-'),
          color: Colors.green,
          onPressed: () {
            print('点击-');
            setState(() {
              _counter--;
            });
          }),
      RaisedButton(
          child: Text('+'),
          color: Colors.red,
          onPressed: () {
            print('点+');
            setState(() {
              _counter++;
            });
          }),
    ];
  }
}

/**
 * 注意：
 *    1. widget是不加_的，因为加了下划线就是私有，不能给别人使用
 *    2. State是加_的，因为状态不希望别人访问，自己访问即可
 */

/**
 * 为什么Flutter在设计的时候，statefulWidget的build方法是放在State中
 *  1. build出来的widget是需要依赖State中的变量（状态/数据）
 *  2. 在Flutter运行过程中，widget是不断的销毁和创建的，当我们自己的状态发生改变时，并不希望重新创建一个新的State
 */
