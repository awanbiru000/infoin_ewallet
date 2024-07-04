import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Widget/custom_button.dart';

class TransactionSuccessPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;

  const TransactionSuccessPage({super.key, required this.transactionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Berhasil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            CircleAvatar(
              backgroundImage: AssetImage(transactionData['avatar']),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              transactionData['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Kategori: ${transactionData['category']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Nominal: ${transactionData['amount']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Tanggal: ${transactionData['date']}',
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            CustomButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            }, text: "Selesai")
          ],
        ),
      ),
    );
  }
}
