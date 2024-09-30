import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biography',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 76, 94, 252)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Biography'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          // Mengubah latar belakang gradient
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 34, 14, 78),
              Color.fromARGB(255, 46, 13, 13),
              Color.fromARGB(255, 14, 15, 54),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('../assets/photo.jpg'), // masukan foto profil
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nama: Althafia Defiyandrea Laskanadya Wibowo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 176, 231)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email: laskanadya@gmail.com',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 255, 176, 231)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Telepon: +6285328805675',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 255, 176, 231)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Alamat: Paguyangan, Brebes',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 255, 176, 231)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Majoring: S1 Software Engineering at Telkom University Purwokerto',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 255, 176, 231)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color.fromARGB(255, 14, 15, 54),
                  ),
                  child: const Text('Call Me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
