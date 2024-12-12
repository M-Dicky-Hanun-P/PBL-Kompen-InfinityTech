import 'package:flutter/material.dart';
import 'package:sikomti_app/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailTugasYangTersediaPage extends StatelessWidget {
  final ValueChanged<bool> onStatusChanged;
  final Map<String, dynamic> task; // Data tugas yang diterima
  final User user;
  final String username;

  const DetailTugasYangTersediaPage({
    super.key,
    required this.onStatusChanged,
    required this.task,
    required this.user,
    required this.username,
  });

// Fungsi untuk memformat tanggal
  String formatDate(String? dateString) {
    if (dateString == null) return 'Tanggal Tidak Diketahui';

    try {
      // Inisialisasi format tanggal untuk bahasa Indonesia
      initializeDateFormatting('id_ID');

      DateTime dateTime = DateTime.parse(dateString);
      // Format: Senin, 07 Desember 2024 14:30
      return DateFormat('EEEE, dd MMMM yyyy HH:mm', 'id_ID').format(dateTime);
    } catch (e) {
      return 'Format Tanggal Invalid';
    }
  }

  // Fungsi untuk mendapatkan nilai dari task dengan pengecekan null
String getTaskField(dynamic task, String key, {String defaultValue = 'Data Tidak Diketahui'}) {
  if (task == null) return defaultValue;
  
  if (task is Map<String, dynamic>) {
    final value = task[key];
    if (value != null) {
      return value.toString();
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
    String jenisPenugasan = getTaskField(task, 'jenis_penugasan');
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
                builder: (context) =>
                    LihatKompenPage(user: user, username: username),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailCard(
                'Nama Penugasan Kompen:',
                getTaskField(task, 'nama_tugas'),
                Icons.assignment,
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Jenis Penugasan:',
                jenisPenugasan,
                  Icons.app_registration_sharp,
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Deskripsi:',
                getTaskField(task, 'deskripsi'),
                Icons.description,
              ),
              const SizedBox(height: 5),
              buildDetailCard(
                'Tanggal Mulai: ',
                formatDate(task['tanggal_mulai']),
                Icons
                    .calendar_today_rounded, // Icon kalender untuk tanggal mulai
              ),
              const SizedBox(height: 5),
              buildDetailCard(
                'Tanggal Selesai: ',
                formatDate(task['tanggal_selesai']),
                Icons
                    .event_available_rounded, // Icon kalender dengan tanda centang untuk tanggal selesai
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Pemberi Tugas:',
                pemberiTugas,
                Icons.person,
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Bidang Keahlian:',
                bidangKeahlian,
                Icons.school,
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Jam Kompen:',
                getTaskField(task, 'jam_kompen'),
                Icons.access_time,
              ),
              const SizedBox(height: 5), // Jarak antar kartu
              buildDetailCard(
                'Kuota:',
                getTaskField(task, 'kuota'),
                Icons.group,
              ),
              const SizedBox(
                  height: 10), // Jarak antara kartu terakhir dan tombol
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    onStatusChanged(true);
                    _showApplyDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 249, 16, 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    minimumSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 14.0,
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
      margin: const EdgeInsets.symmetric(vertical: 5), // Margin antar kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            const SizedBox(width: 10), // Jarak antara ikon dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5), // Jarak antara judul dan nilai
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
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
