import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/user_profile.dart';
import 'package:provider/provider.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});
  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  late TextEditingController _currentPinController;
  late TextEditingController _newPinController;
  late TextEditingController _confirmPinController;

  @override
  void initState() {
    super.initState();
    _currentPinController = TextEditingController();
    _newPinController = TextEditingController();
    _confirmPinController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pinFromProvider = Provider.of<UserProfile>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Current PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _currentPinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: const InputDecoration(
                counterText: '',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Enter New PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _newPinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: const InputDecoration(
                counterText: '',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Confirm New PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _confirmPinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: const InputDecoration(
                counterText: '',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final currentPin = _currentPinController.text;
                final newPin = _newPinController.text;
                final confirmPin = _confirmPinController.text;

                if (currentPin == pinFromProvider.pin.toString()) {
                  if (newPin == confirmPin) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('PIN has been successfully changed.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  // Clear all text fields
                                  _currentPinController.clear();
                                  _newPinController.clear();
                                  _confirmPinController.clear();
                                });
                                // Update the PIN in the provider
                                pinFromProvider.pin = int.parse(newPin);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('New PIN and Confirm PIN do not match.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Incorrect current PIN.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Change PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
