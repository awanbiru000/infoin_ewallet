import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Profile/change_password.dart';
import 'package:infoin_ewallet/Pages/Profile/change_pin.dart';
import 'package:infoin_ewallet/Provider/dark_mode.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah Anda yakin ingin logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var Tema = Provider.of<DarkMode>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              title: const Text('Ganti PIN'),
              leading: const Icon(Icons.lock),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePin()));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              title: const Text('Ganti Password'),
              leading: const Icon(Icons.vpn_key),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePassword()));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 5),
                )
              ]
            ),
            child: SwitchListTile(
              title: const Text('Dark Mode'),
              value: Tema.enableDarkMode,
              secondary: const Icon(Icons.nightlight_round),
              onChanged: (value) {
                Tema.ganti = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              title: const Text('Logout'),
              leading: const Icon(Icons.exit_to_app),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _showLogoutConfirmationDialog();
              },
            ),
          ),
        ],
      ),
    );
  }
}
