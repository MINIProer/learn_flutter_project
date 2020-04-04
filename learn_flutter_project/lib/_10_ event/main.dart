import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

// EventBus 用于多层组件之间的数据传递
// 全局监听
final eventBus = EventBus();

main() => runApp(MyApp());

class JRUser {
  String userName;
  int age;

  JRUser({this.userName, this.age});
}

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
    return Scaffold(
        appBar: AppBar(title: Text('事件监听')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[JRButton(), JRText()],
          ),
        ));
  }
}

class JRButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('按钮'),
        onPressed: () {
          print('按钮点击');
          final user = JRUser(userName: 'fuckboy', age: 2000);
          eventBus.fire(user);
        });
  }
}

class JRText extends StatefulWidget {
  @override
  _JRTextState createState() => _JRTextState();
}

class _JRTextState extends State<JRText> {
  String _message = '测试文案';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    eventBus.on<JRUser>().listen((data) {
      print(data);
      setState(() {
        _message = '姓名 = ${data.userName} - 年龄 = ${data.age}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_message',
      style: TextStyle(fontSize: 30),
    );
  }
}
