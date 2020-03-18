import 'package:flutter/material.dart';
import 'bottom_navigation_item.dart';
import 'package:learn_flutter_project/douban/pages/home/home.dart';
import 'package:learn_flutter_project/douban/pages/subject/subject.dart';
import 'package:learn_flutter_project/douban/pages/group/group.dart';
import 'package:learn_flutter_project/douban/pages/mall/mall.dart';
import 'package:learn_flutter_project/douban/pages/profile/profile.dart';

/*- 配置TabBar -*/
List<Map> configList = [
  {
    'icon': 'home',
    'title': '首页',
  },
  {
    'icon': 'subject',
    'title': '书影音',
  },
  {
    'icon': 'group',
    'title': '小组',
  },
  {
    'icon': 'mall',
    'title': '市集',
  },
  {
    'icon': 'profile',
    'title': '我的',
  },
];

List<JRBottomNavigationBarItem> buildBottomNavigationBar(List<Map> configList) {
  List<JRBottomNavigationBarItem> items = [];

  for (int i = 0; i < configList.length; i++) {
    Map config = configList[i];
    items.add(JRBottomNavigationBarItem(config['icon'], config['title']));
  }

  return items;
}

List<JRBottomNavigationBarItem> items = buildBottomNavigationBar(configList);

/*- 配置TabBar对应Page -*/
List<Widget> pages = [
  JRHomePage(),
  JRSubjectPage(),
  JRGroupPage(),
  JRMallPage(),
  JRProfilePage()
];
