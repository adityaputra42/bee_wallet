import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import '../../presentation/provider/dapp/walletconnect_provider.dart';

class DeepLinkHandler {
  static const _methodChannel = MethodChannel(
    'com.evozchain.io/methods',
  );
  static const _eventChannel = EventChannel(
    'com.evozchain.io/events',
  );
  static final waiting = ValueNotifier<bool>(false);

  final ReownWalletKit walletKit;

  DeepLinkHandler({required this.walletKit});
  void initListener(WidgetRef ref) {
    if (kIsWeb) return;
    _eventChannel.receiveBroadcastStream().listen(
          (event) => _onLink(event, ref),
          onError: _onError,
        );
  }

  static void checkInitialLink() async {
    if (kIsWeb) return;
    try {
      _methodChannel.invokeMethod('initialLink');
    } catch (e) {
      log('[SampleWallet] [DeepLinkHandler] checkInitialLink $e');
    }
  }

  Uri get nativeUri => Uri.parse(walletKit.metadata.redirect?.native ?? '');
  Uri get universalUri =>
      Uri.parse(walletKit.metadata.redirect?.universal ?? '');
  String get host => universalUri.host;

  void _onLink(Object? event, WidgetRef ref) async {
    log("link event => $event");
    final walletKit = ref.watch(walletconnectProvider).valueOrNull;

    if (walletKit == null) {
      log('[SampleWallet] [DeepLinkHandler] walletKit is null');
      return;
    }
    final ev = ReownCoreUtils.getSearchParamFromURL('$event', 'wc_ev');

    if (ev.isNotEmpty) {
      log('[SampleWallet] is linkMode $event');
      await walletKit.dispatchEnvelope('$event');
    } else {
      final decodedUri = Uri.parse(Uri.decodeFull(event.toString()));
      if (decodedUri.isScheme('wc')) {
        log('[SampleWallet] is legacy uri $decodedUri');
        waiting.value = true;
        await walletKit.pair(uri: decodedUri);
      } else {
        final uriParam = ReownCoreUtils.getSearchParamFromURL(
          '$decodedUri',
          'uri',
        );
        if (decodedUri.isScheme(nativeUri.scheme) && uriParam.isNotEmpty) {
          log('[SampleWallet] is custom uri $decodedUri');
          waiting.value = true;
          final pairingUri = decodedUri.query.replaceFirst('uri=', '');
          await walletKit.pair(uri: Uri.parse(pairingUri));
        }
      }
    }
  }

  static void _onError(Object error) {
    waiting.value = false;
    debugPrint('[SampleWallet] [DeepLinkHandler] _onError $error');
  }
}
