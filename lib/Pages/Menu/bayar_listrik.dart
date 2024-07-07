import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Menu/confirm_pln_bayar.dart';

class PembayaranDetailPage extends StatefulWidget {
  final String jenisPembayaran;

  const PembayaranDetailPage({Key? key, required this.jenisPembayaran})
      : super(key: key);

  @override
  State<PembayaranDetailPage> createState() => _PembayaranDetailPageState();
}

class _PembayaranDetailPageState extends State<PembayaranDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomorPelangganController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _showTokenOptions = false;
  String _selectedToken = '';

  @override
  void dispose() {
    _nomorPelangganController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _nomorPelangganController.text.isNotEmpty;
    });
  }

  void _showTokenOptionsSection() {
    setState(() {
      _showTokenOptions = true;
    });
  }

  void _selectToken(String token) {
    setState(() {
      _selectedToken = token;
    });
  }

  void _navigateToConfirmationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmPLNBayarPage(
          idPelanggan: _nomorPelangganController.text,
          selectedToken: _selectedToken,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pembayaran - ${widget.jenisPembayaran}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Detail Pembayaran ${widget.jenisPembayaran}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'ID Pelanggan ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _nomorPelangganController,
                          decoration: InputDecoration(
                            hintText: 'Masukkan ID Pelanggan',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap masukkan ID pelanggan';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _updateButtonState();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              if (_isButtonEnabled && !_showTokenOptions)
                ElevatedButton(
                  onPressed: () {
                    _showTokenOptionsSection();
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Lanjut'),
                ),
              if (_showTokenOptions)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _buildTokenOptionButton('20.000', 'Rp 20.000'),
                      _buildTokenOptionButton('50.000', 'Rp 50.000'),
                      _buildTokenOptionButton('100.000', 'Rp 100.000'),
                      _buildTokenOptionButton('200.000', 'Rp 200.000'),
                      _buildTokenOptionButton('500.000', 'Rp 500.000'),
                      _buildTokenOptionButton('1.000.000', 'Rp 1.000.000'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _selectedToken.isNotEmpty
                            ? _navigateToConfirmationPage
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text('Lanjut'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTokenOptionButton(String tokenAmount, String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 11.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 255, 225, 0), width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          _selectToken(price);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedToken == price
              ? Color.fromARGB(255, 255, 255, 0)
              : Color.fromARGB(255, 255, 252, 224),
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Token $tokenAmount',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
