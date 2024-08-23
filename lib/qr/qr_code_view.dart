import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final TextEditingController textEditingController = TextEditingController();
  Barcode? result;
  QRViewController? controller;
  bool isFlashOn = false;

  void _toggleFlash() async {
    await controller?.toggleFlash();
    setState(() {
      isFlashOn = !isFlashOn;
    });
  }

  String _determineQRType(String? code) {
    if (code == null) return "Unknown";

    if (code.startsWith('http://') ||
        code.startsWith('https://') ||
        Uri.tryParse(code)?.hasAbsolutePath == true) {
      return "URL";
    } else if (code.startsWith('tel:') ||
        RegExp(r'^\+?[1-9]\d{1,12}$').hasMatch(code)) {
      return "Phone Number";
    } else if (code.startsWith('SMSTO:') || code.startsWith('sms:')) {
      return "SMS";
    } else if (code.startsWith('mailto:')) {
      return "Email";
    } else {
      return "Text";
    }
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode event) {
      setState(() {
        result = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBAr(),
      body: PageView(
        children: [
          // QR code scanner
          Column(
            children: [
              // QR View Scanner
              Expanded(
                flex: 9,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreate,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.sizeOf(context).width * .8,
                  ),
                ),
              ),
              // QR fetch data
              Expanded(
                flex: 1,
                child: Center(
                  child: result != null
                      ? Column(
                          children: [
                            Text('Barcode Data ${result!.code}'),
                            Text('Type: ${_determineQRType(result!.code)}'),
                          ],
                        )
                      : const Text('Scan  codehnn'),
                ),
              ),
            ],
          ),
          // Generate QR code
          Column(
            children: [
              QrImageView(
                data: textEditingController.text,
                errorStateBuilder: errorStateBuilder,
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ),
              TextField(
                controller: textEditingController,
                onSubmitted: (value) => setState(() {}),
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar _appBAr() {
    return AppBar(
      title: const Text('Qucik Responce Code'),
      actions: [
        IconButton(
          icon: Icon(
            isFlashOn ? Icons.flash_on : Icons.flash_off,
          ),
          onPressed: _toggleFlash,
        ),
      ],
    );
  }

  Widget errorStateBuilder(BuildContext cxt, Object? err) {
    return const Center(
      child: Text(
        'Uh oh! Something went wrong...',
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }
}
