import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class BarCodeWidget extends StatelessWidget {
  Future<void> _scannerBarCode() async {
    var options = ScanOptions(
        android: AndroidOptions(
          useAutoFocus: true,
        ),
        strings: {
          'cancel': 'cancelar',
          'flash_on': 'ligar flash camera',
          'flash_off': 'desligar flash camera',
        }
        // set the options
        );
    var result = await BarcodeScanner.scan(options: options);
    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result
        .formatNote); // If a unknown format was scanned this field contains a note
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar code scanner'),
      ),
      body: Row(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scannerBarCode,
        label: Text('scanner'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
