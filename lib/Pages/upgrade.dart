import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/versi_ktp.dart';

class Upgrade extends StatelessWidget {
  const Upgrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PREMIUM"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Fitur yang Anda dapatkan"
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Bebas Biaya Transfer",
              style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Mengatur Limit Keuangan Anda",
              style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Deposit Tanpa Batas",
              style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Bebas Biaya Bulanan",
              style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Promo Menarik",
              style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VersiKTP()));
                },
                child: const Text("Lanjut "),
              ),
            )
          ],
        ),
      ),
    );
  }
}