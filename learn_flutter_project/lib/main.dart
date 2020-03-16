import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter_project/tool/network_tool/http_request.dart';

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

    JRRequestTool.request('https://httpbin.org/get',
        params: {'name': '张三', 'age': 18}).then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
