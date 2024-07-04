import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          HelpItem(
            title: "Cara Mengisi Saldo",
            description:
                "Untuk mengisi saldo, Anda dapat menggunakan metode transfer bank, kartu kredit, atau metode pembayaran lainnya yang tersedia di aplikasi eWallet.",
          ),
          HelpItem(
            title: "Cara Transfer Uang",
            description:
                "Untuk mentransfer uang, pilih opsi 'Transfer' di aplikasi, masukkan jumlah yang ingin Anda transfer dan pilih penerima. Pastikan untuk memasukkan detail dengan benar sebelum mengirim.",
          ),
          HelpItem(
            title: "Panduan Keamanan",
            description:
                "Pastikan untuk tidak membagikan informasi rahasia Anda, seperti PIN atau kata sandi, kepada siapapun. Selalu periksa kembali detail transaksi sebelum mengonfirmasi.",
          ),
          HelpItem(
            title: "FAQ",
            description:
                "Temukan jawaban atas pertanyaan umum tentang penggunaan aplikasi eWallet di bagian FAQ. Jika pertanyaan Anda tidak terjawab di sana, jangan ragu untuk menghubungi layanan pelanggan kami.",
          ),
        ],
      ),
    );
  }
}

class HelpItem extends StatefulWidget {
  final String title;
  final String description;

  const HelpItem({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  _HelpItemState createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.title),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.description),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            _expanded = expanded;
          });
        },
        initiallyExpanded: _expanded,
      ),
    );
  }
}