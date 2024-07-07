import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/proses_bayarupgrade_selesai.dart';

class BayarUpgrade extends StatelessWidget {
  final String? selectedOption;

  const BayarUpgrade({Key? key, required this.selectedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String premiumType = '';
    String harga = '';
    List<String> fitur = [];

    // Tentukan konten yang sesuai berdasarkan selectedOption
    switch (selectedOption) {
      case 'Basic':
        premiumType = 'Basic';
        harga = "Rp 50.000 / Bulan";
        fitur = ["Bebas Biaya Transfer"];
        break;
      case 'Pro':
        premiumType = 'Pro';
        harga = "Rp 100.000 / Bulan";
        fitur = [
          "Bebas Biaya Transfer",
          "Mengatur Limit Keuangan Anda",
          "Deposit Tanpa Batas"
        ];
        break;
      case 'Elite':
        premiumType = 'Elite';
        harga = "Rp 200.000 / Bulan";
        fitur = [
          "Bebas Biaya Transfer",
          "Mengatur Limit Keuangan Anda",
          "Deposit Tanpa Batas",
          "Bebas Biaya Bulanan",
          "Promo Menarik"
        ];
        break;
      default:
        premiumType = 'Basic'; // Default jika tidak ada yang dipilih
        harga = "Rp 50.000 / Bulan";
        fitur = ["Bebas Biaya Transfer"];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Bayar Upgrade"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Anda memilih Tipe Akun $premiumType",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Menampilkan bungkus tombol sesuai dengan selectedOption
              GestureDetector(
                onTap: () {
                  // Aksi ketika tombol diklik
                },
                child: Container(
                  width: _calculateButtonWidth(selectedOption),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(premiumType,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4.0),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            harga,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: fitur
                              .map((item) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check, size: 18),
                                        SizedBox(width: 8),
                                        Text(item),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman proses pembayaran selesai
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProsesPembayaranSelesai()),
                  );
                },
                child: Text("Proses Pembayaran"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menghitung lebar tombol berdasarkan pilihan
  double _calculateButtonWidth(String? selectedOption) {
    switch (selectedOption) {
      case 'Basic':
        return 180;
      case 'Pro':
        return 260;
      case 'Elite':
        return 260;
      default:
        return 180; // Default untuk Basic jika tidak ada yang dipilih
    }
  }
}
