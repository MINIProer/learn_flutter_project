import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text(
            '导航栏标题',
            textDirection: TextDirection.ltr,
          )
        ),
      body: Center(
        child: Text(
          'Hello Flutter',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 30, 
              color: Colors.red
            ),
          ),
        ),
      )
    )
  );
}