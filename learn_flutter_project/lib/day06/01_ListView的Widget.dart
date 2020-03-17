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
    return JRListSeparateDemo();
  }
}

class JRListViewTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: 200, // 如果要设置上面的水平方向滚动，就需要设置每个item的宽度
        children: List.generate(20, (index) {
          return Text(
            '${index} - 文本',
            style: TextStyle(fontSize: 20),
          );
        }));
  }
}

class JRListTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        // reverse: true, 倒序排列
        children: List.generate(20, (index) {
      return ListTile(
        leading: Icon(Icons.people),
        trailing: Icon(Icons.delete),
        title: Text('张 - ${index}'),
        subtitle: Text('电话号：18610905033'),
      );
    }));
  }
}

class JRListBuildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemExtent: 64,
        itemBuilder: (BuildContext ctx, int index) {
          return Text('Hello World = ${index + 1}');
        }
      );
  }
}

// Divider 组件就是分割线，也可以用其他组件来代替
class JRListSeparateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 30,
      itemBuilder: (BuildContext ctx, int index) {
        return Text('JRListSeparateDemo = ${index + 1}');
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return Divider(
          height: 64, // 应该是分割线占据的整个区域(分割线本身+上下间距 )
          color: Colors.red,
          indent: 10, // 分割线前面预留空格
          endIndent: 100, // 分割线后面预留空格
          thickness: 20, // 分割线的高度
        );
      },
    );
  }
}

/**
 * ListView的创建方式：
 * 
 * 1、默认构造方法：ListView()
 * 2、ListView.build()
 * 3、ListView.separated
 * 4、自定义：ListView.custom
 */
