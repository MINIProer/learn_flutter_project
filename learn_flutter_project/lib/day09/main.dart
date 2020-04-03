import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter_project/day09/viewmodel/counter_view_model.dart';
import 'package:learn_flutter_project/day09/viewmodel/user_info_view_model.dart';
import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';
import 'package:provider/provider.dart';

/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其他位置使用共享的数据
 *   3.1 provider.of的方法来获取数据
 *   3.2 consumer的方法来修改数据
 */

main() {
  // 2.在应用程序的顶层ChangeNotifierProvider
  runApp(
      // ChangeNotifierProvider(
      //   create: (ctx) {
      //     return JRCounterViewModel();
      //   },
      //   child: MyApp(),
      // )
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => JRCounterViewModel()),
      ChangeNotifierProvider(create: (ctx) => JRUserInfoViewModel()),
    ],
    child: MyApp(),
  ));
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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('InheritedWidget')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[JRShowData01(), JRShowData02(), JRShowData03()],
          ),
        ),
        floatingActionButton: Selector<JRCounterViewModel, JRCounterViewModel>(
          // 后面的JRCounterViewModel可以改变成其他类型，来达到类型转换的目的
          selector: (ctx, counterVM) {
            return counterVM;
          },
          shouldRebuild: (prev, next) {
            return false;
          },
          builder: (ctx, counterVM, child) {
            print('floatingActionButton build方法被执行');
            return FloatingActionButton(
                child: child,
                onPressed: () {
                  counterVM.counter++;
                });
          },
          child: Icon(Icons.add),
        ));
  }
}

// Consumer<JRCounterViewModel>(
//             builder: (ctx, counterVM, child) {
//             print('floatingActionButton build方法被执行');
//             return FloatingActionButton(
//                 child: child,
//                 onPressed: () {
//                   counterVM.counter++;
//                 });
//             },
//             child: Icon(Icons.add),
//       )

class JRShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3.在其他位置使用共享的数据
    int _counter = Provider.of<JRCounterViewModel>(context).counter;

    print('data01的build方法');

    return Card(
      color: Colors.cyan,
      child: Text(
        '当前计数 = $_counter',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class JRShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('data01的build方法');

    return Container(
      color: Colors.orange,
      child: Consumer<JRCounterViewModel>(builder: (ctx, counterVM, child) {
        return Text(
          '当前计数 = ${counterVM.counter}',
          style: TextStyle(fontSize: 30),
        );
      }),
    );
  }
}

class JRShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer2<JRUserInfoViewModel, JRCounterViewModel>(
        builder: (ctx, userInfoVM, counterVM, child) {
      return Text('用户名 = ${userInfoVM.user.name}、得分 = ${counterVM.counter}', style: TextStyle(fontSize: 30),);
    }));
  }
}

// 就简洁性而言，01的代码要比02更简洁，但是开发中更常使用的是02中consumer的写法
// 比较：Provider.of 和 Consumer
// 01代码：只要数据发生改变，那么01中整个build方法就会执行
// 02代码（相对推荐）：当Provider中的数据发生改变时，执行重新执行Consumer的builder

// 注意：因为floatingActionButton也同样依赖于VM，所以当数据发生改变时，Consumer的builder也会被执行，他内部的子组件都会重新刷新一次，很没有必要
//      所以，优化方法，就是使用Consumer的child参数来传递子组件，这样就不会出现上述问题

// 注意2：第二个优化就是floatActionButton也同样不需要重新构建，所以，用Selector来代替Consumer
// Selector的作用
// 1、对原有的JRCounterViewModel进行一个转换
// 2、shouldRebuild方法：是否需要重新构建，返回false就不会重新构建

// 如果单纯依赖数据，那么使用Consumer
// 如果想要动态修改数据，那么使用Selector
// Consumer & Selector 二者根据需求搭配使用

// 如果需要管理多种数据需要共享的话，一个provider肯定不够
// 上面的ChangeNotifierProvider的方式来嵌套可以实现，但是嵌套层级过多
// 所以使用MultiProvider来实现

// 03中：如果不仅仅想要获取userInfo的信息，还想获取counter的信息的话，需要使用Consumer2来实现【Consumer3、4、5、6】
