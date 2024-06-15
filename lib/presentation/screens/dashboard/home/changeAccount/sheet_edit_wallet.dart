// import 'package:blockies_ethereum/blockies_ethereum.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:bee_wallet/utils/util.dart';
// import '../../../../../config/config.dart';
// import '../../../../provider/account/account_provider.dart';
// import '../../../../widget/widget.dart';

// final textEditController =
//     StateProvider<TextEditingController>((ref) => TextEditingController());

// class SheetEditWallet extends ConsumerWidget {
//   const SheetEditWallet({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final account = ref.watch(accountSelectedEditProvider);

//     return Padding(
//       padding: EdgeInsets.fromLTRB(
//           16.w, 0.h, 16.w, MediaQuery.of(context).viewInsets.bottom),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "Edit Wallet Name",
//             style: AppFont.medium16
//                 .copyWith(color: Theme.of(context).indicatorColor),
//             textAlign: TextAlign.center,
//           ),
//           16.0.height,
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16.w),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.r),
//                 color: Theme.of(context).cardColor),
//             child: Row(
//               children: [
//                 Container(
//                   width: 36.w,
//                   height: 36.w,
//                   // padding: EdgeInsets.all(3.h),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border:
//                           Border.all(width: 1.w, color: AppColor.primaryColor)),
//                   child: Center(
//                     child: Blockies(
//                         size: 0.45,
//                         data: account.addressETH ?? '-',
//                         shape: BlockiesShape.circle),
//                   ),
//                 ),
//                 12.0.width,
//                 Expanded(
//                   child: Text(
//                     account.name ?? '',
//                     style: AppFont.semibold16
//                         .copyWith(color: Theme.of(context).indicatorColor),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           16.0.height,
//           InputText(
//             title: "Edit Wallet Name",
//             hintText: 'My wallet',
//             textInputAction: TextInputAction.done,
//             controller: ref.watch(textEditController),
//           ),
//           16.0.height,
//           PrimaryButton(
//               margin: EdgeInsets.only(bottom: 8.h),
//               title: "Update Wallet",
//               onPressed: () {
//                 ref
//                     .read(accountSelectedEditProvider.notifier)
//                     .changeEditAccount(
//                         account.id!, ref.watch(textEditController).text);
//                 ref.watch(selectedAccountProvider);
//                 ref.watch(accountListProvider);
//                 ref.watch(textEditController).clear();
//                 Navigator.pop(context);
//               }),
//           SecondaryButton(
//               margin: EdgeInsets.only(bottom: 24.h),
//               title: "Cancel",
//               onPressed: () {
//                 Navigator.pop(context);
//               })
//         ],
//       ),
//     );
//   }
// }
