import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    return Scaffold(appBar: AppBar(title: Text('列表测试')), body: JRHomeContent());
  }
}

class JRHomeContent extends StatefulWidget {
  @override
  _JRHomeContentState createState() => _JRHomeContentState();
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  void initState() {
    super.initState();

    // 1.创建dio对象
    Dio dio = Dio();

    // 2.发送网络请求
    dio.get('https://httpbin.org/get').then((res) {
      print('result = $res');
    }).catchError((err) {
      print('error = $err');
    });

    dio.post('https://httpbin.org/post').then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
