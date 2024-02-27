import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

@riverpod
GoRouter appRoute(AppRouteRef ref) {
  return GoRouter(routes: [
    // GoRoute(
    //   path: '/',
    //   name: 'splash',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    // GoRoute(
    //   path: '/onboarding',
    //   name: 'onboarding',
    //   builder: (context, state) => OnBoardingScreen(),
    // ),
    // GoRoute(
    //   path: '/get_started',
    //   name: 'get_started',
    //   builder: (context, state) => const GetStartedScreen(),
    // ),
    // GoRoute(
    //   path: '/succes_register',
    //   name: 'succes_register',
    //   builder: (context, state) => const SuccesRegister(),
    // ),
    // GoRoute(
    //     path: '/choose_register',
    //     name: 'choose_register',
    //     builder: (context, state) => const ChooseRegisterScreen(),
    //     routes: [
    //       GoRoute(
    //           path: 'create_wallet',
    //           name: 'create_wallet',
    //           builder: (context, state) => const CreateWalletName(),
    //           routes: [
    //             GoRoute(
    //                 path: 'loading_create_wallet',
    //                 name: 'loading_create_wallet',
    //                 builder: (context, state) =>
    //                     const LoadingCreateWalletScreen(),
    //                 routes: [
    //                   GoRoute(
    //                       path: 'backup_create',
    //                       name: 'backup_create',
    //                       builder: (context, state) => const BackupScreen(),
    //                       routes: [
    //                         GoRoute(
    //                             path: 'sheed_parse_create',
    //                             name: 'sheed_parse_create',
    //                             builder: (context, state) =>
    //                                 const SheedPharseCreate(),
    //                             routes: [
    //                               GoRoute(
    //                                 path: 'confirm_parse_create',
    //                                 name: 'confirm_parse_create',
    //                                 builder: (context, state) =>
    //                                     const ConfirmPharseCreate(),
    //                               ),
    //                             ]),
    //                       ]),
    //                 ]),
    //           ]),
    //       GoRoute(
    //         path: 'import_account',
    //         name: 'import_account',
    //         builder: (context, state) => const ImportAccountScreen(),
    //       ),
    //     ]),
    // GoRoute(
    //     path: '/main',
    //     name: 'main',
    //     builder: (context, state) => const MainScreen(),
    //     routes: [
    //       GoRoute(
    //         path: 'import_wallet',
    //         name: 'import_wallet',
    //         builder: (context, state) => const ImportWallet(),
    //       ),
    //       GoRoute(
    //           path: 'detail_token',
    //           name: 'detail_token',
    //           builder: (context, state) => const DetailTokenScreen(),
    //           routes: [
    //             GoRoute(
    //               path: 'detail_activity',
    //               name: 'detail_activity',
    //               builder: (context, state) => DetailActivity(),
    //             ),
    //             GoRoute(
    //               path: 'detail_trade_token',
    //               name: 'detail_trade_token',
    //               builder: (context, state) => const DetailTradeTokenScreen(),
    //             ),
    //             GoRoute(
    //               path: 'receive_token',
    //               name: 'receive_token',
    //               builder: (context, state) => const ReceiveScreen(),
    //             ),
    //             GoRoute(
    //                 path: 'choose_receiver',
    //                 name: 'choose_receiver',
    //                 builder: (context, state) => const ChooseReceiverScreen(),
    //                 routes: [
    //                   GoRoute(
    //                     path: 'custom_gas_fee',
    //                     name: 'custom_gas_fee',
    //                     builder: (context, state) => const CustomGasFee(),
    //                   ),
    //                   GoRoute(
    //                     path: 'transaction_progress',
    //                     name: 'transaction_progress',
    //                     builder: (context, state) =>
    //                         const TransactionProgressScreen(),
    //                   ),
    //                 ]),
    //           ]),
    //       GoRoute(
    //         path: 'detail_wallet',
    //         name: 'detail_wallet',
    //         builder: (context, state) => const DetailAccount(),
    //       ),
    //       GoRoute(
    //         path: 'select_asset',
    //         name: 'select_asset',
    //         builder: (context, state) => const SelectAsset(),
    //       ),
    //       GoRoute(
    //           path: 'manage_token',
    //           name: 'manage_token',
    //           builder: (context, state) => const ManageToken(),
    //           routes: [
    //             GoRoute(
    //               path: 'add_token',
    //               name: 'add_token',
    //               builder: (context, state) => AddToken(),
    //             ),
    //           ]),
    //       GoRoute(
    //           path: 'select_network',
    //           name: 'select_network',
    //           builder: (context, state) => const SelectNetworkScreen(),
    //           routes: [
    //             GoRoute(
    //                 path: 'add_network',
    //                 name: 'add_network',
    //                 builder: (context, state) => const AddNetwork(),
    //                 routes: [
    //                   GoRoute(
    //                     path: 'add_custom_network',
    //                     name: 'add_custom_network',
    //                     builder: (context, state) => const AddCustomNetwork(),
    //                   ),
    //                 ]),
    //           ]),
    //       GoRoute(
    //           path: 'backup_setting',
    //           name: 'backup_setting',
    //           builder: (context, state) => const BackupSettingScreen(),
    //           routes: [
    //             GoRoute(
    //                 path: 'sheed_parse_setting',
    //                 name: 'sheed_parse_setting',
    //                 builder: (context, state) => const SheedPharseSetting(),
    //                 routes: [
    //                   GoRoute(
    //                     path: 'confirm_parse_setting',
    //                     name: 'confirm_parse_setting',
    //                     builder: (context, state) =>
    //                         const ConfirmPharseSetting(),
    //                   ),
    //                 ]),
    //           ]),
    //       GoRoute(
    //           path: 'show_parse',
    //           name: 'show_parse',
    //           builder: (context, state) => const ShowParse(),
    //           routes: [
    //             GoRoute(
    //               path: 'seed_pharse_show',
    //               name: 'seed_pharse_show',
    //               builder: (context, state) => const SheedPharseShow(),
    //             ),
    //           ]),
    //       GoRoute(
    //           path: 'change_pin',
    //           name: 'change_pin',
    //           builder: (context, state) => const ChangePin(),
    //           routes: [
    //             GoRoute(
    //               path: 'confirm_pin',
    //               name: 'confirm_pin',
    //               builder: (context, state) => const ConfirmPin(),
    //             ),
    //           ]),
    //       GoRoute(
    //           path: 'detail_nft_view',
    //           name: 'detail_nft_view',
    //           builder: (context, state) => const DetailNftView(),
    //           routes: [
    //             GoRoute(
    //               path: 'transaction_nft_success',
    //               name: 'transaction_nft_success',
    //               builder: (context, state) => const TransactionSuccesScreen(),
    //             ),
    //             GoRoute(
    //                 path: 'detail_nft',
    //                 name: 'detail_nft',
    //                 builder: (context, state) => const DetailNft(),
    //                 routes: [
    //                   GoRoute(
    //                       path: 'transfer_nft',
    //                       name: 'transfer_nft',
    //                       builder: (context, state) =>
    //                           const TransferNftScreen(),
    //                       routes: [
    //                         GoRoute(
    //                           path: 'custom_gas_fee_nft',
    //                           name: 'custom_gas_fee_nft',
    //                           builder: (context, state) =>
    //                               const CustomGasFeeNFT(),
    //                         ),
    //                       ]),
    //                 ]),
    //           ]),
        // ]),
  ], initialLocation: '/', debugLogDiagnostics: true);
}
