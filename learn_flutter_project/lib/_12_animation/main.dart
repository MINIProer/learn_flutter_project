import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter_project/_12_animation/pages/image_detail.dart';

import 'pages/modal_page.dart';

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
          child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 16 / 9,
        ),
        children: List.generate(20, (index) {
          return GestureDetector(
            onTapDown: (details) {
              Navigator.of(context)
                  .push(PageRouteBuilder(pageBuilder: (context, ani1, ani2) {
                return FadeTransition(
                  opacity: ani1,
                  child: JRImageDetailPage(
                    'https://picsum.photos/500/500?random=$index'),
                );
              }));
            },
            child: Hero(
                tag: 'https://picsum.photos/500/500?random=$index',
                child: Image.network(
                    'https://picsum.photos/500/500?random=$index',
                    fit: BoxFit.cover)),
          );
        }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // <默认动画效果>
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) {
          //     return JRModalPage();
          //   },
          //   fullscreenDialog: true // 相当于iOS中的Modal页面弹出效果
          // ));

          // <自定义动画效果>
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(seconds: 3),
              pageBuilder: (ctx, animation1, animation2) {
                return FadeTransition(
                  opacity: animation1,
                  child: JRModalPage(),
                );
              }));
          // 注意：如果通过路由名称进行跳转，需要添加转场动画时，需要通过钩子函数来实现
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
