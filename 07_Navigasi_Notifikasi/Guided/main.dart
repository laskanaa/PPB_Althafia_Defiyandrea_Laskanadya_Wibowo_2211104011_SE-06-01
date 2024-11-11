import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.amber,
        ),
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    // Pengaturan untuk Android
    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs'); // Ganti dengan ikon Anda

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // Inisialisasi Flutter Local Notifications
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Fungsi untuk menampilkan notifikasi
  showNotification() async {
    var android = AndroidNotificationDetails(
      'id', // ID Channel
      'channel', // Nama Channel
      channelDescription: 'description', // Deskripsi Channel
      priority: Priority.high, // Prioritas tinggi
      importance: Importance.max, // Pentingnya notifikasi
      ticker: 'ticker', // Ticker untuk notifikasi
    );
    var platform = NotificationDetails(android: android);

    // Menampilkan notifikasi
    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi
      'Flutter devs', // Judul notifikasi
      'Flutter Local Notification Demo', // Isi notifikasi
      platform, // Detil platform
      payload: 'Welcome to the Local Notification demo!', // Payload tambahan
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Flutter notification demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: showNotification,
              child: Text('Show Notification'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
