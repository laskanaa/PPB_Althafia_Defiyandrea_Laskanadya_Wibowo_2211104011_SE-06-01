import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contoh TabBar'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Konten Tab 1')),
            Center(child: Text('Konten Tab 2')),
            Center(child: Text('Konten Tab 3')),
          ],
        ),
      ),
    );
  }
}
