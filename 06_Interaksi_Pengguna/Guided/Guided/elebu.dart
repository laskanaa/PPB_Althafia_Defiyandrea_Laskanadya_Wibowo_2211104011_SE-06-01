import 'package:flutter/material.dart';

class EleBu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Elevated Button')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aksi saat tombol ditekan
            print('Tombol Elevated ditekan!');
          },
          child: Text('Klik Saya'),
        ),
      ),
    );
  }
}
