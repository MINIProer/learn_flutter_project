import 'package:flutter/material.dart';
import 'package:learn_flutter_project/day09/model/user_info_model.dart';

class JRUserInfoViewModel extends ChangeNotifier {
  JRUser _user = JRUser(name: 'JR', age: 18);

  JRUser get user => _user;

  set user(JRUser user) {
    _user = user;
    notifyListeners();
  }
}
