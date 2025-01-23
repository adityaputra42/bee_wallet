// ignore_for_file: unused_result

import 'package:bee_wallet/data/src/app_image.dart';
import 'package:bee_wallet/presentation/provider/dapp/browser_provider.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import '../../../../config/config.dart';
import '../../../../utils/walletConnect/deep_link_handler.dart';
import '../../../../utils/walletConnect/eth_utils.dart';
import '../../../provider/dapp/walletconnect_provider.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';
import 'components/new_dapps.dart';
import 'components/sheet_select_network.dart';

final indexbarDapp = StateProvider.autoDispose<int>((ref) => 0);

class DappScreen extends ConsumerStatefulWidget {
  const DappScreen({super.key});

  @override
  ConsumerState<DappScreen> createState() => _DappScreenState();
}

class _DappScreenState extends ConsumerState<DappScreen> {
  List<PairingInfo> _pairings = [];
  ReownWalletKit? walletKit;
  @override
  void initState() {
    walletKit = ref.read(walletconnectProvider).valueOrNull;
    _pairings = walletKit!.pairings.getAll();
    _pairings = _pairings.where((p) => p.active).toList();

    _registerListeners();

    DeepLinkHandler.checkInitialLink();
    super.initState();
  }

  void _registerListeners() {
    walletKit?.core.relayClient.onRelayClientMessage.subscribe(
      _onRelayClientMessage,
    );
    walletKit?.pairings.onSync.subscribe(_refreshState);
    walletKit?.pairings.onUpdate.subscribe(_refreshState);
    walletKit?.onSessionConnect.subscribe(_refreshState);
    walletKit?.onSessionDelete.subscribe(_refreshState);
  }

  void _unregisterListeners() {
    walletKit?.onSessionDelete.unsubscribe(_refreshState);
    walletKit?.onSessionConnect.unsubscribe(_refreshState);
    walletKit?.pairings.onSync.unsubscribe(_refreshState);
    walletKit?.pairings.onUpdate.unsubscribe(_refreshState);
    walletKit?.core.relayClient.onRelayClientMessage.unsubscribe(
      _onRelayClientMessage,
    );
  }

  @override
  void dispose() {
    _unregisterListeners();
    super.dispose();
  }

  void _refreshState(dynamic event) async {
    setState(() {});
  }

  void _onRelayClientMessage(MessageEvent? event) async {
    _refreshState(event);
    if (event != null) {
      final jsonObject = await EthUtils.decodeMessageEvent(event, walletKit!);
      if (!mounted) return;
      if (jsonObject is JsonRpcRequest &&
          jsonObject.method == MethodConstants.WC_SESSION_PING) {
        MethodHelper().showSnack(
          context: context,
          content: "onRelay ${jsonObject.method}",
          backgorund: AppColor.greenColor,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final listChain = ref.watch(listChainSearchProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColor.grayColor,
          title: Padding(
              padding: EdgeInsets.only(top: 12),
              child: SearchField(
                controller: ref.watch(searchWebProvider),
                onEditingComplete: () {
                  if (ref.watch(searchWebProvider).text.isNotEmpty) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SheetSelectNetworkDapp(
                              url: ref.watch(searchWebProvider).text,
                              onSelect: () {},
                            ),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        showDragHandle: true,
                        isDismissible: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16))));
                  }
                },
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          toolbarHeight: 76,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.height(16),
            overview(ref),
            widget.height(8),
            ref.watch(browserHistoryProvider).when(
              data: (data) {
                return data.isEmpty
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "History",
                                  style: AppFont.medium14.copyWith(
                                      color: Theme.of(context).indicatorColor),
                                ),
                                Text(
                                  "See All",
                                  style: AppFont.medium14
                                      .copyWith(color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                          ),
                          widget.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  data.length > 10 ? 10 : data.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.only(
                                            left: index == 0 ? 16 : 0,
                                            right: index == 4 ? 16 : 12),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewWeb3Webview(
                                                            initialUrl:
                                                                data[index]
                                                                        .url ??
                                                                    '')));
                                          },
                                          child: SizedBox(
                                            width: 54,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 42,
                                                  height: 42,
                                                  child: ClipPolygon(
                                                      sides: 6,
                                                      child: Image.asset(
                                                          AppImage
                                                              .defaultBrowser)),
                                                ),
                                                widget.height(8),
                                                Text(
                                                  data[index].title ?? "",
                                                  style: AppFont.reguler12
                                                      .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .indicatorColor),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ],
                      );
              },
              error: (Object error, StackTrace stackTrace) {
                return const SizedBox();
              },
              loading: () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      6,
                      (index) => ShimmerLoading(
                            width: 54,
                            height: 54,
                          )),
                );
              },
            ),
            widget.height(16),
            Expanded(
              child: DefaultTabController(
                length: listChain.length,
                initialIndex: ref.watch(indexbarDapp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TabBar(
                          automaticIndicatorColorAdjustment: false,
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          labelColor: Theme.of(context).indicatorColor,
                          labelPadding: EdgeInsets.zero,
                          labelStyle: AppFont.semibold14,
                          unselectedLabelColor: AppColor.grayColor,
                          unselectedLabelStyle: AppFont.medium14,
                          indicatorSize: TabBarIndicatorSize.label,
                          onTap: (index) {
                            ref.read(indexbarDapp.notifier).state = index;
                            ref
                                .read(tokenDappLinkProvider.notifier)
                                .onChange(listChain[index]);
                          },
                          tabs: List.generate(
                              listChain.length,
                              (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    margin: EdgeInsets.only(
                                        left:
                                            listChain[index] == listChain.first
                                                ? 16
                                                : 0,
                                        right:
                                            listChain[index] == listChain.last
                                                ? 16
                                                : 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: ref.watch(indexbarDapp) == index
                                          ? AppColor.primaryColor
                                          : Theme.of(context).cardColor,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: ClipPolygon(
                                            sides: 6,
                                            child: Container(
                                              padding: EdgeInsets.all(0.5),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface,
                                              child: Image.asset(
                                                listChain[index].logo ?? '',
                                              ),
                                            ),
                                          ),
                                        ),
                                        widget.width(8),
                                        Text(
                                          listChain[index].symbol ?? '',
                                          style: AppFont.medium12.copyWith(
                                              color: ref.watch(indexbarDapp) ==
                                                      index
                                                  ? AppColor.lightText1
                                                  : Theme.of(context)
                                                      .hintColor),
                                        ),
                                      ],
                                    ),
                                  ))),
                    ),
                    widget.height(8),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).cardColor),
                            child: ref.watch(dappListProvider).when(
                              data: (data) {
                                return data.isEmpty
                                    ? const Empty(title: "No data")
                                    : ListView.builder(
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewWeb3Webview(
                                                            initialUrl:
                                                                data[index]
                                                                        .url ??
                                                                    '')));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 36,
                                                  height: 36,
                                                  child: ClipPolygon(
                                                    sides: 6,
                                                    child: Container(
                                                      color: AppColor.cardLight,
                                                      child: Image.asset(
                                                          data[index].image ??
                                                              AppImage.logo),
                                                    ),
                                                  ),
                                                ),
                                                widget.width(8),
                                                Expanded(
                                                    child: Column(
                                                  spacing: 1,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data[index].title ?? '',
                                                      style: AppFont.medium12
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .indicatorColor),
                                                    ),
                                                    Text(
                                                      data[index].subtitle ??
                                                          '',
                                                      style: AppFont.reguler10
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .hintColor),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        itemCount: data.length,
                                      );
                              },
                              error: (Object error, StackTrace stackTrace) {
                                return ErrorView(
                                  error: error.toString(),
                                  ontap: () {
                                    ref.refresh(dappListProvider);
                                  },
                                );
                              },
                              loading: () {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            )))
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget overview(WidgetRef ref) {
    return SizedBox(
      height: 122,
      child: Stack(
        children: [
          CarouselSlider(
              items: List.generate(
                  ref.watch(newsDappProvider).length,
                  (index) => Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.5,
                                  blurRadius: 0.3,
                                  color: Colors.white12)
                            ],
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                    ref.watch(newsDappProvider)[index]),
                                fit: BoxFit.cover)),
                      )),
              options: CarouselOptions(
                  height: 122,
                  viewportFraction: 1,
                  autoPlay: true,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    ref.read(indexCarouselProvider.notifier).changeIndex(index);
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(ref.watch(newsDappProvider).length,
                      (indexValue) {
                    int index = indexValue - 1;
                    index++;
                    return indicator(index, ref);
                  })),
            ),
          )
        ],
      ),
    );
  }

  Widget indicator(int index, WidgetRef ref) {
    return Container(
      width: ref.watch(indexCarouselProvider) == index ? 30 : 6,
      height: 6,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: ref.watch(indexCarouselProvider) == index
              ? AppColor.primaryColor
              : AppColor.grayColor,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
