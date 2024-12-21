import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:sikomti_app/services/auth_service.dart';

class UploadProgress extends StatefulWidget {
  final String username;

  const UploadProgress({super.key, required this.username});

  @override
  State<UploadProgress> createState() => _UploadProgressState();
}

class TugasKompen {
  final int idTugasKompen;
  final int idJenisKompen;
  final String username;
  final List<String> progress;
  final Tugas tugas;

  TugasKompen({
    required this.idTugasKompen,
    required this.idJenisKompen,
    required this.username,
    required this.progress,
    required this.tugas,
  });

  factory TugasKompen.fromJson(Map<String, dynamic> json) {
    var tugasJson = json['tugas'] as Map<String, dynamic>;
    return TugasKompen(
      idTugasKompen: json['id_tugas_kompen'],
      idJenisKompen: json['id_jenis_kompen'],
      username: json['username'],
      progress: List<String>.from(json['progress']),
      tugas: Tugas.fromJson(tugasJson),
    );
  }
}

class Tugas {
  final Dosen dosen;
  final Admin admin;
  final Tendik tendik;

  Tugas({required this.dosen, required this.admin, required this.tendik});

  factory Tugas.fromJson(Map<String, dynamic> json) {
    return Tugas(
      dosen: Dosen.fromJson(json['dosen']),
      admin: Admin.fromJson(json['admin']),
      tendik: Tendik.fromJson(json['tendik']),
    );
  }
}

class Dosen {
  final String? namaTugas;
  final String? jenisKompen;
  final String? deskripsi;
  final int? jamKompen;
  final int? kuota;
  final String? pemberiTugas;

  Dosen({
    this.namaTugas,
    this.jenisKompen,
    this.deskripsi,
    this.jamKompen,
    this.kuota,
    this.pemberiTugas,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) {
    return Dosen(
      namaTugas: json['nama_tugas'],
      jenisKompen: json['jenis_kompen'],
      deskripsi: json['deskripsi'],
      jamKompen: json['jam_kompen'],
      kuota: json['kuota'],
      pemberiTugas: json['pemberiTugas'],
    );
  }
}

class Admin {
  final String? namaTugas;
  final String? jenisKompen;
  final String? deskripsi;
  final int? jamKompen;
  final int? kuota;
  final String? pemberiTugas;

  Admin({
    this.namaTugas,
    this.jenisKompen,
    this.deskripsi,
    this.jamKompen,
    this.kuota,
    this.pemberiTugas,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      namaTugas: json['nama_tugas'],
      jenisKompen: json['jenis_kompen'],
      deskripsi: json['deskripsi'],
      jamKompen: json['jam_kompen'],
      kuota: json['kuota'],
      pemberiTugas: json['pemberiTugas'],
    );
  }
}

class Tendik {
  final String? namaTugas;
  final String? jenisKompen;
  final String? deskripsi;
  final int? jamKompen;
  final int? kuota;
  final String? pemberiTugas;

  Tendik({
    this.namaTugas,
    this.jenisKompen,
    this.deskripsi,
    this.jamKompen,
    this.kuota,
    this.pemberiTugas,
  });

  factory Tendik.fromJson(Map<String, dynamic> json) {
    return Tendik(
      namaTugas: json['nama_tugas'],
      jenisKompen: json['jenis_kompen'],
      deskripsi: json['deskripsi'],
      jamKompen: json['jam_kompen'],
      kuota: json['kuota'],
      pemberiTugas: json['pemberiTugas'],
    );
  }
}

class _UploadProgressState extends State<UploadProgress> {
  late String data; // Inisialisasi data sebagai string kosong
  bool isLoading = true; // Menandakan apakah data masih di-loading

  @override
  void initState() {
    super.initState();
    _fetchProgressData();
  }

  // Fungsi untuk mengambil data dari API
  Future<void> _fetchProgressData() async {
    final token = await AuthService.getToken();
    print('TOKEN $token');
    final response = await http.get(
        Uri.parse(
            'http://10.0.2.2:8000/api/progres?username=${widget.username}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        });

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedData = json.decode(response.body);
        if (parsedData['data'] != '' && parsedData['data'].isNotEmpty) {
          setState(() {
            data = response.body; // Menyimpan data sebagai string JSON
            isLoading = false; // Data berhasil dimuat
          });
        } else {
          setState(() {
            isLoading = false;
          });
          _showErrorPopup('No data available for this user');
        }
      } else {
        // Tangani error jika status code bukan 200
        setState(() {
          isLoading = false;
        });
        _showErrorPopup('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorPopup('Error: $e');
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      'Progres tugas hanya bisa di update pada aplikasi website.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0074D9),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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
            ],
          ),
        );
      },
    );
  }

  // Menampilkan popup error
  void _showErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 90,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0074D9),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Upload Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
      ),
      backgroundColor: const Color(0xFFF6F8FB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(
                child:
                    CircularProgressIndicator()) // Tampilkan loading spinner saat data masih dimuat
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<Map<String, dynamic>>(
                    future: _parseJsonData(data),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available'));
                      } else {
                        final parsedData = snapshot.data!;
                        final tugasData = parsedData['data']?[0]['tugas'] ?? {};
                        final dosenTugas = tugasData['dosen'] ?? {};
                        final tendikTugas = tugasData['tendik'] ?? {};
                        final adminTugas = tugasData['admin'] ??
                            {}; // Mengambil data admin jika ada

                        // Mengambil progress
                        final progressValue =
                            (parsedData['data']?[0]['progress']?[0] ?? '0%')
                                .replaceAll('%', '');
                        final progress = double.tryParse(progressValue) ?? 0;

                        // Menampilkan data hanya jika tidak null
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nama Penugasan:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${(dosenTugas['nama_tugas'] ?? '')}${(tendikTugas['nama_tugas'] ?? '')}${(adminTugas['nama_tugas'] ?? '')}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Jenis Penugasan Kompen:',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${(dosenTugas['jenisPenugasanDosen'] ?? {})['jenis_kompen'] ?? ''}${(tendikTugas['jenisPenugasanTendik'] ?? {})['jenis_kompen'] ?? ''}${(adminTugas['jenisPenugasanAdmin'] ?? {})['jenis_kompen'] ?? ''}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 60.0,
                                      lineWidth: 17.0,
                                      percent: progress / 100,
                                      center: Text(
                                        '$progressValue%',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      progressColor: Colors.blue,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Your Progress',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 1,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Deskripsi:',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${(dosenTugas['deskripsi'] ?? '')}${(tendikTugas['deskripsi'] ?? '')}${(adminTugas['deskripsi'] ?? '')}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const Text(
                                              'Pemberi Tugas:',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 4),
                                            Flexible(
                                              child: Text(
                                                '${(dosenTugas['pemberiTugas'] ?? '')}${(tendikTugas['pemberiTugas'] ?? '')}${(adminTugas['pemberiTugas'] ?? '')}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                overflow: TextOverflow
                                                    .ellipsis, // Menghindari overflow
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const Text(
                                              'Jam Kompen:',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 4),
                                            Flexible(
                                              child: Text(
                                                '${(dosenTugas['jam_kompen'] ?? '')}${(tendikTugas['jam_kompen'] ?? '')}${(adminTugas['jam_kompen'] ?? '')}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const Text(
                                              'Kuota:',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 4),
                                            Flexible(
                                              child: Text(
                                                '${(dosenTugas['kuota'] ?? '')}${(tendikTugas['kuota'] ?? '')}${(adminTugas['kuota'] ?? '')}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 13),
                  Center(
                    child: ElevatedButton(
                      onPressed: _showSuccessPopup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 250, 12, 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  // Fungsi untuk parsing JSON menjadi Map
  Future<Map<String, dynamic>> _parseJsonData(String data) async {
    return json.decode(data);
  }
}
