import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sikomti_app/dashboard/home_page.dart';
import 'package:sikomti_app/fitur_sidebar/update_progres_tugas_kompen/upload_progress.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sikomti_app/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class TugasProgress {
  final int idTugasKompen;
  final String username;
  final List<String> progress;
  final TugasDetail tugas;

  TugasProgress({
    required this.idTugasKompen,
    required this.username,
    required this.progress,
    required this.tugas,
  });

  factory TugasProgress.fromJson(Map<String, dynamic> json) {
    return TugasProgress(
      idTugasKompen: json['id_tugas_kompen'],
      username: json['username'],
      progress: List<String>.from(json['progress']),
      tugas: TugasDetail.fromJson(json['tugas']),
    );
  }
}

class TugasDetail {
  final AdminTugas? admin;
  final DosenTugas? dosen;
  final TendikTugas? tendik;

  TugasDetail({
    this.admin,
    this.dosen,
    this.tendik,
  });

  factory TugasDetail.fromJson(Map<String, dynamic> json) {
    return TugasDetail(
      admin: json['admin']['nama_tugas'] != null
          ? AdminTugas.fromJson(json['admin'])
          : null,
      dosen: json['dosen']['nama_tugas'] != null
          ? DosenTugas.fromJson(json['dosen'])
          : null,
      tendik: json['tendik']['nama_tugas'] != null
          ? TendikTugas.fromJson(json['tendik'])
          : null,
    );
  }

  String get namaTugas =>
      admin?.namaTugas ?? dosen?.namaTugas ?? tendik?.namaTugas ?? '';
  String get pemberiTugas =>
      admin?.pemberiTugas ?? dosen?.pemberiTugas ?? tendik?.pemberiTugas ?? '';
  String get jamKompen =>
      admin?.jamKompen ?? dosen?.jamKompen ?? tendik?.jamKompen ?? '';
  String get bidangKompetensi =>
      admin?.bidangKompetensi.namaBidkom ??
      dosen?.bidangKompetensi.namaBidkom ??
      tendik?.bidangKompetensi.namaBidkom ??
      '';
}

class AdminTugas {
  final String namaTugas;
  final String deskripsi;
  final String jamKompen;
  final int kuota;
  final String pemberiTugas;
  final int idAdmin;
  final BidangKompetensi bidangKompetensi;

  AdminTugas({
    required this.namaTugas,
    required this.deskripsi,
    required this.jamKompen,
    required this.kuota,
    required this.pemberiTugas,
    required this.idAdmin,
    required this.bidangKompetensi,
  });

  factory AdminTugas.fromJson(Map<String, dynamic> json) {
    return AdminTugas(
      namaTugas: json['nama_tugas'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      jamKompen: json['jam_kompen']?.toString() ?? '', // Konversi ke String
      kuota: json['kuota'] ?? 0,
      pemberiTugas: json['pemberiTugas'] ?? '',
      idAdmin: json['id_admin'] ?? 0,
      bidangKompetensi:
          BidangKompetensi.fromJson(json['bidangKompetensi'] ?? {}),
    );
  }
}

class DosenTugas {
  final String namaTugas;
  final String deskripsi;
  final String jamKompen;
  final int kuota;
  final String pemberiTugas;
  final int idDosen;
  final BidangKompetensi bidangKompetensi;

  DosenTugas({
    required this.namaTugas,
    required this.deskripsi,
    required this.jamKompen,
    required this.kuota,
    required this.pemberiTugas,
    required this.idDosen,
    required this.bidangKompetensi,
  });

  factory DosenTugas.fromJson(Map<String, dynamic> json) {
    return DosenTugas(
      namaTugas: json['nama_tugas'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      jamKompen: json['jam_kompen']?.toString() ?? '', // Konversi ke String
      kuota: json['kuota'] ?? 0,
      pemberiTugas: json['pemberiTugas'] ?? '',
      idDosen: json['id_admin'] ?? 0,
      bidangKompetensi:
          BidangKompetensi.fromJson(json['bidangKompetensi'] ?? {}),
    );
  }
}

class TendikTugas {
  final String namaTugas;
  final String deskripsi;
  final String jamKompen;
  final int kuota;
  final String pemberiTugas;
  final int idTendik;
  final BidangKompetensi bidangKompetensi;

  TendikTugas({
    required this.namaTugas,
    required this.deskripsi,
    required this.jamKompen,
    required this.kuota,
    required this.pemberiTugas,
    required this.idTendik,
    required this.bidangKompetensi,
  });

  factory TendikTugas.fromJson(Map<String, dynamic> json) {
    return TendikTugas(
      namaTugas: json['nama_tugas'],
      deskripsi: json['deskripsi'],
      jamKompen: json['jam_kompen'],
      kuota: json['kuota'],
      pemberiTugas: json['pemberiTugas'],
      idTendik: json['id_tendik'],
      bidangKompetensi: BidangKompetensi.fromJson(json['bidangKompetensi']),
    );
  }
}

class BidangKompetensi {
  final String namaBidkom;
  final int idBidkom;

  BidangKompetensi({
    required this.namaBidkom,
    required this.idBidkom,
  });

  factory BidangKompetensi.fromJson(Map<String, dynamic> json) {
    return BidangKompetensi(
      namaBidkom: json['nama_bidkom'] ?? '',
      idBidkom: json['id_bidkom'] ?? 0,
    );
  }
}

// tugas_on_the_go_screen.dart
class TugasOnTheGoScreen extends StatefulWidget {
  final String username;
  final dynamic user;

  const TugasOnTheGoScreen({super.key, required this.username, this.user});

  @override
  State<TugasOnTheGoScreen> createState() => _TugasOnTheGoScreenState();
}

class _TugasOnTheGoScreenState extends State<TugasOnTheGoScreen> {
  late Future<List<TugasProgress>> _tugasProgressFuture;

  @override
  void initState() {
    super.initState();
    _tugasProgressFuture = fetchTugasProgress();
  }

  Future<List<TugasProgress>> fetchTugasProgress() async {
    final token = await AuthService.getToken();
    print('TOKEN $token');
    final response = await http.get(
        Uri.parse(
            'http://10.0.2.2:8000/api/progres?username=${widget.username}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json', // Add this header
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
        return (jsonResponse['data'] as List)
            .map((item) => TugasProgress.fromJson(item))
            .toList();
      }
      return [];
    } else {
      throw Exception('Failed to load tugas progress');
    }
  }

  int id_tugas_kompen = 0;
  int id_progres_tugas = 0;
  Future<void> downloadPdf(int id_tugas_kompen, int id_progres_tugas) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      final dio = Dio();

      dio.options.validateStatus = (status) {
        return status! < 500;
      };
      final token = await AuthService.getToken();
      print('TOKEN $token');

      dio.options.headers = {
        'Accept': 'application/pdf',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      };

      final tempDir = await getTemporaryDirectory();
      final filePath =
          '${tempDir.path}/berita_acara_kompen_${DateTime.now().millisecondsSinceEpoch}.pdf';

      // Cek response sebelum download
      final response = await dio.get(
        'http://10.0.2.2:8000/api/downloadPdf/8/4',
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        // Simpan file
        File(filePath).writeAsBytesSync(response.data);

        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        // Buka file PDF
        final result = await OpenFile.open(filePath);

        if (result.type != ResultType.done) {
          throw Exception("Tidak dapat membuka file PDF");
        }
      } else {
        throw Exception(
            "Error ${response.statusCode}: ${response.statusMessage}");
      }
    } catch (e) {
      // Tutup loading indicator jika masih terbuka
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Tampilkan error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.error, color: Colors.red, size: 40.0),
                SizedBox(width: 7),
                Text('Error'),
              ],
            ),
            content: SingleChildScrollView(
              child: Text('Gagal mengunduh file: ${e.toString()}'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas On The Go',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  username: widget.username,
                  user: widget.user,
                ),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder<List<TugasProgress>>(
        future: _tugasProgressFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('Tidak ada tugas yang sedang dikerjakan.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final tugasProgress = snapshot.data![index];
              final tugas = tugasProgress.tugas;

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                tugas.namaTugas,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Progress: ${tugasProgress.progress.first}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tugas.pemberiTugas,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Bidang keahlian - ${tugas.bidangKompetensi} ',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${tugas.jamKompen} jam kompen',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Unduh surat berita acara bebas kompen',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            '*Dapat diunduh apabila telah selesai mengerjakan penugasan kompen.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade700,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                onPressed: () async {
                                  await downloadPdf(id_tugas_kompen,
                                      id_progres_tugas);
                                },
                                child: const Text(
                                  'Unduh',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UploadProgress(
                                        username: widget.username,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
