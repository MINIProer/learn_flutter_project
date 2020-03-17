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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          pinned: true, // 可以让sliverAppBar悬浮在顶部
          flexibleSpace: FlexibleSpaceBar(
            background: Image(image: AssetImage('assets/images/fuck.jpg'), fit: BoxFit.cover,),
          )
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
                );
              },
              childCount: 4
          ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
              return ListTile(
                leading: Icon(Icons.people),
                title: Text(
                  '学生${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('电话号码：未知'),
                trailing: Icon(Icons.delete),
              );
            },
            childCount: 10,
          )
        )
      ],
    );
  }
}
