import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter_project/day09/viewmodel/counter_view_model.dart';
import 'package:learn_flutter_project/day09/viewmodel/user_info_view_model.dart';
import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';
import 'package:provider/provider.dart';

/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其他位置使用共享的数据
 *   3.1 provider.of的方法来获取数据
 *   3.2 consumer的方法来修改数据
 */

main() => runApp(MyApp());

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('事件监听')),
        body: Container()
      );
  }
}

class ListenerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print(
            '指针按下 = $event、相对于屏幕的点 = ${event.position}、相对于自身的点 = ${event.localPosition}');
      },
      child: Container(
        height: 200,
        width: 200,
        color: Colors.cyan,
      ),
    );
  }
}

// 开发中尽量使用Gesture手势，而不是pointer指针
class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTapDown: (detail) {
          print('手指按下');
          print('相对于全局 = ${detail.globalPosition}');
          print('相对于自身 = ${detail.localPosition}');
        },
        onTapUp: (detail) {
          print('手指抬起');
        },
        onTapCancel: () {
          print('手势取消');
        },
        onTap: () {
          print('点击');
        },
        onDoubleTap: () {
          print('双击');
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}

class JRAllDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              GestureDetector(
                onTapDown: (details) {
                  print('外层点击事件');
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
              IgnorePointer( // 作用是忽略内层的点击事件
                child: GestureDetector(
                  onTapDown: (details) {
                    print('内层点击事件');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                )
              )
            ],
          ),
        );
  }
}