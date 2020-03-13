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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class JRHomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  bool isSelect = false;
  Widget selectIcon = Icon(Icons.favorite, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: <Widget>[
        Image.asset('assets/images/fuck.jpg'),
        Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                color: Color.fromARGB(150, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '这是一个Text组件',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    IconButton(
                        icon: this.selectIcon,
                        onPressed: () {
                          this.isSelect = !this.isSelect;
                          print(this.isSelect);
                          setState(() {
                            this.selectIcon = this.isSelect
                                ? Icon(Icons.favorite, color: Colors.red)
                                : Icon(Icons.favorite, color: Colors.white);
                          });
                        })
                  ],
                ))),
      ],
    );
  }
}

class JRFlexibleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      // textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Flexible(
            fit: FlexFit.tight,
            child: Container(width: 100, height: 50, color: Colors.red)),
        Container(width: 30, height: 60, color: Colors.green),
        Container(width: 50, height: 80, color: Colors.yellow),
        Container(width: 100, height: 200, color: Colors.cyan),
      ],
    );
  }
}

/**
 * Expanded相当于Flexible的fit属性为FlexFit.tight
 */
class JRExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      // textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Expanded(child: Container(width: 100, height: 50, color: Colors.red)),
        Container(width: 30, height: 60, color: Colors.green),
        Container(width: 50, height: 80, color: Colors.yellow),
        Container(width: 100, height: 200, color: Colors.cyan),
      ],
    );
  }
}

/**
 * Stack：
 *  1.大小默认是包裹内容的
 *  2.alignment属性是指从什么位置开始排布所有的子Widget
 *  3.fit：expand将子元素拉伸到尽可能大
 *  4.overflow：超出部分该如何处理
 */

class JRStackDemo extends StatelessWidget {
  bool isSelect = false;
  Widget selectIcon = Icon(Icons.favorite, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: <Widget>[
        Image.asset('assets/images/fuck.jpg'),
        Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                color: Color.fromARGB(150, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '这是一个Text组件',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    IconButton(
                        icon: this.selectIcon,
                        onPressed: () {
                          this.isSelect = !this.isSelect;
                          print(this.isSelect);
                          this.selectIcon = this.isSelect
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite, color: Colors.white);
                        })
                  ],
                ))),
      ],
    );
  }
}
