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

class JRHomePage extends StatefulWidget {
  @override
  _JRHomePageState createState() => _JRHomePageState();
}

class _JRHomePageState extends State<JRHomePage>
    with SingleTickerProviderStateMixin {
  /**
   * 1.大小变化动画
   * 2.颜色变化动画
   * 3.透明度变化动画
   * 4.旋转动画
   */

  // AnimationController
  AnimationController _controller;
  Animation animation;
  Animation sizeAnimation;
  Animation colorAnimation;
  Animation opacityAnimation;
  Animation radiansAnimation;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(seconds: 2));

    // 2.设置Curve的值
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 交织动画方案一
    // 3.设置Tween
    // 3.1 大小
    sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation);
    // 3.2 颜色
    colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.cyan).animate(animation);
    // 3.3 透明度
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
    // 3.4 旋转角度
    radiansAnimation = Tween(begin: 0.0, end: pi * 2).animate(animation);

    // // 4.监听动画值的改变
    // _controller.addListener(() {
    //   setState(() {});
    // });

    // 5.监听动画状态的改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                return Opacity(
                  opacity: opacityAnimation.value,
                  child: Transform(
                    transform: Matrix4.rotationZ(radiansAnimation.value),
                    alignment: Alignment.center,
                    child: Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      color: colorAnimation.value,
                    ),
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

/**
 * 上述动画代码存在的问题：
 *  1.每次读需要写一段代码【addListener，setState】
 *  2.setState -》 build，build方法内部所有的东西都会重新构建，性能不会很高
 * 
 * 优化方案：
 *  1.AnimatedWidget
 *    1.1 将需要执行动画的Widget放到一个AnimatedWidget中的build方法里进行返回
 *      缺点：
 *        1.每次都需要创建一个类
 *        2.如果构建widget中存在子类，那么子类的build方法依然会不断的执行
 *  2.AnimatedBuilder
 */
