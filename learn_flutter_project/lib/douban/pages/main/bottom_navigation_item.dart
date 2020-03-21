import 'package:flutter/material.dart';

class JRBottomNavigationBarItem extends BottomNavigationBarItem {
  JRBottomNavigationBarItem(String iconName, String title) : super(
    icon: Image.asset('assets/images/tabbar/$iconName.png', width: 30),
    activeIcon: Image.asset('assets/images/tabbar/${iconName}_active.png', width: 30, gaplessPlayback: true,),
    title: Text(title)
  );
}

// gaplessPlayback: true -》该属性设置是防止图片点击闪烁