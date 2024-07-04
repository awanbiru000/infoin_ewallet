import "package:flutter/material.dart";

class VersiKTP extends StatelessWidget {
  const VersiKTP({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Versi KTP'),
      ),
      body: const  Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Versi KTP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}