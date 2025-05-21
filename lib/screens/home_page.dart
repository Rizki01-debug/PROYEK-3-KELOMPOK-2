import 'package:flutter/material.dart';
import 'models/tanaman.dart';
import 'notification_page.dart';
import 'tambah_tanaman_page.dart';
import 'tambah_jadwal_page.dart';
import 'lihat_tanaman_page.dart';
import 'edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tanaman> daftarTanaman = [
    Tanaman(
      nama: 'Lidah Mertua',
      status: 'Mati',
      gambarPath: 'assets/images/lb.png',
      kelembaban: '29%',
    ),
    Tanaman(
      nama: 'Bonsai',
      status: 'Sehat',
      gambarPath: 'assets/images/bonsai.png',
      kelembaban: '45%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF6FADB),
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildKelembabanCard(),
            const SizedBox(height: 16),
            ...daftarTanaman.map((tanaman) => _buildTanamanCard(context, tanaman)).toList(),
            const SizedBox(height: 40),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildKelembabanCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 10,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.agriculture, size: 40),
            SizedBox(width: 16),
            Text(
              'Kelembaban Tanah\n28 %',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTanamanCard(BuildContext context, Tanaman tanaman) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                tanaman.gambarPath,
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tanaman.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      daftarTanaman.remove(tanaman);
                    });
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Status'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: tanaman.status == 'Sehat' ? Colors.green : Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tanaman.status,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Aktif saat Kelembaban Tanah'),
            Text(
              tanaman.kelembaban,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditTanamanPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildMiniButton(
            context,
            label: 'Tambah Tanaman',
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TambahTanamanPage()),
              );
            },
          ),
          const SizedBox(height: 10),
          _buildMiniButton(
            context,
            label: 'Tambah Jadwal',
            color: Colors.cyan,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TambahJadwalPage()),
              );
            },
          ),
          const SizedBox(height: 10),
          _buildMiniButton(
            context,
            label: 'Lihat Tanaman',
            color: Colors.indigo,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LihatTanamanPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMiniButton(BuildContext context,
      {required String label, required Color color, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(30, 40),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
