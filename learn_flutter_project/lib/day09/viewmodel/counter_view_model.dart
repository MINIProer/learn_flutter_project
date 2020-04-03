import 'package:flutter/material.dart';

// 1.创建自己需要共享的数据
class JRCounterViewModel extends ChangeNotifier {
  int _counter = 99;

  int get counter {
    return _counter;
  }

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
