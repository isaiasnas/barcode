import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class BarCodeWidget extends StatefulWidget {
  @override
  _BarCodeWidgetState createState() => _BarCodeWidgetState();
}

class _BarCodeWidgetState extends State<BarCodeWidget> {
  String _raw;
  String _format;
  Future<void> _scannerBarCode() async {
    var options = ScanOptions(
        android: AndroidOptions(
          useAutoFocus: true,
        ),
        strings: {
          'cancel': 'cancelar',
          'flash_on': 'ligar flash camera',
          'flash_off': 'desligar flash camera',
        });
    var result = await BarcodeScanner.scan(options: options);
    setState(() {
      _raw = result.rawContent;
      _format = result.format.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BAR CODE SCANNER'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: 'Resutado: ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                  TextSpan(
                    text: _raw,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  )
                ])),
            RichText(
                text: TextSpan(
                    text: 'Formato: ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                  TextSpan(
                    text: _format,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  )
                ])),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scannerBarCode,
        icon: Icon(Icons.camera_alt),
        label: Text('scanner'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
