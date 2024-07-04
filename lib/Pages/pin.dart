import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/user_profile.dart';
import 'package:provider/provider.dart';

class PinDialog extends StatefulWidget {
  final VoidCallback onPinEntered;

  const PinDialog({super.key, required this.onPinEntered});

  @override
  _PinDialogState createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  late TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var pinFromProvider = Provider.of<UserProfile>(context, listen: false).pin;
    return AlertDialog(
      title: const Text('Masukkan PIN'),
      content: TextFormField(
        controller: _pinController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        obscureText: true,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            String enteredPin = _pinController.text;
            if (enteredPin == pinFromProvider.toString()) {
              widget.onPinEntered();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('PIN salah. Silakan coba lagi.'),
                ),
              );
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}

