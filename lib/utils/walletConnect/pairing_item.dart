// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:reown_walletkit/reown_walletkit.dart';

// import '../../presentation/provider/dapp/walletconnect_provider.dart';
// import 'deep_link_handler.dart';

// class PairingItem extends ConsumerWidget {
//   const PairingItem({
//     super.key,
//     required this.pairing,
//     required this.onTap,
//   });

//   final PairingInfo pairing;
//   final void Function() onTap;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var walletKit = ref.watch(walletconnectProvider).valueOrNull;
//     PairingMetadata? metadata = pairing.peerMetadata;
//     if (metadata == null) {
//       return ListTile(
//         title: const Text('Unknown'),
//         subtitle: const Text('No metadata available'),
//         onTap: onTap,
//       );
//     }
//     final sessions = walletKit!.sessions
//         .getAll()
//         .where((element) => element.pairingTopic == pairing.topic)
//         .toList();

//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: (metadata.icons.isNotEmpty
//                 ? NetworkImage(metadata.icons[0])
//                 : const AssetImage('assets/images/logo.png'))
//             as ImageProvider<Object>,
//       ),
//       title: Text(
//         metadata.name,
//         style: const TextStyle(color: Colors.black),
//       ),
//       subtitle: Text(
//         sessions.isEmpty
//             ? DeepLinkHandler.waiting.value
//                 ? 'Settling session. Wait...'
//                 : 'No active sessions'
//             : 'Active sessions: ${sessions.length}',
//         style: TextStyle(
//           color: sessions.isEmpty
//               ? DeepLinkHandler.waiting.value
//                   ? Colors.green
//                   : Colors.black
//               : Colors.blueAccent,
//           fontSize: 13.0,
//           fontWeight: sessions.isEmpty
//               ? DeepLinkHandler.waiting.value
//                   ? FontWeight.bold
//                   : FontWeight.normal
//               : FontWeight.bold,
//         ),
//       ),
//       trailing: const Icon(
//         Icons.arrow_forward_ios,
//         size: 20.0,
//         color: Colors.black,
//       ),
//       onTap: onTap,
//     );
//   }
// }
