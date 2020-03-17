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

class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('列表测试')), body: JRHomeContent(context));
  }
}

class JRHomeContent extends StatefulWidget {
  JRHomeContent(BuildContext ctx);

  @override
  _JRHomeContentState createState() => _JRHomeContentState();
}

class _JRHomeContentState extends State<JRHomeContent> {
  double x = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          height: 64,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 62,
                color: Colors.white,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: x),
                    height: 2,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 83 - 88 - 64,
          color: Colors.green,
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.metrics.axisDirection != AxisDirection.up &&
                    notification.metrics.axisDirection != AxisDirection.down) {

                      if (notification is ScrollStartNotification) {
                  print('开始滚动');
                } else if (notification is ScrollUpdateNotification) {
                  // print('正在滚动 --- 位置:${notification.metrics.pixels}、总滚动范围：${notification.metrics.maxScrollExtent}');
                } else if (notification is ScrollEndNotification) {
                  print('滚动结束');

                  if (notification.metrics.pixels /
                          (MediaQuery.of(context).size.width) ==
                      0) {
                    print('第一页');
                    setState(() {
                      this.x = 0;
                    });
                  } else if (notification.metrics.pixels /
                          (MediaQuery.of(context).size.width) ==
                      1) {
                    print('第二页');
                    setState(() {
                      this.x = MediaQuery.of(context).size.width / 3;
                    });
                  } else {
                    print('第三页');
                    setState(() {
                      this.x = MediaQuery.of(context).size.width / 3 * 2;
                    });
                  }
                  // setState(() {

                  // });
                }
                    }
                return true;
              },
              child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                        height: 200,
                        color: Color.fromARGB(255, Random().nextInt(256),
                            Random().nextInt(256), Random().nextInt(256)),
                        child: ListView.builder(
                            itemCount: 20,
                            itemExtent: 64,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Text(
                                '学生 - ${index + 1}',
                                style: TextStyle(fontSize: 20),
                              );
                            }));
                  })),
        )
      ],
    ));
  }
}
