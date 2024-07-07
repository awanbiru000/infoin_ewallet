import 'package:flutter/material.dart';
import 'bayar_listrik.dart';

class Listrik extends StatefulWidget {
  const Listrik({super.key});

  @override
  State<Listrik> createState() => _ListrikState();
}

class _ListrikState extends State<Listrik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Jenis Pembayaran Listrik'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.flash_on, size: 40, color: Colors.yellow),
              title: Text('PLN Token'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PembayaranDetailPage(jenisPembayaran: 'PLN Token')),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.flash_on, size: 40, color: Colors.yellow),
              title: Text('PLN Pascabayar'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PembayaranDetailPage(
                          jenisPembayaran: 'PLN Pascabayar')),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.flash_on, size: 40, color: Colors.yellow),
              title: Text('PLN Non-Taglis'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PembayaranDetailPage(
                          jenisPembayaran: 'PLN Non-Taglis')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
