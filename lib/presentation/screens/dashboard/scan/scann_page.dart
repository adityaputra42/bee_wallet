import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'component/qr_scanner_overlay.dart';

class ScanPage extends ConsumerWidget {
  final Function(String) onScan;
  const ScanPage({
    super.key,
    required this.onScan,
  });

  onResult(String code) {
    onScan(code);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcodes.first.rawValue!;
                onResult(code);
                Navigator.pop(context);
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
