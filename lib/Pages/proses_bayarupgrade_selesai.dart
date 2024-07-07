import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Profile/profile.dart';

class ProsesPembayaranSelesai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proses Pembayaran Selesai"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              "Proses pembayaran selesai!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman Profile
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                  ModalRoute.withName('/'), // Kembali ke halaman root
                );
              },
              child: Text("Kembali ke Profil"),
            ),
          ],
        ),
      ),
    );
  }
}
