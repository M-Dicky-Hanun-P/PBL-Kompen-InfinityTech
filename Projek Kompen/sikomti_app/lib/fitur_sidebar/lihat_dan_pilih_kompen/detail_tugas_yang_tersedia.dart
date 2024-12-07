import 'package:flutter/material.dart';
import 'package:sikomti_app/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';

class DetailTugasYangTersediaPage extends StatelessWidget {
  final ValueChanged<bool> onStatusChanged;
  final Map<String, dynamic> task; // Data tugas yang diterima
  final User user;

  const DetailTugasYangTersediaPage({
    super.key,
    required this.onStatusChanged,
    required this.task,
    required this.user,
  });

  // Fungsi untuk mendapatkan nilai dari task dengan pengecekan null
  String getTaskField(dynamic task, String key,
      {String defaultValue = 'Data Tidak Diketahui'}) {
    if (task is Map<String, dynamic>) {
      if (task.containsKey(key) && task[key] != null) {
        return task[key].toString();
      }
    } else if (task is String) {
      return task;
    }
    return defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    String bidangKeahlian =
        getTaskField(task['bidang_kompetensi'], 'nama_bidkom');
    String pemberiTugas = getTaskField(task['pemberi_tugas'], 'username');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Tugas yang Tersedia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LihatKompenPage(user: user),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailCard(
                'Jenis Penugasan Kompen:',
                getTaskField(task, 'nama_tugas'),
                Icons.assignment,
              ),
              buildDetailCard(
                'Deskripsi:',
                getTaskField(task, 'deskripsi'),
                Icons.description,
              ),
              buildDetailCard(
                'Pemberi Tugas:',
                pemberiTugas,
                Icons.person,
              ),
              buildDetailCard(
                'Bidang Keahlian:',
                bidangKeahlian,
                Icons.school,
              ),
              buildDetailCard(
                'Jam Kompen:',
                getTaskField(task, 'jam_kompen'),
                Icons.access_time,
              ),
              buildDetailCard(
                'Kuota:',
                getTaskField(task, 'kuota'),
                Icons.group,
              ),
              const SizedBox(height: 1),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    onStatusChanged(true);
                    _showApplyDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 249, 16, 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                      
                    ),
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card untuk detail tugas
  Widget buildDetailCard(String title, String value, IconData icon) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 5),
                  Text(value,
                      style: const TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up dialog
  void _showApplyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            // Header Pop-Up
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Pemberitahuan',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Isi Pop-Up
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color.fromARGB(255, 252, 112, 65),
                    size: 90,
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Tugas hanya bisa di apply pada aplikasi website.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol OK
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Menutup dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0074D9),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
