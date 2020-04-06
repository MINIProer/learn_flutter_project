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
  // AnimationController
  AnimationController _controller;
  Animation animation;
  Animation sizeAnimation;

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
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    // 3.设置Tween
    sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation);

    // 4.监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

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
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: Icon(
          Icons.people,
          size: sizeAnimation.value,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
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
     * 1.Animation:抽象类
     *    * 监听动画值的改变
     *    * 监听动画状态的改变
     *    * value
     *    * status
     * 2.AnimationController:继承自Animation
     *    * vsync：同步信号（this -> with[混入语法] SingleTickerProviderStateMixin [混入到State中]）
     *    * forward()：向前执行动画
     *    * reverse()：反转执行动画
     * 3.CurvedAnimation：继承自Animation
     *    * 作用：设置动画执行的速率【速度曲线】
     * 4.Tween：设置动画执行的value范围
     *    * begin：开始值
     *    * end：结束值
     */
// final controller = AnimationController(vsync: this);
// final animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
// final valueAnimation = Tween(begin: 100, end: 200).animate(animation); // 注意animation参数值也可以替换为controller，意思就是没有假如动画曲线

/**
 * 上述动画代码存在的问题：
 *  1.每次读需要写一段代码【addListener，setState】
 *  2.setState -》 build，build方法内部所有的东西都会重新构建，性能不会很高
 * 
 * 优化方案：
 *  1.AnimatedWidget
 *    1.1 将需要执行动画的Widget放到一个AnimatedWidget中的build方法里进行返回
 *  2.AnimatedBuilder
 */
