import 'package:flutter/material.dart';

class KontakProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _kontak = [
    {'nama': 'Agus', 'nomorHP': '0812345678'},
    {'nama': 'Rizki', 'nomorHP': '0812345679'},
    {'nama': 'Farhan', 'nomorHP': '0812345680'},
  ];
  List<Map<String, dynamic>> get kontak => _kontak;

  set kontak(List<Map<String, dynamic>> value) {
    _kontak = value;
    notifyListeners();
  }
}