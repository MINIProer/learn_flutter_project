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

// flag状态
// 在flutter中，所有的widget都不能定义状态
// stateful也不能定义状态 -> 创建一个单独的类，这个类负责维护状态
class JRHomePageContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JRHomePageContentBodyState();
  }
}

class JRHomePageContentBodyState extends State<JRHomePageContentBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: (value) {
                // flag = value; 这种写法不会改变UI状态，因为没有刷新
                setState(() {
                  flag = value;
                });
              }),
          Text('同意协议', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}

/**  笔记 **/

// 1.runApp函数
// void runApp(Widget app)
// textDirection: TextDirection.ltr 很多国家的排版是从右向左，所以使用Text部件时，需要传入可选参数排版方向textDirection
// flutter中缩进两个空格
// Center部件，child子类
// MaterialApp的作用是保证我们的app整个都是Material风格的
// Scaffold脚手架，相当于为我们app整体搭建了导航栏和内容去的框架

/**
 * Test
 * 
 * Center(
      child: Text(
          'Hello Flutter', 
          textDirection: TextDirection.ltr,
          style: TextStyle(
          fontSize: 30,
          color: Colors.red
        ),
      ),
    )
 */

/**
 * widget分为两种：
 *  1.有状态的widget：statefulwidget 在运行过程中有一些状态(data数据)需要改变
 *  2.无状态的widget：statelesswidget 内容是确定的，没有状态(data数据)的改变
 */

/**
 * 通过对项目中较大较复杂的widget进行拆分封装，就形成了widget树，这也就是组件化开发的思想
 */
