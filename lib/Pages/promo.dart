import 'package:flutter/material.dart';

class Promosi extends StatefulWidget {
  const Promosi({super.key});

  @override
  State<Promosi> createState() => _PromosiState();
}

class _PromosiState extends State<Promosi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promo"),
      ),
      body: ListView(
        children: [
          PromoCard(
            title: "Promo Pembelian Pulsa",
            description: "Dapatkan diskon hingga 10% untuk pembelian pulsa!",
            onPressed: () {
            },
          ),
          PromoCard(
            title: "Promo Pembelian Game",
            description: "Beli game favoritmu dengan harga spesial!",
            onPressed: () {
            },
          ),
          PromoCard(
            title: "Promo Pembayaran Listrik",
            description: "Bayar tagihan listrikmu dan dapatkan cashback 5%!",
            onPressed: () {
            },
          ),
          PromoCard(
            title: "Promo Pembelian Investasi",
            description: "Mulai investasi di e-wallet dan dapatkan bonus investasi!",
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const PromoCard({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
