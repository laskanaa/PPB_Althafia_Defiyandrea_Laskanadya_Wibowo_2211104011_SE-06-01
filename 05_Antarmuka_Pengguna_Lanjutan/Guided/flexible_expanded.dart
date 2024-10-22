import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SliverDemo(),
    );
  }
}

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Sliver App Bar
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Demo'),
              background: FlutterLogo(), // Optional: Background in AppBar
            ),
          ),
          // Sliver Grid
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0, // Maximum width of each grid item
              mainAxisSpacing: 10.0, // Vertical spacing
              crossAxisSpacing: 10.0, // Horizontal spacing
              childAspectRatio: 4.0, // Width to height ratio
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)], // Color variation
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20, // Total number of grid items
            ),
          ),
          // Sliver Fixed List
          SliverFixedExtentList(
            itemExtent: 50.0, // Fixed height for each list item
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)], // Color variation
                  child: Text('List Item $index'),
                );
              },
              childCount: 10, // Total number of list items
            ),
          ),
        ],
      ),
    );
  }
}
