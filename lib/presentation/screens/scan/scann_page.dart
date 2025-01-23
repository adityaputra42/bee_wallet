import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'component/qr_scanner_overlay.dart';

class ScanPage extends StatelessWidget {
  final Function(String) onScan;
  const ScanPage({
    super.key,
    required this.onScan,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    Widget scan() {
      return Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              if (barcodes.isEmpty) {
                log('Failed to scan Barcode');
              } else {
                final String code = barcodes.first.rawValue!;
                onScan(code);
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: scan(),
    );
  }
}
