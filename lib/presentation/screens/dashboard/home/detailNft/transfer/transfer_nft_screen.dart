// ignore_for_file: use_build_context_synchronously

import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../../../config/config.dart';
import '../../../../../widget/widget.dart';
import '../../../../scan/scann_page.dart';

class TransferNftScreen extends ConsumerWidget {
  const TransferNftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = ref.watch(selectedNftProvider);
    final token = ref.watch(chainNftTransferProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Transfer NFT"),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assets',
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      height(8),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: ClipPolygon(
                                sides: 6,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: ClipPolygon(
                                    sides: 6,
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                      ),
                                      child: Image.memory(
                                        MethodHelper().convertBase64ToUint8List(
                                            nft.imageByte ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            width(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nft.name ?? '',
                                    style: AppFont.medium14.copyWith(
                                        color:
                                            Theme.of(context).indicatorColor),
                                  ),
                                  height(4),
                                  Text(
                                    "Token ID : ${nft.tokenId}",
                                    style: AppFont.reguler12.copyWith(
                                        color: Theme.of(context).hintColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      height(16),
                      Text(
                        'From',
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      height(8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: AppColor.primaryColor)),
                              child: Blockies(
                                  size: 0.6,
                                  data: nft.owner ?? "-",
                                  shape: BlockiesShape.circle),
                            ),
                            width(8),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MethodHelper().shortAddress(
                                      address: nft.owner ?? '', length: 8),
                                  style: AppFont.semibold14.copyWith(
                                      color: Theme.of(context).indicatorColor),
                                ),
                                height(4),
                                Text(
                                  "${token.balance ?? 0.0} ${token.symbol}",
                                  style: AppFont.medium12
                                      .copyWith(color: AppColor.grayColor),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                      height(16),
                      InputText(
                        title: "To",
                        onChange: (v) =>
                            ref.read(receiveNftProvider.notifier).onChange(v),
                        validator: (v) =>
                            ref.read(receiveNftProvider.notifier).onValidate(v),
                        hintText: "Please enter address",
                        color: Theme.of(context).colorScheme.surface,
                        controller: ref.watch(receiveNftProvider),
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            width(8),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScanPage(
                                              onScan: (result) => ref
                                                  .read(receiveNftProvider
                                                      .notifier)
                                                  .setvalue(result))));
                                },
                                child: Iconify(
                                  AntDesign.scan,
                                  size: 24,
                                  color: AppColor.primaryColor,
                                )),
                          ],
                        ),
                      ),
                      height(16),
                      Warning(
                        warning:
                            'Please ensure that the receive address supports the ${token.baseChain == 'eth' ? 'ERC-721' : token.baseChain == 'sol' ? 'Solana' : token.baseChain == 'tron' ? 'TRC20' : 'BRC20'}',
                      ),
                    ],
                  ),
                  PrimaryButton(
                      title: "Next",
                      margin: EdgeInsets.only(top: 24),
                      disable: ref.watch(disableGasFeeNFTProvider),
                      onPressed: () async {
                        await ref
                            .read(networkFeeNftProvider.notifier)
                            .getNetworkFee();
                        ref.watch(networkFeeNftProvider);
                        context.goNamed('confirm_transfer_nft');
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
