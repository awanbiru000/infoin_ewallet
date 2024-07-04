import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/pin.dart';
import 'package:infoin_ewallet/Pages/transaksi_sukses.dart';
import 'package:infoin_ewallet/Provider/transaksi.dart';
import 'package:infoin_ewallet/Provider/user_profile.dart';
import 'package:infoin_ewallet/Provider/wallet.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TopUpInvestasi extends StatefulWidget {
  const TopUpInvestasi({super.key});

  @override
  State<TopUpInvestasi> createState() => _TopUpInvestasiState();
}

class _TopUpInvestasiState extends State<TopUpInvestasi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _topUpController = TextEditingController();

  void _transfer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PinDialog(
          onPinEntered: () {
            Navigator.of(context).pop();
            _prosesTransfer();
          },
        );
      },
    );
  }

  void _prosesTransfer() {
    double nominal = double.tryParse(_topUpController.text) ?? 0.0;

    if (nominal <= 0 ||
        Provider.of<WalletProvider>(context, listen: false).balance! <
            nominal) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nominal tidak valid atau saldo tidak cukup')),
      );
      return;
    }

    bool success = Provider.of<WalletProvider>(context, listen: false)
        .decreaseBalance(nominal);
    var userProfile = Provider.of<UserProfile>(context, listen: false);
    if (success) {
      userProfile.increaseBalance(nominal);
      Map<String, dynamic> newTransaction = {
        'name': 'Bibit',
        'type': 'Pengeluaran',
        'category': 'Investasi',
        'amount': 'Rp ${NumberFormat('#,##0', 'id_ID').format(nominal)}',
        'date': DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now()),
        'avatar': 'assets/images/logo-bibit.png'
      };
      Provider.of<TransaksiProvider>(context, listen: false)
          .addTransaction(newTransaction);
      try {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TransactionSuccessPage(transactionData: newTransaction),
          ),
        );
      } catch (e) {
        print('Error navigating to TransactionSuccessPage: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaksi gagal. Silakan coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up Investasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _topUpController,
                decoration: const InputDecoration(
                  labelText: 'Minimal Rp 10.000',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah top-up tidak boleh kosong';
                  }
                  final topUpAmount = int.tryParse(value);
                  if (topUpAmount == null || topUpAmount < 10000) {
                    return 'Jumlah top-up minimal Rp 10.000';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _transfer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Top Up Sekarang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
