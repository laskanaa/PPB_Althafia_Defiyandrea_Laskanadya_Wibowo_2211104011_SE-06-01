import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> listContainer = [
      Container(
        height: 200,
        width: 200,
        color: Colors.red,
        child: const Center(
          child: Text('Item 1'),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        color: Colors.yellow,
        child: const Center(
          child: Text('Item 2'),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        color: Colors.black,
        child: const Center(
          child: Text('Item 3'),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        color: Colors.blue,
        child: const Center(
          child: Text('Item 4'),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        color: Colors.pink,
        child: const Center(
          child: Text('Item 5'),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add),
              const SizedBox(width: 10),
              const Text('Tambah widget'),
            ],
          ),

          // Bagian ListView
          Expanded(
            flex: 1, // Menggunakan lebih sedikit ruang untuk ListView
            child: ListView.builder(
              itemCount: listContainer.length,
              itemBuilder: (context, index) {
                return listContainer[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
