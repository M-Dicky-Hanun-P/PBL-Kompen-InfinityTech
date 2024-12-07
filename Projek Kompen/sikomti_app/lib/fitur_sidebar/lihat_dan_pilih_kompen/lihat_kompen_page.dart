import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sikomti_app/dashboard/home_page.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';
import 'detail_tugas_yang_tersedia.dart';

class LihatKompenPage extends StatefulWidget {
  final User user;

  const LihatKompenPage({super.key, required this.user});

  @override
  _LihatKompenPageState createState() => _LihatKompenPageState();
}

class _LihatKompenPageState extends State<LihatKompenPage> {
  List<Map<String, dynamic>> _tasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/tugas?dibuka'),
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          _tasks = data.map((task) {
            return {
              'nama_tugas': task['nama_tugas'] ?? 'Tugas Tidak Diketahui',
              'deskripsi': task['deskripsi'] ?? 'Deskripsi Tidak Diketahui',
              'pemberi_tugas':
                  task['pemberi_tugas']['username'] ?? 'Tidak Diketahui',
              'bidang_kompetensi':
                  task['bidang_kompetensi']['nama_bidkom'] ?? 'Tidak Diketahui',
              'jam_kompen': task['jam_kompen'] ?? 'Jam Tidak Diketahui',
              'kuota': task['kuota'] ?? 'Kuota Tidak Diketahui',
            };
          }).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching tasks: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas yang Tersedia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(user: widget.user),
              ),
            );
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(17.0),
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task['nama_tugas'],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Pemberi Tugas: ${task['pemberi_tugas']}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(189, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      'Bidang Keahlian: ', // Teks yang tidak miring
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight:
                                        FontWeight.normal, // Teks normal
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${task['bidang_kompetensi']}', // Teks bidang_kompetensi yang miring
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontStyle: FontStyle
                                        .italic, // Menjadikan teks ini miring
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Kuota: ${task['kuota']}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(189, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment
                                .bottomRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 56, 149, 255),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0,
                                ),
                                minimumSize: const Size(100, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailTugasYangTersediaPage(
                                      user: widget.user,
                                      task: task,
                                      onStatusChanged: (status) {
                                        // Jika ada logika untuk memperbarui status, tambahkan di sini
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
