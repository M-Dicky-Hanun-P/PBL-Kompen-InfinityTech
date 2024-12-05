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
  final String username;
  final String id_mahasiswa;
  const HomePage(
      {super.key, required this.username, required this.id_mahasiswa});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   _loadProfileImage();
  // }

  // Future<void> _loadProfileImage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final imagePath = prefs.getString('profileImagePath');
  //   if (imagePath != null) {
  //     setState(() {});
  //   }
  // }

  // Future<void> _saveProfileImage(String path) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('profileImagePath', path);
  // }

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
                          widget.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _showEditProfileDialog(context),
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
                leading: const Icon(Icons.assignment, color: Colors.white),
                title: const Text(
                  'Lihat dan Pilih Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LihatKompenPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.update, color: Colors.white),
                title: const Text(
                  'Update Progres Tugas Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TugasOnTheGo()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_document, color: Colors.white),
                title: const Text(
                  'Upload Berita Acara',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadBerkasBeritaAcara()),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
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
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/logo_jti_polinema.png',
                      height: 150,
                      width: 250,
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xFF0E1F43),
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/img/SIKOMTI.png',
                          height: 70,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // const SizedBox(height: 1),
                    // const Text(
                    //   'Sistem Kompensasi Jurusan Teknologi Informasi',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    // const SizedBox(height: 2),
                    // const Text(
                    //   'Politeknik Negeri Malang',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
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

  // Future<void> _showEditProfileDialog(BuildContext context) async {
  //   final updatedProfileImage = await showDialog<XFile?>(
  //     context: context,
  //     builder: (context) => ProfilePageDialog(
  //       username: widget.username,
  //       email: 'mahasiswa@gmail.com',
  //       no_telepon: '08123456789',
  //       password: 'mahasiswa123',
  //       bidangKompetensi: 'Coding Mobile Flutter',
  //     ),
  //   );
  //   // if (updatedProfileImage != null) {
  //   //   setState(() {});
  //   //   _saveProfileImage(updatedProfileImage.path);
  //   // }
  // }
  Future<Map<String, dynamic>> getProfileData(String username) async {
    final url = Uri.parse(
        'http://127.0.0.1:8000/api/detailMHS/${widget.id_mahasiswa}'); // Ganti dengan URL API kamu

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Kembalikan data berupa map
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<void> _showEditProfileDialog(BuildContext context) async {
    try {
      // Ambil data profil dari API
      final profileData = await getProfileData(widget.username);

      await showDialog(
        context: context,
        builder: (context) => ProfilePageDialog(
          username:
              profileData['username'] ?? '', // Jika null, beri string kosong
          email: profileData['email'] ?? '', // Jika null, beri string kosong
          no_telepon:
              profileData['no_telepon'] ?? '', // Jika null, beri string kosong
          password:
              profileData['password'] ?? '', // Jika null, beri string kosong
          bidangKompetensi: profileData['bidangKompetensi'] ??
              '', // Jika null, beri string kosong
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

  Future<void> _showEditProfileDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => ProfilePageDialog(
        username: username,
        email: email,
        no_telepon: no_telepon, // Tidak perlu mengubah int ke String
        password: password,
        bidangKompetensi: bidangKompetensi,
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
          onPressed: () => _showEditProfileDialog(context),
          child: const Text('Edit Profile'),
        ),
      ),
    );
  }
}

class ProfilePageDialog extends StatelessWidget {
  final String username;
  final String email;
  final String no_telepon;
  final String password;
  final String bidangKompetensi;

  const ProfilePageDialog({
    super.key,
    required this.username,
    required this.email,
    required this.no_telepon,
    required this.password,
    required this.bidangKompetensi,
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
          const Divider(color: Colors.black54, height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.lock, size: 20, color: Colors.orange),
                  SizedBox(
                      width: 10), // Mengatur jarak antara ikon dan teks
                  Text(
                    'Password: ${'***'}', // Menampilkan password tersembunyi
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(
                  height: 10), // Mengatur jarak antara teks dan tombol
              TextButton(
                onPressed: () {
                  // Menampilkan pesan menggunakan dialog
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Informasi Password',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Password hanya bisa dilihat di aplikasi website.',
                          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
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
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10), // Menambahkan padding yang lebih besar
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(12), // Memperhalus sudut
                    // border: Border.all(color: Colors.blueAccent),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Text(
                    'Lihat Password',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          // Bidang Kompetensi
          Row(
            children: [
              const Icon(Icons.school, size: 20, color: Colors.purple),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Bidang Kompetensi: $bidangKompetensi',
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
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
                  horizontal: 20, vertical: 10), // Padding dalam tombol
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
