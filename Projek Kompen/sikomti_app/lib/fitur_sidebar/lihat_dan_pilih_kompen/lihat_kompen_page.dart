import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sikomti_app/dashboard/home_page.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';
import 'package:sikomti_app/services/auth_service.dart';
import 'detail_tugas_yang_tersedia.dart';

class LihatKompenPage extends StatefulWidget {
  final User user;
  final String username;

  const LihatKompenPage(
      {super.key, required this.user, required this.username});

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
      final token = await AuthService.getToken();
      print('TOKEN $token');
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8000/api/tugas/'), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json', // Add this header
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        List<Map<String, dynamic>> allTasks = [];

        // Process tugas_dosen
        if (responseData.containsKey('tugas_dosen') &&
            responseData['tugas_dosen'] != null) {
          final List<dynamic> dosenTasks = responseData['tugas_dosen'];
          allTasks
              .addAll(dosenTasks.map((task) => _processTask(task, 'Dosen')));
        }

        // Process tugas_admin
        if (responseData.containsKey('tugas_admin') &&
            responseData['tugas_admin'] != null) {
          final List<dynamic> adminTasks = responseData['tugas_admin'];
          allTasks
              .addAll(adminTasks.map((task) => _processTask(task, 'Admin')));
        }

        // Process tugas_tendik
        if (responseData.containsKey('tugas_tendik') &&
            responseData['tugas_tendik'] != null) {
          final List<dynamic> tendikTasks = responseData['tugas_tendik'];
          allTasks
              .addAll(tendikTasks.map((task) => _processTask(task, 'Tendik')));
        }

        setState(() {
          _tasks = allTasks;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _tasks = [];
        _isLoading = false;
      });
      print('Error fetching tasks: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal memuat data: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Map<String, dynamic> _processTask(
      Map<String, dynamic> task, String taskType) {
    // Deklarasi variabel terlebih dahulu
    String pemberiTugas = 'Tidak Diketahui';
    String jenisPenugasan = 'Tidak Diketahui';

    // Cek pemberi tugas
    if (task['pemberi_tugas'] != null) {
      pemberiTugas = '${task['pemberi_tugas']['username']} ($taskType)';
    }

    // Cek jenis penugasan berdasarkan taskType
    if (taskType == 'Admin' && task['jenis_penugasan_admin'] != null) {
      jenisPenugasan = task['jenis_penugasan_admin']['jenis_kompen'];
    } else if (taskType == 'Dosen' && task['jenis_penugasan_dosen'] != null) {
      jenisPenugasan = task['jenis_penugasan_dosen']['jenis_kompen'];
    } else if (taskType == 'Tendik' && task['jenis_penugasan_tendik'] != null) {
      jenisPenugasan = task['jenis_penugasan_tendik']['jenis_kompen'];
    }

    return {
      'nama_tugas': task['nama_tugas'] ?? 'Tugas Tidak Diketahui',
      'deskripsi': task['deskripsi'] ?? 'Deskripsi Tidak Diketahui',
      'tanggal_mulai': task['tanggal_mulai'] ?? 'Tanggal Tidak Diketahui',
      'tanggal_selesai': task['tanggal_selesai'] ?? 'Tanggal Tidak Diketahui',
      'pemberi_tugas': pemberiTugas,
      'jenis_penugasan':
          jenisPenugasan, // Sekarang menggunakan satu field jenis_penugasan
      'bidang_kompetensi': task['bidang_kompetensi'] != null
          ? task['bidang_kompetensi']['nama_bidkom'] ?? 'Tidak Diketahui'
          : 'Tidak Diketahui',
      'jam_kompen': task['jam_kompen']?.toString() ?? 'Jam Tidak Diketahui',
      'kuota': task['kuota']?.toString() ?? 'Kuota Tidak Diketahui',
      'jenis_pemberi': taskType,
      'status': task['status'] ?? 'Status Tidak Diketahui',
    };
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
                builder: (context) =>
                    HomePage(user: widget.user, username: widget.username),
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
                            alignment: Alignment.bottomRight,
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
                                      username: widget.username,
                                      task: task,
                                      onStatusChanged: (status) {
                                        //
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
