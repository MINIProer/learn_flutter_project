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
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('列表测试')), body: JRHomeContent());
  }
}

class JRHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JRGridBuilderDemo();
  }
}

// SliverGridDelegateWithFixedCrossAxisCount
class JRGridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
      children: List.generate(100, (index) {
        return Container(
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
        );
      }),
    );
  }
}

// SliverGridDelegateWithMaxCrossAxisExtent
class JRGridViewDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5 // 设置宽高比例
          ),
      children: List.generate(100, (index) {
        return Container(
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
        );
      }),
    );
  }
}

/**
 * GirdView.builder的性能比较高，跟ListView相同，都是起一个懒加载的作用
 */
class JRGridBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
          );
        }
    );
  }
}
