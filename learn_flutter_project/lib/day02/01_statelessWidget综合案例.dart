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

class JRHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        JRProductItem('Apple1', 'MacBook1',
            'http://t8.baidu.com/it/u=3571592872,3353494284&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1583908646&t=e962b9ddb251302170a61c45201c3e19'),
        SizedBox(height: 5,),
        JRProductItem('Apple2', 'MacBook2',
            'http://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1583908646&t=a4dfe473a1e3f6297d07aca8d927c5e1'),
        SizedBox(height: 5,),
        JRProductItem('Apple3', 'MacBook3',
            'http://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1583908646&t=3efa4e80b70072bd3ed5f25e4850ae5c')
      ],
    );
  }
}

class JRProductItem extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  final titleStyle = TextStyle(fontSize: 25, color: Colors.red);
  final contentStyle = TextStyle(fontSize: 20, color: Colors.green);

  JRProductItem(this.title, this.content, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.red
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: titleStyle), 
          SizedBox(height: 10),
          Text(content, style: contentStyle), 
          SizedBox(height: 10),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}


/**
 * 笔记 ：
 * 1. 对于column来说，垂直方向就是主轴
 * 2. 对于row来说，水平方向就是主轴
 */