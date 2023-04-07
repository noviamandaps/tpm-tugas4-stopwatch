import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cara menggunakan aplikasi:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Pilih menu pada bottom navigation untuk membuka halaman yang diinginkan.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '2. Pada halaman member, Anda dapat menambahkan atau menghapus anggota.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Pada halaman stopwatch, Anda dapat memulai, menghentikan, dan mengatur waktu stopwatch.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8.0),
            Text(
              '4. Pada halaman favorit, Anda dapat menambahkan atau menghapus situs favorit.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            Text(
              'Jika Anda mengalami masalah atau memiliki pertanyaan lebih lanjut, silakan hubungi tim dukungan kami di support@myapp.com',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
