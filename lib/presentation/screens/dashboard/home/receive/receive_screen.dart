// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';
import 'sheet_change_receive.dart';

class ReceiveScreen extends ConsumerWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainDetailProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Receive',
        icon: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const SheetChangeReceive(),
              backgroundColor: Theme.of(context).colorScheme.surface,
              showDragHandle: true,
              isDismissible: false,
              isScrollControlled: true,
              useSafeArea: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            );
          },
          child: Container(
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.grayColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.1),
                      color: Theme.of(context).colorScheme.surface,
                      child:
                          (chain.logo != null)
                              ? Image.asset(chain.logo!)
                              : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  title: "Copy",
                  onPressed: () {
                    MethodHelper().handleCopy(
                      data:
                          chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                              ? (account?.addressSolana ?? "")
                              : chain.baseChain == 'sui'
                              ? (account?.addressSui ?? '')
                              : chain.baseChain == 'btc'
                              ? (account?.addressBTC ?? '')
                              : "",
                      context: context,
                    );
                  },
                ),
              ),
              width(12),
              Expanded(
                child: PrimaryButton(
                  title: "Share",
                  onPressed: () {
                    Share.share(
                      chain.baseChain == 'eth'
                          ? (account?.addressETH ?? '')
                          : chain.baseChain == 'sol'
                          ? (account?.addressSolana ?? "")
                          : chain.baseChain == 'sui'
                          ? (account?.addressSui ?? '')
                          : chain.baseChain == 'btc'
                          ? (account?.addressBTC ?? '')
                          : "",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: ClipPolygon(
                      sides: 6,
                      child: Container(
                        padding: EdgeInsets.all(0.5),
                        color: Theme.of(context).colorScheme.surface,
                        child:
                            (chain.logo != null)
                                ? Image.asset(chain.logo!)
                                : Image.asset(AppImage.logo),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.1),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.1,
                              color: Theme.of(context).cardColor,
                            ),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child:
                              (chain.baseLogo != null)
                                  ? Image.asset(chain.baseLogo!)
                                  : Image.asset(AppImage.logo),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height(16),
            Text(
              "${chain.name} (${chain.symbol})",
              style: AppFont.semibold16.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            height(16),
            Warning(
              warning:
                  "Send only ${chain.symbol} Chain to this address, or you might loose your funds.",
            ),
            height(24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height(32),
                  Container(
                    width: 244,
                    height: 244,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: QrImageView(
                      embeddedImage: AssetImage(
                        chain.baseLogo ?? AppImage.logo,
                      ),
                      data:
                          chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                              ? (account?.addressSolana ?? "")
                              : chain.baseChain == 'sui'
                              ? (account?.addressSui ?? '')
                              : chain.baseChain == 'btc'
                              ? (account?.addressBTC ?? '')
                              : "",
                      version: QrVersions.auto,
                      backgroundColor: Theme.of(context).cardColor,
                      foregroundColor: Theme.of(context).indicatorColor,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(32, 32),
                      ),
                      size: 244,
                      gapless: false,
                    ),
                  ),
                  height(24),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Text(
                      MethodHelper().shortAddress(
                        address:
                            chain.baseChain == 'eth'
                                ? (account?.addressETH ?? '')
                                : chain.baseChain == 'sol'
                                ? (account?.addressSolana ?? "")
                                : chain.baseChain == 'sui'
                                ? (account?.addressSui ?? '')
                                : chain.baseChain == 'btc'
                                ? (account?.addressBTC ?? '')
                                : "",
                        length: 12,
                      ),
                      style: AppFont.semibold16.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
