import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/transaksi.dart';
import 'package:infoin_ewallet/Widget/bottom_navigation.dart';
import 'package:provider/provider.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  int _selectedIndex = 1;
  DateTimeRange? _dateRange;
  String? _selectedTransactionType = 'Semua';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/riwayat');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/pesan');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      default:
        throw Exception('Invalid index');
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: _dateRange,
    );
    if (picked != null && picked != _dateRange) {
      setState(() {
        _dateRange = picked;
      });
    }
  }

  void _applyFilter(TransaksiProvider transaksi) {
    if (_selectedTransactionType != null) {
      transaksi.filterTransactionsByDateAndType(_dateRange, _selectedTransactionType!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih jenis transaksi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var transaksi = Provider.of<TransaksiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Riwayat'),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Filter'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDateRange(context),
                          child: Text(_dateRange == null
                              ? 'Pilih Rentang Tanggal'
                              : '${_dateRange!.start.day}/${_dateRange!.start.month}/${_dateRange!.start.year} '
                                  '- ${_dateRange!.end.day}/${_dateRange!.end.month}/${_dateRange!.end.year}'),
                        ),
                        const SizedBox(height: 16.0),
                        DropdownButton<String>(
                          hint: const Text('Pilih Jenis Transaksi'),
                          value: _selectedTransactionType,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedTransactionType = newValue;
                            });
                          },
                          items: transaksi.filterOptions.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _applyFilter(transaksi);
                        },
                        child: const Text('Terapkan'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: transaksi.filteredTransaction.length,
              itemBuilder: (context, index) {
                var transaction = transaksi.filteredTransaction[transaksi.filteredTransaction.length - 1 - index];
                var amountText = transaction['type'] == 'Pemasukan' ? '+${transaction['amount']}' : '-${transaction['amount']}';
                var amountColor = transaction['type'] == 'Pemasukan' ? Colors.green : null;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: ClipOval(
                      child: Container(
                        width: 50, // Tentukan ukuran lebar
                        height: 50, // Tentukan ukuran tinggi
                        color: Colors.white, // Tambahkan background putih
                        child: Image.asset(
                          transaction['avatar'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(transaction['name']),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${transaction['category']}',
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text('${transaction['date']}'),
                          ],
                        ),
                        Text(
                          amountText,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: amountColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
