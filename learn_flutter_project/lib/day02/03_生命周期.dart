import 'dart:io';

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
    );
  }
}

// class JRHomeContent extends StatelessWidget {
//   final String message;

//   JRHomeContent(this.message) {
//     print('调用了构造函数');
//   }

//   @override
//   Widget build(BuildContext context) {

//     print('调用了build函数');

//     return Container();
//   }
// }

/**
 * 生命周期的作用
 *  1. 初始化一些数据、变量、状态
 *  2. 发送网络请求
 *  3. 进行一些事件的监听
 *  4. 管理内存（定时器、controller的手动销毁）
 */

/**
 * 在开发中用的最多的就是StatufulWidget生命周期
 */

class JRHomeContent extends StatefulWidget {
  JRHomeContent() {
    print('调用StatefulWidget的构造方法');
  }

  @override
  State<StatefulWidget> createState() {
    print('调用Widget的createState方法');

    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  int _count = 0;

  // 注意，StateObject的构造方法很少实现，我们只是为了了解生命周期而实现
  _JRHomeContentState() {
    print('调用State Object的构造方法');
  }

  @override
  void initState() {
    // 注意：这里必须调用super
    super.initState();
    print('调用State Object的initState方法');
  }


// 必须要冲洗创建对应组件之后才能调用这个方法
  @override
  void didUpdateWidget(JRHomeContent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('调用State Object的didUpdateWidget方法');

  }

  // 该方法的调用时间
  // 1.调用initState时会调用
  // 2.从其他对象中依赖一些数据发生改变时，比如前面提到的InheritedWidget(后面会讲到)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('调用State Object的didChangeDependencies方法');
  }

  @override
  Widget build(BuildContext context) {
    print('调用State Object的build方法');
    return Column(
      children: <Widget>[
        RaisedButton(
            child: Text('+'),
            onPressed: () {
              setState(() {
                _count++;
              });
            }
          ),
        Text('数量 = $_count'),
        Image.file(
          File('/Users/jr/Desktop/WX20200305-095013@2x.png')
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('调用State Object的dispose方法');
  }
}

/**
 * 1. StatefulWidget
 *    生命周期：Constructor -> Widget.createState()
 */

/**
 * 2. Sate Object
 *    生命周期：Constructor -> initState【初始化状态】 -> build -> dispose【销毁方法】
 */
