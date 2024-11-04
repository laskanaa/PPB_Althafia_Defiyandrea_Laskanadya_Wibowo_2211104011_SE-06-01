import 'package:flutter/material.dart';
import 'my.package.dart';
import 'my.buttomnav.dart';
import 'elebu.dart';
import 'my.tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabBar(), // Atur ke halaman awal
    );
  }
}

