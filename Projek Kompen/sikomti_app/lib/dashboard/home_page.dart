// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikomti_app/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';
import 'package:sikomti_app/fitur_sidebar/update_progres_tugas_kompen/tugas_on_the_go.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';
import 'package:sikomti_app/fitur_sidebar/upload_berita_acara/upload_berkas_berita_acara.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final dynamic user;  
  final String username;
  const HomePage({super.key, required this.user, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> getDashboardMHS() async {
    final url = Uri.parse(
        'http://10.0.2.2:8000/api/dashboardMHS/${widget.user.id_mahasiswa}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF0E1F43),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF0E1F43),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/SIKOMTI.png',
                    height: 40,
                  ),
                ],
              ),
              const Divider(color: Color.fromARGB(255, 255, 255, 255)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 90, 156, 242),
                      child: Icon(FontAwesomeIcons.userAlt,
                          size: 23, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _showProfileDialog(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5BC0DE),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Color.fromARGB(212, 255, 255, 255)),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.task, color: Colors.white), // Ikon Tugas
                title: const Text(
                  'Lihat dan Pilih Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LihatKompenPage(user: widget.user, username: widget.username,),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.update,
                    color: Colors.white), // Ikon Update
                title: const Text(
                  'Update Progres Tugas Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TugasOnTheGoScreen(user: widget.user, username: widget.username),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_upload,
                    color: Colors.white), // Ikon Upload
                title: const Text(
                  'Upload Berita Acara',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UploadBerkasBeritaAcara(user: widget.user, username: widget.username,),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    // Menampilkan Snackbar dengan pesan logout
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Berhasil Logout',
                        ),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('LOGOUT'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
            future: getDashboardMHS(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text('Informasi alpha segera di update oleh admin.'));
              } else {
                final data = snapshot.data ?? {};
                final totalAlpha = data['jumlah_alpha'] ?? 0;
                final totalDibayar = data['kompen_dibayar'] ?? 0;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Kotak untuk judul
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 49, 126, 251), // Warna kotak biru
                          borderRadius: BorderRadius.circular(
                              10), // Membuat sudut kotak melengkung
                        ),
                        child: const Text(
                          'Overview Kompen Kamu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .white, // Warna teks putih untuk kontras dengan biru
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: const Color.fromARGB(
                                  255, 218, 28, 28), // Merah
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.alarm,
                                      color: Colors
                                          .white, // Mengubah ikon menjadi putih
                                      size: 36, // Ukuran ikon lebih besar
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Total Jam Alpha',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(214, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight
                                            .w500, // Menambah ketebalan teks
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      totalAlpha > 0
                                          ? '$totalAlpha Jam'
                                          : '- Jam', // Menampilkan '- Jam' jika tidak ada data
                                      style: const TextStyle(
                                        color: Colors
                                            .white, // Warna teks utama tetap putih
                                        fontSize: 20, // Ukuran font lebih besar
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: const Color.fromARGB(
                                  255, 47, 197, 2), // Hijau
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors
                                          .white, // Ikon putih untuk kontras yang bagus
                                      size: 36, // Ukuran ikon lebih besar
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Kompen Dibayar',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(214, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight
                                            .w500, // Menambah ketebalan teks
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      totalDibayar > 0
                                          ? '$totalDibayar Jam'
                                          : '- Jam', // Menampilkan '- Jam' jika tidak ada data
                                      style: const TextStyle(
                                        color: Colors
                                            .white, // Warna teks utama tetap putih
                                        fontSize: 20, // Ukuran font lebih besar
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xFF0E1F43),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                '2024© Sistem Kompensasi Jurusan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getProfileData() async {
    final url = Uri.parse(
        'http://10.0.2.2:8000/api/detailMHS/${widget.user.id_mahasiswa}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<void> _showProfileDialog(BuildContext context) async {
    try {
      final profileData = await getProfileData();
      await showDialog(
        context: context,
        builder: (context) => ProfilePageDialog(
          username: widget.user.username,
          nama: profileData['nama'] ?? '',
          nim: profileData['nim'] ?? '',
          email: widget.user.email,
          no_telepon: profileData['no_telepon'] ?? '',
          password: profileData['password'] ?? '',
        ),
      );
    } catch (e) {
      print("Error fetching profile: $e");
    }
  }
}

class ProfilePage extends StatefulWidget {
  final String id_mahasiswa; // Tambahkan parameter userId untuk API
  const ProfilePage({super.key, required this.id_mahasiswa});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String username = '';
  late String nama = '';
  late String nim = '';
  late String email = '';
  late String no_telepon;
  late String password = '';
  late String bidangKompetensi = 'Coding Mobile Flutter'; // Default value

  Future<void> _fetchUserData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/detailMHS/${widget.id_mahasiswa}'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        username = data['username'];
        nama = data['nama'];
        nim = data['nim'];
        email = data['email'];
        no_telepon = data['no_telepon'];
        password = data['password'];
      });
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch user data!')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _showProfileDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => ProfilePageDialog(
        username: username,
        nama: nama,
        nim: nim,
        email: email,
        no_telepon: no_telepon, // Tidak perlu mengubah int ke String
        password: password,
        // bidangKompetensi: bidangKompetensi,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showProfileDialog(context),
          child: const Text('Edit Profile'),
        ),
      ),
    );
  }
}

class ProfilePageDialog extends StatelessWidget {
  final String username;
  final String nama;
  final String nim;
  final String email;
  final String no_telepon;
  final String password;
  // final String bidangKompetensi;

  const ProfilePageDialog({
    super.key,
    required this.username,
    required this.nama,
    required this.nim,
    required this.email,
    required this.no_telepon,
    required this.password,
    // required this.bidangKompetensi,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Profil Pengguna'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(183, 90, 156, 242),
                child: Icon(FontAwesomeIcons.userAlt,
                    size: 29, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),
          Text(
            'Detail Informasi: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          // const Divider(color: Colors.black54, height: 20),
          // Nama
          Row(
            children: [
              const Icon(Icons.person,
                  size: 20, color: Colors.blueAccent), // Ikon untuk Nama
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Nama: $nama',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),
          // NIM
          Row(
            children: [
              const Icon(Icons.badge_outlined,
                  size: 20, color: Colors.blueAccent), // Ikon untuk NIM
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'NIM: $nim',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),
          // Email
          Row(
            children: [
              const Icon(Icons.alternate_email,
                  size: 20, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Email: $email',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          // Nomor Telepon
          Row(
            children: [
              const Icon(Icons.phone_iphone, size: 20, color: Colors.green),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'No Telepon: $no_telepon',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 15),

          // Informasi Password dengan Tombol Ikon Mata
          const Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Memberikan jarak antara teks dan tombol
            children: [
              Row(
                children: [
                  Icon(Icons.lock, size: 20, color: Colors.orange),
                  SizedBox(width: 10),
                  Text(
                    'Password: ********', // Menampilkan password tersembunyi
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              // IconButton(
              //   icon: const Icon(Icons.visibility,
              //       color: Colors.blue),
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: const Text(
              //             'Informasi Password',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.bold),
              //           ),
              //           content: const Text(
              //             'Password hanya bisa dilihat di aplikasi website.',
              //             style: TextStyle(
              //                 fontSize: 14, fontStyle: FontStyle.italic),
              //           ),
              //           actions: [
              //             ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.blue[800], // Warna tombol
              //                 foregroundColor:
              //                     Colors.white, // Warna teks tombol
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 12, vertical: 6),
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(12),
              //                 ),
              //                 elevation: 5,
              //               ),
              //               onPressed: () {
              //                 Navigator.of(context).pop(); // Menutup dialog
              //               },
              //               child: const Text(
              //                 'OK',
              //                 style: TextStyle(
              //                     fontSize: 14, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              // ),
            ],
          ),

          const SizedBox(height: 2),
          const Divider(color: Colors.black54, height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Memberikan jarak antara teks dan tombol
            children: [
              const Row(
                children: [
                  Icon(Icons.school,
                      size: 20,
                      color: Colors
                          .green), // Sesuaikan ikon untuk bidang kompetensi
                  SizedBox(width: 10),
                  Text(
                    'Bidang Kompetensi: ***', // Menampilkan bidang kompetensi tersembunyi
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.visibility,
                    color: Colors.blue), // Ganti teks dengan ikon mata
                onPressed: () {
                  // Menampilkan pesan menggunakan dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Informasi Bidang Kompetensi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Bidang Kompetensi hanya bisa dilihat di aplikasi website.',
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800], // Warna tombol
                              foregroundColor:
                                  Colors.white, // Warna teks tombol
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Menutup dialog
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 1),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800], // Warna latar tombol
              foregroundColor: Colors.white, // Warna teks tombol
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // Padding dalam tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Sudut melingkar
              ),
              elevation: 5, // Efek bayangan tombol
            ),
            onPressed: () => Navigator.of(context).pop(), // Menutup dialog
            child: const Text(
              'Tutup',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
