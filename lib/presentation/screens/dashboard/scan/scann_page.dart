import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../provider/transfer/transfer_provider.dart';
import 'component/qr_scanner_overlay.dart';

enum ScanType { importMnemonic, tranfersHome, addressReceive }

class ScannPage extends ConsumerWidget {
  final ScanType type;
  const ScannPage({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget scan() {
      return Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
              torchEnabled: true,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (type == ScanType.importMnemonic) {
                  ref
                      .read(pharseControllerProvider.notifier)
                      .setValue(barcode.rawValue!);
                  ref.watch(pharseControllerProvider);

                } else if (type == ScanType.tranfersHome) {
                  // if (SolanaHelper().isValidAddress(barcode.rawValue!) ==
                  //     true) {
                  //   final listChain =
                  //       ref.watch(chainSelectedProvider).valueOrNull ?? [];
                  //   ref.read(chainTransferProvider.notifier).setChainTransfer(
                  //       listChain.singleWhere((e) => e.baseChain == "sol",
                  //           orElse: () => ListChainSelected()));
                  //   ref
                  //       .read(receiveAddressProvider.notifier)
                  //       .setValue(barcode.rawValue!);
                  //   ref.watch(receiveAddressProvider);

                  //   context.goNamed('choose_receiver');
                  // } else {
                  ref
                      .read(receiveAddressProvider.notifier)
                      .setValue(barcode.rawValue!);
                  ref.watch(receiveAddressProvider);
                  context.pop();
                  context.goNamed('select_asset');
                  // }
                }
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColor.bgLight,
      body: scan(),
    );
  }
}
