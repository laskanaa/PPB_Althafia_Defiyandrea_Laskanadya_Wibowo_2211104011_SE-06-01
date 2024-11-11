import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Form ke Beranda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define pages for each tab
  static final List<Widget> _pages = <Widget>[
    _FormPage(),
    Center(child: Text('Selamat Datang di Beranda')),
    Center(child: Text('Ini Halaman Profil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToHome() {
    setState(() {
      _selectedIndex = 1; // Change to "Beranda" page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigasi Form ke Beranda'),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Form page widget
class _FormPage extends StatelessWidget {
  const _FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan Nama',
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan NIM',
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Change selected tab to "Beranda" when the button is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Form Submitted! Navigating to Beranda...')),
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Submit & Ke Beranda'),
          ),
        ],
      ),
    );
  }
}
