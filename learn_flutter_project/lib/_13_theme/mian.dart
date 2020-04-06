
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

/**
 * 主题的作用：
 *  1.一旦设置了主题，那么应用程序中某些Widget，就会直接使用主题的样式
 *  2.可以通过Theme.of(context).textTheme.display2
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: JRHomePage(),
      theme: ThemeData(
        // 1.亮度(很少设置)
        brightness: Brightness.light,
        // 2.primarySwatch传入的不是一个Color，而是MaterialColor(包含了primaryColor和accentColor)
        primarySwatch: Colors.red,
        // 3.primaryColor(导航和TabBar的颜色)
        primaryColor: Colors.blue,
        // 4.accentColor:除了导航和TabBar以外的某些Widget的颜色
        accentColor: Colors.green,
        // 5.设置按钮的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10
        )
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.grey
      ),
    );
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
        child: Column(
          children: <Widget>[
            Text('Theme主题', style: TextStyle(fontSize: 30),),
            Switch(value: true, onChanged: (value){

            }),
            // iOS风格的switch的颜色不根据主题风格来改变，需要手动设置
            CupertinoSwitch(value: true, activeColor: Colors.red, onChanged: (value){

            }),
            RaisedButton(
              child: Text('1'),
              onPressed: (){

              }
            )
          ],
        )   
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类')
          )
        ]
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: Colors.cyan
          )
        ), 
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

          }
        )
      ),
    );
  }
}
