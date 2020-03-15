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
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表测试')),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          // 滚动的位置 除以 总滚动的范围 等于 滚动的百分比
          if (notification is ScrollStartNotification) {
            print('开始滚动');
          } else if (notification is ScrollUpdateNotification) {
            print(
                '正在滚动 --- 位置:${notification.metrics.pixels}、总滚动范围：${notification.metrics.maxScrollExtent}');
            setState(() {
              this.isRaisedButtonShow =
                  notification.metrics.pixels > 100 ? true : false;
            });
          } else if (notification is ScrollEndNotification) {
            print('滚动结束');
          }
          return true;
        },
        child: ListView.builder(
            controller: this.controller,
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
      ),
      floatingActionButton: this.isRaisedButtonShow
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                print('滑动到最顶部');
                this.controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeIn);
              })
          : null,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // state销毁时，需要把controller也销毁，防止内存占用
    this.controller.dispose();
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
