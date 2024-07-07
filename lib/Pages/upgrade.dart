import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/upgrade_bayar.dart';

class Upgrade extends StatefulWidget {
  const Upgrade({Key? key}) : super(key: key);

  @override
  _UpgradeState createState() => _UpgradeState();
}

class _UpgradeState extends State<Upgrade> {
  String? _selectedOption = 'Basic';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text("Pilih Tipe Akun Premium:"),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () => _selectOption('Basic'),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedOption == 'Basic' ? 180 : 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedOption == 'Basic'
                            ? Colors.orange
                            : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('Basic'),
                          const SizedBox(height: 4.0),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: _selectedOption == 'Basic'
                                  ? Colors.orange
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              "Rp 50.000 / Bulan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          if (_selectedOption == 'Basic') ...[
                            featureRow("Bebas Biaya Transfer"),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectOption('Pro'),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedOption == 'Pro' ? 220 : 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedOption == 'Pro'
                            ? Colors.orange
                            : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('Pro'),
                          const SizedBox(height: 4.0),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: _selectedOption == 'Pro'
                                  ? Colors.orange
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              "Rp 100.000 / Bulan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          if (_selectedOption == 'Pro') ...[
                            featureRow("Bebas Biaya Transfer"),
                            const SizedBox(height: 20),
                            featureRow("Mengatur Limit Keuangan Anda"),
                            const SizedBox(height: 20),
                            featureRow("Deposit Tanpa Batas"),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectOption('Elite'),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedOption == 'Elite' ? 260 : 240,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedOption == 'Elite'
                            ? Colors.orange
                            : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('Elite'),
                          const SizedBox(height: 4.0),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: _selectedOption == 'Elite'
                                  ? Colors.orange
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              "Rp 200.000 / Bulan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          if (_selectedOption == 'Elite') ...[
                            featureRow("Bebas Biaya Transfer"),
                            const SizedBox(height: 20),
                            featureRow("Mengatur Limit Keuangan Anda"),
                            const SizedBox(height: 20),
                            featureRow("Deposit Tanpa Batas"),
                            const SizedBox(height: 20),
                            featureRow("Bebas Biaya Bulanan"),
                            const SizedBox(height: 20),
                            featureRow("Promo Menarik"),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BayarUpgrade(
                              selectedOption:
                                  _selectedOption)), // Mengirim selectedOption ke BayarUpgrade
                    );
                  },
                  child: const Text("Lanjut"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget featureRow(String text) {
    return Row(
      children: [
        const Expanded(flex: 10, child: Icon(Icons.check)),
        Expanded(
          flex: 90,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _selectOption(String option) {
    if (_selectedOption != option) {
      setState(() {
        _selectedOption = option;
      });
    }
  }
}
