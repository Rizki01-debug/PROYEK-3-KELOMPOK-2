import 'package:flutter/material.dart';

class DetailTanamanPage extends StatelessWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;

  const DetailTanamanPage({
    super.key,
    required this.plantName,
    required this.plantImage,
    required this.plantDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: const Color(0xFFF6FADB),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  plantImage,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Plant Description
            Text(
              plantDescription,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            
            // Care Information Section
            _buildInfoSection(
              title: "Perawatan",
              items: [
                "Sinar: Tidak langsung, teduh parsial",
                "Air: Siram saat tanah kering",
                "Kelembaban: 40-60%",
                "Suhu: 18-27°C",
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Additional Info Section
            _buildInfoSection(
              title: "Informasi Tambahan",
              items: [
                "Tinggi: 30-90 cm",
                "Toxic: Ya (untuk hewan peliharaan)",
                "Perbanyakan: Pembagian rumpun",
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add edit functionality
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildInfoSection({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• "),
              Expanded(child: Text(item)),
            ],
          ),
        )),
      ],
    );
  }
}