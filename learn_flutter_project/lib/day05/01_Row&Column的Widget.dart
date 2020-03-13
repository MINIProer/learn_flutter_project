import 'dart:collection';
import 'dart:ui';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class JRHomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  Widget build(BuildContext context) {
    return JRRowDemo();
  }
}

// 注意：开发中直接使用Flex的情况是较少的，可读性不好

// Axis.horizontal 相当于Row组件
class JRFlexDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
    );
  }
}

// Axis.vertical 相当于Column组件
class JRFlexDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
    );
  }
}

/**
 * MainAxisAlignment：
 *  1.MainAxisAlignment.start：主轴的开始位置挨个摆放元素
 *  2.MainAxisAlignment.end：主轴的结束为止挨个摆放元素
 *  3.MainAxisAlignment.center：主轴的中心点对齐
 *  4.MainAxisAlignment.spaceBetween：左右两边间距为0，其他子组件间距平分
 *  5.MainAxisAlignment.spaceAround：左右两边的间距是其他元素之间的间距的一半
 *  6.MainAxisAlignment.spaceEvenly：所有的间距平分
 * 
 * CrossAxisAlignment：
 *  1.CrossAxisAlignment.start：交叉轴的起始位置对齐
 *  2.CrossAxisAlignment.end：交叉轴的结束位置对齐
 *  3.CrossAxisAlignment.center：交叉轴的中心点对齐
 *  4.CrossAxisAlignment.baseline：交叉轴的基线对齐（必须有文字才行）
 *  5.CrossAxisAlignment.stretch：将所有子组件的交叉轴的高度拉伸到最大
 *    5.1 如果想设置最大拉伸的高度，可以用一个container包裹row组件，设置container的高度即可
 */

class JRRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Container(width: 100, height: 50, color: Colors.red, child: Text('123', style: TextStyle(fontSize: 10)),),
        Container(width: 30, height: 10, color: Colors.green, child: Text('123Y', style: TextStyle(fontSize: 5)),),
        Container(width: 50, height: 80, color: Colors.yellow, child: Text('123', style: TextStyle(fontSize: 30)),),
        Container(width: 100, height: 200, color: Colors.cyan, child: Text('123XXXX', style: TextStyle(fontSize: 40)),),
      ],
    );
  }
}

/**
 * Row的特点：
 *  1.水平方向尽可能占据比较大的空间
 *    1.1 如果希望水平方向也要包裹我们的内容，那么就需要设置MainAxisSize = min（默认：max）
 *  2.垂直方向包裹我们的子组件
 */
class JRRowDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.people),
          Text('按钮')
        ],
      ),
      color: Colors.red,
    );
  }
}
