import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  String? nama;
  String? nim;
  String? kelas;
  String? prodi;

  @override
  void initState() {
    super.initState();
    _listenToNotificationData();
  }

  void _listenToNotificationData() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        setState(() {
          nama = message.data['nama'] ?? 'Nama tidak tersedia';
          nim = message.data['nim'] ?? 'NIM tidak tersedia';
          kelas = message.data['kelas'] ?? 'Kelas tidak tersedia';
          prodi = message.data['prodi'] ?? 'Prodi tidak tersedia';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Notifikasi'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: nama == null
            ? const Text('Belum ada notifikasi yang diterima.')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nama: $nama'),
                  Text('NIM: $nim'),
                  Text('Kelas: $kelas'),
                  Text('Prodi: $prodi'),
                ],
              ),
      ),
    );
  }
}
