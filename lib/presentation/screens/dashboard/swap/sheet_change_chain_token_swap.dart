import 'package:bee_wallet/utils/util.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/bx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/app_chain_logo.dart';
import '../../../../data/model/model.dart';
import '../../../provider/provider.dart';
import '../../../provider/swap/swap_provider.dart';
import '../../../widget/card_general.dart';
import '../../../widget/widget.dart';

final searchSwapChain = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class SheetChangeChainSwap extends ConsumerWidget {
  const SheetChangeChainSwap({super.key, required this.isFrom});
  final bool isFrom;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originChain = ref.watch(listOriginChainSwapProvider);
    final chainList = ref.watch(chainSelectedSearchProvider);
    final tokenFrom = ref.watch(chainSwapFromProvider);
    final tokenTo = ref.watch(chainSwapToProvider);

    final selected = isFrom ? tokenTo : tokenFrom;

    final listChain =
        chainList.where((token) {
          final selectedChainId = ref.watch(swapOriginChainProvider).chainId;
          final selectedId = selected.id;
          if (selectedChainId == null) return true;
          final sameChain = token.chainId == selectedChainId;
          final notSelectedToken = token.id != selectedId;
          return sameChain && notSelectedToken;
        }).toList();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: SizedBox(
          height: context.h(0.6),
          child: Column(
            children: [
              Text(
                "Change Asset",
                style: AppFont.medium14.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(16),
              Row(
                children: [
                  Expanded(
                    child: InputText(
                      hintText: "Search..",
                      filled: true,
                      filledColor: Theme.of(context).cardColor,
                      controller: ref.watch(searchSwapChain),
                      onChange: (v) {
                        ref
                            .read(chainSelectedSearchProvider.notifier)
                            .onSearch(v);
                      },
                    ),
                  ),
                  width(8),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<TokenChain>(
                      customButton: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),

                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            width: 0.5,
                            color: Theme.of(context).canvasColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ref.watch(swapOriginChainProvider).id != null
                                ? ClipOval(
                                  child:
                                      ref.watch(swapOriginChainProvider).logo ==
                                              null
                                          ? Image.asset(
                                            AppChainLogo.evm,
                                            width: 20,
                                          )
                                          : ref
                                              .watch(swapOriginChainProvider)
                                              .logo!
                                              .contains("assets/logo/")
                                          ? Image.asset(
                                            ref
                                                    .watch(
                                                      swapOriginChainProvider,
                                                    )
                                                    .logo ??
                                                '',
                                            width: 20,
                                          )
                                          : Image.network(
                                            ref
                                                    .watch(
                                                      swapOriginChainProvider,
                                                    )
                                                    .logo ??
                                                '',
                                            width: 20,
                                          ),
                                )
                                : Iconify(
                                  Bx.border_all,
                                  size: 22,
                                  color: Theme.of(context).indicatorColor,
                                ),
                            width(4),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Theme.of(context).indicatorColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      items:
                          originChain
                              .map(
                                (coin) => DropdownMenuItem<TokenChain>(
                                  value: coin,
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child:
                                            coin.logo == null
                                                ? Iconify(
                                                  Bx.border_all,
                                                  size: 22,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).indicatorColor,
                                                )
                                                : coin.logo!.contains(
                                                  "assets/logo/",
                                                )
                                                ? Image.asset(
                                                  coin.logo ?? '',
                                                  width: 20,
                                                )
                                                : Image.network(
                                                  coin.logo ?? '',
                                                  width: 20,
                                                ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        coin.symbol ?? '',
                                        style: AppFont.medium12.copyWith(
                                          color:
                                              Theme.of(context).indicatorColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        ref
                            .read(swapOriginChainProvider.notifier)
                            .setChain(value ?? TokenChain());
                      },

                      dropdownStyleData: DropdownStyleData(
                        maxHeight: context.h(0.3),
                        width: context.w(0.35),
                        isOverButton: false,
                        offset: const Offset(-70, 0), // geser dropdown ke kiri
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ],
              ),
              height(12),
              Expanded(
                child: CardGeneral(
                  margin: EdgeInsets.zero,
                  child:
                      listChain.isEmpty
                          ? Empty(title: "No Record Found")
                          : ListView.builder(
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: cardChain(
                                    context,
                                    listChain[index],
                                    ref,
                                    isFrom,
                                  ),
                                ),
                            itemCount: listChain.length,
                          ),
                ),
              ),
              height(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardChain(
    BuildContext context,
    SelectedTokenChain chain,
    WidgetRef ref,
    bool isfrom,
  ) {
    final chainSelected =
        isfrom
            ? ref.watch(chainSwapFromProvider)
            : ref.watch(chainSwapToProvider);
    return GestureDetector(
      onTap: () {
        if (isfrom) {
          ref.read(chainSwapFromProvider.notifier).setChain(chain);
          ref.watch(chainSwapFromProvider);
          Navigator.pop(context);
        } else {
          ref.read(chainSwapToProvider.notifier).setChain(chain);
          ref.watch(chainSwapToProvider);
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient:
              chainSelected.chainId == chain.chainId &&
                      chainSelected.symbol == chain.symbol
                  ? AppColor.primaryGradient
                  : null,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Stack(
                      children: [
                        ClipOval(
                          child:
                              chain.logo == null
                                  ? Image.asset(AppChainLogo.evm, width: 30)
                                  : chain.logo!.contains("assets/logo/")
                                  ? Image.asset(chain.logo ?? '', width: 30)
                                  : Image.network(chain.logo ?? '', width: 30),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context).cardColor,
                              ),
                              image: DecorationImage(
                                image:
                                    chain.logo == null
                                        ? const AssetImage(AppChainLogo.evm)
                                        : chain.baseLogo!.contains(
                                          "assets/logo/",
                                        )
                                        ? AssetImage(chain.baseLogo ?? '')
                                        : NetworkImage(chain.baseLogo ?? ''),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  width(12),
                  Expanded(
                    child: Text(
                      chain.name ?? '',
                      style: AppFont.reguler14.copyWith(
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
                  width(8),
                  chainSelected.chainId == chain.chainId &&
                          chainSelected.symbol == chain.symbol
                      ? Icon(
                        Icons.check_circle_outline_rounded,
                        size: 20,
                        color: AppColor.primaryColor,
                      )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
