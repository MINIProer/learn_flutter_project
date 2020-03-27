import 'package:flutter/material.dart';
import 'package:learn_flutter_project/douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
            splashColor: Colors.transparent, // 移除按钮水波纹
            highlightColor: Colors.transparent // 移除按钮水波纹
            ),
        home: JRMainPage());
  }
}

/**
 * 渲染Widget：生成RenderObject
 * 
 *  1、Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject) -> RenderObject
 *  2、Padding -> createRenderObject -> RenderPadding -> RenderBox -> RenderObject
 *  3、所有的Widget都会创建一个Element对象 
 */

/**
 *  1、自己写Widget
 *  2、某些Widget中会创建RenderObject
 *  3、每一个WIdget都会创建一个Element对象
 *  4.1、ComponentElement的mount方法 ：firstbuild-》rebuild-》performBuild-》build-》_widget.build 
 *  4.2、RenderObjectElement的mount方法：_widget.createRenderObject
 *  4.3、StatefulElement（相当于继承制ComponentElement）：构造方法中 _state = widget.createState()、_state._widget = widget
 */
