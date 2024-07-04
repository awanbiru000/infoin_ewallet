import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Widget/qr_scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Bayar extends StatefulWidget {
  const Bayar({super.key});

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    super.initState();
    _screenWasClosed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        title: const Text(
          "Bayar",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: _foundBarcode,
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcodeCapture) {
    final List<Barcode> barcodes = barcodeCapture.barcodes;
    if (!_screenOpened && barcodes.isNotEmpty) {
      final String code = barcodes.first.rawValue ?? "___";
      _screenOpened = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoundScreen(value: code, screenClose: _screenWasClosed),
        ),
      ).then((value) {
        _screenWasClosed();
      });
    }
  }

  void _screenWasClosed() {
    setState(() {
      _screenOpened = false;
    });
  }
}

class FoundScreen extends StatelessWidget {
  final String value;
  final VoidCallback screenClose;

  const FoundScreen({required this.value, required this.screenClose, super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        screenClose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Found Screen"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              screenClose();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(child: Text(value)),
      ),
    );
  }
}
