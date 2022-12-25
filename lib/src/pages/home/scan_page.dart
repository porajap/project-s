import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_s/src/my_app.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../utils/app_bar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  Barcode? qrCodeResult;
  QRViewController? qrCodeController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrCodeController!.pauseCamera();
    }
    qrCodeController!.resumeCamera();
  }

  @override
  void initState() {
    cameraConnecting();
    super.initState();
  }

  Future cameraConnecting() async {
    await qrCodeController?.resumeCamera();

    setState(() {});
  }

  @override
  void dispose() {
    logger.i("dispose");
    qrCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    qrCodeController?.resumeCamera();

    return Scaffold(
        appBar: MyAppBar(title: "Scanning", context: context, showBack: true),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: _buildQrView(context),
        ));
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea =
    (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      cameraFacing: CameraFacing.back,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(
        context,
        ctrl,
        p,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.qrCodeController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      qrCodeResult = scanData;
      backPage();
    });
  }

  Future backPage() async{
    qrCodeController?.dispose();
    Navigator.pop(context, qrCodeResult);
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    logger.w('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
