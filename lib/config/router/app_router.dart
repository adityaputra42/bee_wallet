import 'package:bee_wallet/presentation/screens/auth/pin/confirm_pin_screen.dart';
import 'package:bee_wallet/presentation/screens/auth/pin/create_pin_screen.dart';
import 'package:bee_wallet/presentation/screens/auth/succes/success_create_wallet.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/screens/auth/succes/confirm_parse_create.dart';
import '../../presentation/screens/auth/create_new_account/create_wallet_name.dart';
import '../../presentation/screens/auth/succes/sheed_parse_create.dart';
import '../../presentation/screens/auth/import_account/import_account_screen.dart';
import '../../presentation/screens/dashboard/home/AddNetwork/add_custom_network.dart';
import '../../presentation/screens/dashboard/home/AddNetwork/add_network.dart';
import '../../presentation/screens/dashboard/home/add_account/import_wallet.dart';
import '../../presentation/screens/dashboard/home/changeAccount/detail_accunt.dart';
import '../../presentation/screens/dashboard/home/changeNetwork/select_network_screen.dart';
import '../../presentation/screens/dashboard/home/detailNft/detail_nft.dart';
import '../../presentation/screens/dashboard/home/detailNft/detail_nft_view.dart';
import '../../presentation/screens/dashboard/home/detailNft/transfer/custom_gas_fee_nft.dart';
import '../../presentation/screens/dashboard/home/detailNft/transfer/transaction_succes.dart';
import '../../presentation/screens/dashboard/home/detailNft/transfer/transfer_nft_screen.dart';
import '../../presentation/screens/dashboard/home/detailToken/detail_activity.dart';
import '../../presentation/screens/dashboard/home/detailToken/detail_token_screnn.dart';
import '../../presentation/screens/dashboard/home/manage_token/add_token.dart';
import '../../presentation/screens/dashboard/home/manage_token/manage_token.dart';
import '../../presentation/screens/dashboard/home/receive/receive_screen.dart';
import '../../presentation/screens/dashboard/home/selectAsset/select_asset.dart';
import '../../presentation/screens/dashboard/home/transfer/choose_receiver_screen.dart';
import '../../presentation/screens/dashboard/home/transfer/custom_gas_fee.dart';
import '../../presentation/screens/dashboard/home/transfer/transaction_progress_screen.dart';
import '../../presentation/screens/dashboard/main_screen.dart';
import '../../presentation/screens/dashboard/setting/backup_pharse/backup_setting_screen.dart';
import '../../presentation/screens/dashboard/setting/backup_pharse/confirm_pharse_setting.dart';
import '../../presentation/screens/dashboard/setting/backup_pharse/sheed_pharse_setting.dart';
import '../../presentation/screens/dashboard/setting/changePin/change_pin.dart';
import '../../presentation/screens/dashboard/setting/changePin/confirm_pin.dart';
import '../../presentation/screens/dashboard/setting/show_pharse/seed_pharse_show.dart';
import '../../presentation/screens/dashboard/setting/show_pharse/show_pharse.dart';
import '../../presentation/screens/welcome/getstarted/get_started_screen.dart';
import '../../presentation/screens/welcome/onboarding/onboarding_screen.dart';
import '../../presentation/screens/welcome/splahScreen/splash_screen.dart';
part 'app_router.g.dart';

@riverpod
GoRouter appRoute(AppRouteRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
          path: '/get_started',
          name: 'get_started',
          builder: (context, state) => const GetStartedScreen(),
          routes: [
            GoRoute(
                path: 'create_pin_register',
                name: 'create_pin_register',
                builder: (context, state) => const CreatePinScreen(),
                routes: [
                  GoRoute(
                      path: 'confirm_pin_register',
                      name: 'confirm_pin_register',
                      builder: (context, state) => const ConfirmPinScreen(),
                      routes: [
                        GoRoute(
                          path: 'create_wallet',
                          name: 'create_wallet',
                          builder: (context, state) => const CreateWalletName(),
                        ),
                        GoRoute(
                          path: 'import_account',
                          name: 'import_account',
                          builder: (context, state) =>
                              const ImportAccountScreen(),
                        ),
                      ]),
                ]),
          ]),
      GoRoute(
          path: '/succes_register',
          name: 'succes_register',
          builder: (context, state) => const SuccesCreateAccount(),
          routes: [
            GoRoute(
                path: 'sheed_parse_create',
                name: 'sheed_parse_create',
                builder: (context, state) => const SheedPharseCreate(),
                routes: [
                  GoRoute(
                    path: 'confirm_parse_create',
                    name: 'confirm_parse_create',
                    builder: (context, state) => const ConfirmPharseCreate(),
                  ),
                ]),
          ]),
      GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: 'import_wallet',
              name: 'import_wallet',
              builder: (context, state) => const ImportWallet(),
            ),
            GoRoute(
                path: 'detail_token',
                name: 'detail_token',
                builder: (context, state) => const DetailTokenScreen(),
                routes: [
                  GoRoute(
                    path: 'detail_activity',
                    name: 'detail_activity',
                    builder: (context, state) => DetailActivity(),
                  ),
                 
                  GoRoute(
                    path: 'receive_token',
                    name: 'receive_token',
                    builder: (context, state) => const ReceiveScreen(),
                  ),
                  GoRoute(
                      path: 'choose_receiver',
                      name: 'choose_receiver',
                      builder: (context, state) => const ChooseReceiverScreen(),
                      routes: [
                        GoRoute(
                          path: 'custom_gas_fee',
                          name: 'custom_gas_fee',
                          builder: (context, state) => const CustomGasFee(),
                        ),
                        GoRoute(
                          path: 'transaction_progress',
                          name: 'transaction_progress',
                          builder: (context, state) =>
                              const TransactionProgressScreen(),
                        ),
                      ]),
                ]),
            GoRoute(
              path: 'detail_wallet',
              name: 'detail_wallet',
              builder: (context, state) => const DetailAccount(),
            ),
            GoRoute(
              path: 'select_asset',
              name: 'select_asset',
              builder: (context, state) => const SelectAsset(),
            ),
            GoRoute(
                path: 'manage_token',
                name: 'manage_token',
                builder: (context, state) => const ManageToken(),
                routes: [
                  GoRoute(
                    path: 'add_token',
                    name: 'add_token',
                    builder: (context, state) => AddToken(),
                  ),
                ]),
            GoRoute(
                path: 'select_network',
                name: 'select_network',
                builder: (context, state) => const SelectNetworkScreen(),
                routes: [
                  GoRoute(
                      path: 'add_network',
                      name: 'add_network',
                      builder: (context, state) => const AddNetwork(),
                      routes: [
                        GoRoute(
                          path: 'add_custom_network',
                          name: 'add_custom_network',
                          builder: (context, state) => const AddCustomNetwork(),
                        ),
                      ]),
                ]),
            GoRoute(
                path: 'backup_setting',
                name: 'backup_setting',
                builder: (context, state) => const BackupSettingScreen(),
                routes: [
                  GoRoute(
                      path: 'sheed_parse_setting',
                      name: 'sheed_parse_setting',
                      builder: (context, state) => const SheedPharseSetting(),
                      routes: [
                        GoRoute(
                          path: 'confirm_parse_setting',
                          name: 'confirm_parse_setting',
                          builder: (context, state) =>
                              const ConfirmPharseSetting(),
                        ),
                      ]),
                ]),
            GoRoute(
                path: 'show_parse',
                name: 'show_parse',
                builder: (context, state) => const ShowParse(),
                routes: [
                  GoRoute(
                    path: 'seed_pharse_show',
                    name: 'seed_pharse_show',
                    builder: (context, state) => const SheedPharseShow(),
                  ),
                ]),
            GoRoute(
                path: 'change_pin',
                name: 'change_pin',
                builder: (context, state) => const ChangePin(),
                routes: [
                  GoRoute(
                    path: 'confirm_pin',
                    name: 'confirm_pin',
                    builder: (context, state) => const ConfirmPin(),
                  ),
                ]),
            GoRoute(
                path: 'detail_nft_view',
                name: 'detail_nft_view',
                builder: (context, state) => const DetailNftView(),
                routes: [
                  GoRoute(
                    path: 'transaction_nft_success',
                    name: 'transaction_nft_success',
                    builder: (context, state) =>
                        const TransactionSuccesScreen(),
                  ),
                  GoRoute(
                      path: 'detail_nft',
                      name: 'detail_nft',
                      builder: (context, state) => const DetailNft(),
                      routes: [
                        GoRoute(
                            path: 'transfer_nft',
                            name: 'transfer_nft',
                            builder: (context, state) =>
                                const TransferNftScreen(),
                            routes: [
                              GoRoute(
                                path: 'custom_gas_fee_nft',
                                name: 'custom_gas_fee_nft',
                                builder: (context, state) =>
                                    const CustomGasFeeNFT(),
                              ),
                            ]),
                      ]),
                ]),
          ]),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
  );
}
