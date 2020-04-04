import 'package:flutter/material.dart';
import 'package:learn_flutter_project/_11_router/about_page.dart';
import 'package:learn_flutter_project/_11_router/unknow_page.dart';

import 'detail_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // home: JRHomePage(), 可以不写
      routes: {
        JRHomePage.routeName: (context) => JRHomePage(),
        JRAboutPage.routeName: (context) => JRAboutPage()
      },
      initialRoute: JRHomePage.routeName, // 这里写完之后，可以不用写home: JRHomePage()了
      onGenerateRoute: (settings) {
        // 钩子函数(不改变详情页代码的前提下，使用命名路由的方式进行跳转)
        if (settings.name == JRDetailPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return JRDetailPage(
              detailMessage: settings.arguments,
            );
          });
        }
        return null;
      },
      onUnknownRoute: (settings) { // 如果存在未知路由情况下，跳转到一个错误页面
        return MaterialPageRoute(builder: (context) {
          return JRUnKnowPage();
        });
      },
    );
  }
}

class JRHomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _JRHomePageState createState() => _JRHomePageState();
}

class _JRHomePageState extends State<JRHomePage> {
  String _homeMessage = 'default message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('路由')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_homeMessage'),
            RaisedButton(
                child: Text(
                  '跳转到详情页',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () => _jumpToDetailPage(context)),
            RaisedButton(
              onPressed: () {
                _jumpToAboutPage(context);
              },
              child: Text(
                '跳转到关于页',
                style: TextStyle(fontSize: 20),
              ),
            ),
            RaisedButton(
              onPressed: () {
                _jumpToDetailPage2(context);
              },
              child: Text('跳转到关于页2'),
            ),
            RaisedButton(
              onPressed: () {
                _jumpToSettingPage(context);
              },
              child: Text('跳转到设置页'),
            ),
          ],
        )));
  }

  void _jumpToDetailPage(BuildContext context) {
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return JRDetailPage(
        detailMessage: '首页传递的数据',
      );
    }));

    result.then((data) {
      print('$data');
      setState(() {
        _homeMessage = data;
      });
    });
  }

  void _jumpToAboutPage(BuildContext context) {
    // 命名路由的跳转方式
    Navigator.of(context)
        .pushNamed(JRAboutPage.routeName, arguments: '首页给关于页的数据');
  }

  void _jumpToDetailPage2(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(JRDetailPage.routeName, arguments: '首页通过路由跳转的方式传递给详情页的数据');
  }

  void _jumpToSettingPage(BuildContext context) {
    Navigator.of(context).pushNamed('/setting');
  }
}
