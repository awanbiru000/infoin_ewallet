import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Menu/topup_inves.dart';
import 'package:infoin_ewallet/Provider/user_profile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Investasi extends StatefulWidget {
  const Investasi({super.key});

  @override
  State<Investasi> createState() => _InvestasiState();
}

class _InvestasiState extends State<Investasi> {
  // Simulasi data investasi
  double imbalHasilSatuTahun = 4.5; // 4.5%
  double calculateTotalImbalHasil(portofolio, double imbalHasilSatuTahun) {
    return portofolio * (imbalHasilSatuTahun / 100);
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProfile>(context);
    double totalImbalHasil =
        calculateTotalImbalHasil(user.portofolio, imbalHasilSatuTahun);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investasi Cerdas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nilai Portofolio',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp ',
                          ).format(user.portofolio),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${imbalHasilSatuTahun}%',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Imbal Hasil 1 Tahun Terakhir*',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              child: const VerticalDivider(),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(NumberFormat.currency(
                                          locale: 'id_ID', symbol: 'Rp ')
                                      .format(totalImbalHasil)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Total Imbal Hasil',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TopUpInvestasi()));
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                              ),
                              child: const Text('Top Up Sekarang')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TentangInvestasiPintar(),
            ],
          ),
        ),
      ),
    );
  }
}

class TentangInvestasiPintar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Tentang Investasi Cerdas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Apa Itu Investasi Cerdas?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Investasi Cerdas adalah platform investasi bagi pengguna E-Wallet untuk berinvestasi secara mudah dan aman. Investasi Cerdas merupakan hasil kerjasama antara E-Wallet dengan Agen Penjual Reksa Dana (APERD) online yang telah terdaftar dan diawasi oleh OJK, yaitu PT Bibit Tumbuh Bersama (Bibit).',
            ),
            SizedBox(height: 10),
            Text(
              'Produk Investasi Apa Yang Ditawarkan?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Produk investasi yang ditawarkan dalam platform Investasi Cerdas merupakan produk Reksa Dana Pasar Uang. Pengguna dapat mulai berinvestasi dengan nominal kecil dan menikmati kemudahan bertransaksi melalui aplikasi E-Wallet.',
            ),
          ],
        ),
      ),
    );
  }
}
