// ignore_for_file: unused_result

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../provider/account/account_provider.dart';
import '../../provider/provider.dart';
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
          return const SwapScreen();
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
        color: Colors.black,
        opacity: 0.3,
        progressIndicator: Center(
          child: CupertinoActivityIndicator(
            radius: 20.r,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        child: body(),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (index) => ref.read(indexNavBarProvider.notifier).state = index,
        selectedIndex: ref.watch(indexNavBarProvider),
      ),
      body: Consumer(builder: (context, ref, _) {
        return ref.watch(selectedAccountProvider).when(
          data: (data) {
            if (ref.watch(selectedAccountProvider).isRefreshing) {
              return loading();
            }
            return ref.watch(accountListProvider).when(
              data: (data) {
                if (ref.watch(accountListProvider).isRefreshing) {
                  return loading();
                }
                return ref.watch(tokenChainOriginProvider).when(
                  data: (data) {
                    if (ref.watch(tokenChainOriginProvider).isRefreshing) {
                      return loading();
                    }
                    return ref.watch(listTokenChainProvider).when(
                      data: (data) {
                        if (ref.watch(listTokenChainProvider).isRefreshing) {
                          return loading();
                        }
                        return ref.watch(selectedChainTokenProvider).when(
                          data: (data) {
                            if (ref
                                .watch(selectedChainTokenProvider)
                                .isRefreshing) {
                              return loading();
                            }
                            return ref.watch(balanceChainProvider).when(
                              data: (data) {
                                if (ref
                                    .watch(balanceChainProvider)
                                    .isRefreshing) {
                                  return loading();
                                }
                                ref.watch(balancePeriodicProvider);

                                return body();
                              },
                              error: (Object error, StackTrace stackTrace) {
                                return ErrorView(
                                  error: error.toString(),
                                  ontap: () {
                                    ref.refresh(balanceChainProvider);
                                    ref.watch(balancePeriodicProvider);
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
                                ref.refresh(selectedChainTokenProvider);
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
                            ref.refresh(listTokenChainProvider);
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
      }),
    );
  }
}
