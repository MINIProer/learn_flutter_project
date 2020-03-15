import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: JRHomePage());
  }
}

// 监听滚动事件
/**
 * 注意：
 *  1、一般来说监听widget的一些事件&属性时，会使用widget中的controller属性来做，
 * 而且这种widget应该是statefulWidget
 * 
 */

class JRHomePage extends StatefulWidget {
  @override
  _JRHomePageState createState() => _JRHomePageState();
}

class _JRHomePageState extends State<JRHomePage> {
  bool isRaisedButtonShow = false;
  ScrollController controller =
      ScrollController(); // 初始化一个偏移量initialScrollOffset: 300

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      print('监听滚动 --- ${this.controller.offset}');
      setState(() {
        this.isRaisedButtonShow = this.controller.offset > 100 ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表测试')),
      body: ListView.builder(
          controller: controller,
          itemCount: 20,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              leading: Icon(Icons.people),
              title: Text(
                '同学 - ${index + 1}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('电话号码：未知'),
              trailing: Icon(Icons.delete),
            );
          }),
      floatingActionButton: this.isRaisedButtonShow ? FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            print('滑动到最顶部');
            this.controller.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.easeIn);
          }
        ) : null,
    );
  }
}

/**
 * 注意：
 *  Controller：
 *    1.可以设置默认的offset
 *    2.监听滚动，也可以监听滚动的位置
 * 
 *  NotificationListener：
 *    1.可以监听开始滚动和结束滚动
 */
