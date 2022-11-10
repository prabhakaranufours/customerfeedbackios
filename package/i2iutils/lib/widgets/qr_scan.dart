import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

typedef QrResult=Future<bool> Function(String);

class QrScan extends StatefulWidget {
  Color borderColor;
  QrResult result;
  QrScan(this.result, {Key? key, this.borderColor=Colors.green}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  double width = 0;
  double height = 0;

  Barcode? result;
  QRViewController? qrController;
  bool isLoading = false;
  IconData flash = Icons.flash_on;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(),
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      qrController?.toggleFlash();
                      flash = (flash == Icons.flash_on)
                          ? Icons.flash_off
                          : Icons.flash_on;
                      setState(() {});
                    },
                    color: Colors.white,
                    icon: Icon(flash)),
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  Widget _buildQrView() {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (width < 400 || height < 400) ? 250.0 : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: (qr){
            qrController = qr;
            qr.resumeCamera();

            qrController?.scannedDataStream.listen((scanData) async {
              result = scanData;
              if (result != null && result?.code!=null && !isLoading) {
                setState(() {
                  isLoading=true;
                });
                var res=await widget.result(result?.code ?? '');
                if(res){
                  qrController?.stopCamera();
                }else {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            });
          },
          overlay: QrScannerOverlayShape(
              borderColor: widget.borderColor,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) {
            if (!p) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Camera Permission Denied')));
            }
          },
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
