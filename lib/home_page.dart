import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpm_tugas4_stopwatch/member_list_page.dart';
import 'package:tpm_tugas4_stopwatch/recommended_sites_page.dart';
import 'package:tpm_tugas4_stopwatch/stopwatch_app.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemberListPage()),
            );
          },
          child: Text('Daftar Anggota'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StopwatchApp()),
            );
          },
          child: Text('Aplikasi Stopwatch'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecommendedSitesPage()),
            );
          },
          child: Text('Daftar Situs Rekomendasi'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // TODO: implement favorite page
          },
          child: Text('Favorite'),
        ),
      ],
    ),
    const RecommendedSitesPage(),
    const Container(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bantuan'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [
              Text('Cara menggunakan aplikasi ini:'),
              SizedBox(height: 8),
              Text('- Pilih menu di bawah layar untuk membuka fitur'),
              Text('- Tekan tombol "Logout" di pojok kanan atas untuk keluar'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Judul Aplikasi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: _showHelpDialog,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Halaman Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
