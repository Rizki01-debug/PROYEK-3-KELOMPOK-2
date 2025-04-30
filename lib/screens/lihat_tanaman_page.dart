import 'package:flutter/material.dart';
import 'detail_tanaman_page.dart'; // Make sure to import the detail page

class LihatTanamanPage extends StatelessWidget {
  const LihatTanamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tanaman'),
        backgroundColor: const Color(0xFFF6FADB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildPlantCard(context, 'Lidah mertua', 'assets/images/lidah_mertua.png'),
            _buildPlantCard(context, 'Peace lily', 'assets/images/peace_lily.png'),
            _buildPlantCard(context, 'Kaktus telinga kelinci', 'assets/images/kaktus.png'),
            _buildPlantCard(context, 'Bonsai', 'assets/images/bonsai.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCard(BuildContext context, String plantName, String imagePath) {
    // Add plant descriptions
    final plantDescriptions = {
      'Lidah mertua': 'Tanaman Lidah Mertua (Sansevieria) adalah tanaman hias yang tahan banting dan dikenal sebagai tanaman pembersih udara. Asalnya dari Afrika Barat, tanaman ini sangat populer karena perawatannya yang mudah.',
      'Peace lily': 'Tanaman Peace Lily, atau Spathiphyllum, adalah tanaman hias populer yang berasal dari hutan hujan tropis Kolombia dan Venezuela. Dikenal dengan bunga putihnya yang anggun, tanaman ini juga memiliki manfaat dalam menyegarkan udara dan meningkatkan suasana ruangan.',
      'Kaktus telinga kelinci': 'Kaktus Telinga Kelinci (Opuntia microdasys) adalah jenis kaktus yang berasal dari Meksiko. Dinamakan demikian karena bentuknya yang menyerupai telinga kelinci. Tanaman ini sangat tahan terhadap kekeringan.',
      'Bonsai': 'Bonsai adalah seni mengkerdilkan pohon dalam pot dangkal dengan teknik pemangkasan dan pembentukan yang khusus. Seni ini berasal dari Jepang dan membutuhkan kesabaran serta ketelatenan dalam perawatannya.',
    };

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              plantName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailTanamanPage(
                      plantName: plantName,
                      plantImage: imagePath,
                      plantDescription: plantDescriptions[plantName] ?? '',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(100, 30),
              ),
              child: const Text(
                'Lihat selengkapnya →',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}