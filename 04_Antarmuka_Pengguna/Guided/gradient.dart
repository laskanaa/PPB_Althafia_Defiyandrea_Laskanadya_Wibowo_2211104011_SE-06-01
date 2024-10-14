import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack with Gradient and Text'),
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: <Widget>[
                // Background Container
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
                ),
                
                // Foreground with gradient and text
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0), // Transparent at the top
                        Colors.black12,            // Light shadow in the middle
                        Colors.black45,            // Dark shadow at the bottom
                      ],
                    ),
                  ),
                  child: const Text(
                    'Foreground Text',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

