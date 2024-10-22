import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RekomendasiWisata(),
    );
  }
}

class RekomendasiWisata extends StatelessWidget {
  final List<Wisata> wisataList = [
    Wisata(
      name: 'Curug Jenggala',
      description:
          'Destinasi alami yang menakjubkan dengan tiga air terjun berdampingan.',
      image: 'curug_jenggala.jpg',
    ),
    Wisata(
      name: 'Goa Maria Kaliori',
      description:
          'Tempat ziarah yang sejuk dan tenang, cocok untuk refleksi diri.',
      image: 'goa_maria_kaliori.jpg',
    ),
    Wisata(
      name: 'Pancuran Pitu',
      description:
          'Sumber air panas alami yang dipercaya bisa menyembuhkan berbagai penyakit.',
      image: 'pancuran_pitu.jpg',
    ),
    Wisata(
      name: 'Telaga Sunyi',
      description:
          'Telaga yang tenang dengan air jernih dan suasana sejuk di sekitar pegunungan.',
      image: '1.jpg',
    ),
  ];

  // List of colors to differentiate the background of each wisata item
  final List<Color> cardColors = [
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Rekomendasi Wisata Banyumas"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final wisata = wisataList[index];
                return Card(
                  color: cardColors[
                      index % cardColors.length], // Assign different color
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        wisata.image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          wisata.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(wisata.description),
                      ),
                    ],
                  ),
                );
              },
              childCount: wisataList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Wisata {
  final String name;
  final String description;
  final String image;

  Wisata({required this.name, required this.description, required this.image});
}
