import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Banyumas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Wisata Banyumas'),
      ),
      body: ListView(
        children: <Widget>[
          buildTouristSpot(
            context,
            'curug_jenggala.jpg', // Curug Jenggala
            'Curug Jenggala',
            'Di tengah pesona alam Banyumas, tersembunyi sebuah destinasi alami yang menakjubkan, yaitu Curug Jenggala. '
                'Salah satu daya tarik Curug Jenggala yang paling utama adalah keberadaan tiga air terjun berdampingan yang memukau. '
                'Ketiga air terjun ini menambahkan sentuhan magis pada lingkungan sekitarnya, sehingga menciptakan suasana '
                'yang menenangkan dan menakjubkan bagi para pengunjung. Dari ketinggian deck hati, pengunjung dapat menikmati '
                'panorama yang luar biasa dari ketiga air terjun yang saling berdampingan.',
            Colors.purple[100]!, // Background color
          ),
          buildTouristSpot(
            context,
            'Goa_Maria_Kaliori.jpg', // Goa Maria Kaliori
            'Goa Maria Kaliori',
            'Goa Maria Kaliori adalah tempat ziarah yang terletak di Banyumas, Jawa Tengah. '
                'Goa ini terkenal dengan suasana tenang dan keindahan alamnya yang menenangkan. '
                'Pengunjung dapat menikmati pengalaman spiritual dan pemandangan alam yang indah di sekitar goa.',
            Colors.blue[100]!, // Background color
          ),
          buildTouristSpot(
            context,
            'Pancuran_Pitu.jpg', // Pancuran Pitu
            'Pancuran Pitu',
            'Pancuran Pitu adalah tempat wisata alam yang menawarkan sumber air panas dengan tujuh pancuran. '
                'Tempat ini cocok untuk relaksasi dan menikmati keindahan alam. '
                'Pengunjung dapat merasakan kesegaran air panas sambil menikmati panorama sekitar yang indah.',
            Colors.green[100]!, // Background color
          ),
          buildTouristSpot(
            context,
            'Telaga_Sunyi.jpg', // Telaga Sunyi
            'Telaga Sunyi',
            'Telaga Sunyi adalah danau yang menawarkan suasana damai dan tenang. '
                'Dikelilingi oleh hutan dan pegunungan, tempat ini cocok untuk mereka yang mencari ketenangan '
                'dan keindahan alam yang masih alami.',
            Colors.teal[100]!, // Background color
          ),
        ],
      ),
    );
  }

  Widget buildTouristSpot(BuildContext context, String imageUrl, String name,
      String description, Color backgroundColor) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: backgroundColor, // Set background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl), // Menggunakan Image.asset
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
