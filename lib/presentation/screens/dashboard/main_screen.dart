// ignore_for_file: unused_result

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../../utils/walletConnect/bottom_sheet_listener.dart';
import '../../../utils/walletConnect/deep_link_handler.dart';
import '../../provider/account/account_provider.dart';
import '../../provider/dapp/walletconnect_provider.dart';
import '../../provider/provider.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/widget.dart';
import 'dapps/dapp_screen.dart';
import 'home/home_screen.dart';
import 'setting/setting_secreen.dart';
import 'swap/swap_screen.dart';

final indexNavBarProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    body() {
      switch (ref.watch(indexNavBarProvider)) {
        case 0:
          return const HomeScreen();
        case 1:
          return SwapScreen();
        case 2:
          return const DappScreen();
        case 3:
          return const SettingScreen();

        default:
          return const HomeScreen();
      }
    }

    loading() {
      return LoadingOverlay(
        isLoading: true,
        color: Colors.black.withValues(alpha: 0.25),
        progressIndicator: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        child: body(),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // bottomNavigationBar: CustomBottomNavBar(
      //   onTap: (index) => ref.read(indexNavBarProvider.notifier).state = index,
      //   selectedIndex: ref.watch(indexNavBarProvider),
      // ),
      bottomNavigationBar: SafeArea(
        child: CustomNavbar(
          onTap:
              (index) => ref.read(indexNavBarProvider.notifier).state = index,
          selectedIndex: ref.watch(indexNavBarProvider),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          return ref
              .watch(selectedAccountProvider)
              .when(
                data: (data) {
                  return ref
                      .watch(accountListProvider)
                      .when(
                        data: (data) {
                          return ref
                              .watch(tokenChainOriginProvider)
                              .when(
                                data: (data) {
                                  return ref
                                      .watch(listTokenChainProvider)
                                      .when(
                                        data: (data) {
                                          return ref
                                              .watch(selectedChainTokenProvider)
                                              .when(
                                                data: (data) {
                                                  return ref
                                                      .watch(
                                                        balanceChainProvider,
                                                      )
                                                      .when(
                                                        data: (data) {
                                                          ref.watch(
                                                            balancePeriodicProvider,
                                                          );
                                                          return ref
                                                              .watch(
                                                                walletconnectProvider,
                                                              )
                                                              .when(
                                                                data: (data) {
                                                                  DeepLinkHandler(
                                                                    walletKit:
                                                                        data,
                                                                  ).initListener(
                                                                    ref,
                                                                  );
                                                                  data
                                                                      .core
                                                                      .pairing
                                                                      .onPairingInvalid
                                                                      .subscribe(
                                                                        ref
                                                                            .read(
                                                                              walletconnectProvider.notifier,
                                                                            )
                                                                            .onPairingInvalid,
                                                                      );
                                                                  data
                                                                      .core
                                                                      .pairing
                                                                      .onPairingCreate
                                                                      .subscribe(
                                                                        ref
                                                                            .read(
                                                                              walletconnectProvider.notifier,
                                                                            )
                                                                            .onPairingCreate,
                                                                      );
                                                                  data
                                                                      .core
                                                                      .relayClient
                                                                      .onRelayClientError
                                                                      .subscribe(
                                                                        ref
                                                                            .read(
                                                                              walletconnectProvider.notifier,
                                                                            )
                                                                            .onRelayClientError,
                                                                      );
                                                                  data
                                                                      .core
                                                                      .relayClient
                                                                      .onRelayClientMessage
                                                                      .subscribe(
                                                                        ref
                                                                            .read(
                                                                              walletconnectProvider.notifier,
                                                                            )
                                                                            .onRelayClientMessage,
                                                                      );
                                                                  data.onSessionProposal.subscribe(
                                                                    ref
                                                                        .read(
                                                                          walletconnectProvider
                                                                              .notifier,
                                                                        )
                                                                        .onSessionProposal,
                                                                  );
                                                                  data.onSessionProposalError.subscribe(
                                                                    ref
                                                                        .read(
                                                                          walletconnectProvider
                                                                              .notifier,
                                                                        )
                                                                        .onSessionProposalError,
                                                                  );
                                                                  data.onSessionConnect.subscribe(
                                                                    ref
                                                                        .read(
                                                                          walletconnectProvider
                                                                              .notifier,
                                                                        )
                                                                        .onSessionConnect,
                                                                  );
                                                                  data.onSessionAuthRequest.subscribe(
                                                                    ref
                                                                        .read(
                                                                          walletconnectProvider
                                                                              .notifier,
                                                                        )
                                                                        .onSessionAuthRequest,
                                                                  );
                                                                  ref
                                                                      .read(
                                                                        walletconnectProvider
                                                                            .notifier,
                                                                      )
                                                                      .registerAccount();
                                                                  ref
                                                                      .read(
                                                                        walletconnectProvider
                                                                            .notifier,
                                                                      )
                                                                      .registerEmitHandler();
                                                                  data.init();
                                                                  log(
                                                                    " wc init succes",
                                                                  );
                                                                  ref
                                                                      .read(
                                                                        walletconnectProvider
                                                                            .notifier,
                                                                      )
                                                                      .emitEvent();

                                                          return BottomSheetListener(
                                                            child: body(),
                                                          );
                                                        },
                                                          error: (
                                                            Object error,
                                                            StackTrace
                                                            stackTrace,
                                                          ) {
                                                            return ErrorView(
                                                              error:
                                                                  error
                                                                      .toString(),
                                                              ontap: () {
                                                                ref.refresh(
                                                                  balanceChainProvider,
                                                                );
                                                                ref.watch(
                                                                  balancePeriodicProvider,
                                                                );
                                                              },
                                                            );
                                                          },
                                                          loading: () {
                                                            return loading();
                                                          },
                                                        );
                                                        },
                                                        error: (
                                                          Object error,
                                                          StackTrace stackTrace,
                                                        ) {
                                                          return ErrorView(
                                                            error:
                                                                error
                                                                    .toString(),
                                                            ontap: () {
                                                              ref.refresh(
                                                                balanceChainProvider,
                                                              );
                                                              ref.watch(
                                                                balancePeriodicProvider,
                                                              );
                                                            },
                                                          );
                                                        },
                                                        loading: () {
                                                          return loading();
                                                        },
                                                      );
                                                },
                                                error: (
                                                  Object error,
                                                  StackTrace stackTrace,
                                                ) {
                                                  return ErrorView(
                                                    error: error.toString(),
                                                    ontap: () {
                                                      ref.refresh(
                                                        selectedChainTokenProvider,
                                                      );
                                                    },
                                                  );
                                                },
                                                loading: () {
                                                  return loading();
                                                },
                                              );
                                        },
                                        error: (
                                          Object error,
                                          StackTrace stackTrace,
                                        ) {
                                          return ErrorView(
                                            error: error.toString(),
                                            ontap: () {
                                              ref.refresh(
                                                listTokenChainProvider,
                                              );
                                            },
                                          );
                                        },
                                        loading: () {
                                          return loading();
                                        },
                                      );
                                },
                                error: (Object error, StackTrace stackTrace) {
                                  return ErrorView(
                                    error: error.toString(),
                                    ontap: () {
                                      ref.refresh(tokenChainOriginProvider);
                                    },
                                  );
                                },
                                loading: () {
                                  return loading();
                                },
                              );
                        },
                        error: (Object error, StackTrace stackTrace) {
                          return ErrorView(
                            error: error.toString(),
                            ontap: () {
                              ref.refresh(accountListProvider);
                            },
                          );
                        },
                        loading: () {
                          return loading();
                        },
                      );
                },
                error: (Object error, StackTrace stackTrace) {
                  return ErrorView(
                    error: error.toString(),
                    ontap: () {
                      ref.refresh(selectedAccountProvider);
                    },
                  );
                },
                loading: () {
                  return loading();
                },
              );
        },
      ),
    );
  }
}
