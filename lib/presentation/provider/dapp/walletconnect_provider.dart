import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:reown_walletkit/reown_walletkit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web3dart/crypto.dart';

import '../../../data/model/account/account.dart';
import '../../../utils/util.dart';
import '../../../utils/walletConnect/deep_link_handler.dart';
import '../../../utils/walletConnect/eth_utils.dart';
import '../../../utils/walletConnect/evm_service.dart';
import '../../../utils/walletConnect/i_bottom_sheet_service.dart';
import '../../../utils/walletConnect/methods_utils.dart';
import '../../../utils/walletConnect/wc_connection_request_widget.dart';
import '../../../utils/walletConnect/wc_request_widget.dart';
import '../../../utils/walletConnect/wc_session_auth_request_widget.dart';
import '../account/account_provider.dart';
import '../provider.dart';

part 'walletconnect_provider.g.dart';

@riverpod
class Walletconnect extends _$Walletconnect {
  @override
  Future<ReownWalletKit> build() async {
    final walletKit = ReownWalletKit(
      core: ReownCore(
        projectId: '41d812d5157aac1b30c756ba6d41c41a',
        logLevel: LogLevel.error,
      ),
      metadata: const PairingMetadata(
        name: 'evozwallet',
        description:
            'Evoz decentralized wallet find the best assets in evoz Wallet.',
        url: 'https://majestic-meerkat-0f3d60.netlify.app/',
        icons: ['https://bethscan.io/assets/network_logo.svg'],
        redirect: Redirect(
          native: 'evozchain://',
          universal: 'https://majestic-meerkat-0f3d60.netlify.app',
          linkMode: true,
        ),
      ),
    );
    return walletKit;
  }

  Future<void> emitEvent() async {
    var walletKit = state.valueOrNull;
    final isOnline = walletKit!.core.connectivity.isOnline.value;
    log("is online => $isOnline");
    if (!isOnline) {
      await Future.delayed(const Duration(milliseconds: 500));
      emitEvent();
      return;
    }

    final sessions = walletKit.sessions.getAll();
    log("sessions ==> $sessions");
    for (var session in sessions) {
      log("sessions data==> $session");
      try {
        final events = NamespaceUtils.getNamespacesEventsForChain(
          chainId: 'eip155:1',
          namespaces: session.namespaces,
        );
        if (events.contains('accountsChanged')) {
          var account = ref.watch(selectedAccountProvider).valueOrNull;
          walletKit.emitSessionEvent(
            topic: session.topic,
            chainId: 'eip155:1',
            event: SessionEventParams(
              name: 'accountsChanged',
              data: [account?.addressETH],
            ),
          );
        }
      } catch (_) {}
    }
  }

  void registerAccount() {
    var walletKit = state.valueOrNull;
    var chain = ref.watch(tokenDappLinkProvider);
    var account = ref.watch(selectedAccountProvider).valueOrNull;

    walletKit!.registerAccount(
      chainId: "eip155:${chain.chainId}",
      accountAddress: account?.addressETH ?? '',
    );

    log("register account wc ${walletKit.core}");
  }

  void registerEmitHandler() {
    var walletKit = state.valueOrNull;
    final listChain = ref.watch(listChainSearchProvider);
    var chainDapp = ref.watch(tokenDappLinkProvider);
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    for (var chain in listChain) {
      EVMService(
        chainSupported: chain,
        walletKit: walletKit!,
        account: account ?? Account(),
        selectedDappChain: chainDapp,
      );
    }
  }

  Future<void> connectWallet(String uri) async {
    var walletKit = state.valueOrNull;
    if ((uri).isEmpty) return;
    try {
      DeepLinkHandler.waiting.value = true;
      await walletKit!.pair(uri: Uri.parse(uri));
    } on ReownSignError catch (e) {
      log("log error rewown: ${e.message}");
    } catch (_) {}
  }

  List<String> get _loaderMethods => [
    MethodConstants.WC_SESSION_PROPOSE,
    MethodConstants.WC_SESSION_REQUEST,
    MethodConstants.WC_SESSION_AUTHENTICATE,
  ];

  void onRelayClientMessage(MessageEvent? event) async {
    var walletKit = state.valueOrNull;
    if (event != null) {
      final jsonObject = await EthUtils.decodeMessageEvent(event, walletKit!);
      log('[BetherWallet] _onRelayClientMessage $jsonObject');
      log('[BetherWallet] _onRelayClientMessage ${jsonObject.method}');
      if (jsonObject is JsonRpcRequest) {
        log('[BetherWallet] _onRelayClientMessage ${jsonObject.method}');
        DeepLinkHandler.waiting.value = _loaderMethods.contains(
          jsonObject.method,
        );
      }
    }
  }

  void onSessionConnect(SessionConnect? args) {
    if (args != null) {
      final session = jsonEncode(args.session.toJson());
      log('[BetherWallet] _onSessionConnect $session');
    }
  }

  void onRelayClientError(ErrorEvent? args) {
    log('[BetherWallet] _onRelayClientError ${args?.error}');
  }

  void onPairingInvalid(PairingInvalidEvent? args) {
    log('[BetherWallet] _onPairingInvalid $args');
  }

  void onPairingCreate(PairingEvent? args) {
    log('[BetherWallet] _onPairingCreate $args');
  }

  void onSessionProposal(SessionProposalEvent? args) async {
    var walletKit = state.valueOrNull;
    final bottomSheetHandler = GetIt.I<IBottomSheetService>();
    if (args != null) {
      final proposer = args.params.proposer;
      log('[BetherWallet] _onSessionProposal $proposer');
      final result =
          (await bottomSheetHandler.queueBottomSheet(
            widget: WCRequestWidget(
              verifyContext: args.verifyContext,
              child: WCConnectionRequestWidget(
                proposalData: args.params,
                verifyContext: args.verifyContext,
                requester: proposer,
              ),
            ),
          )) ??
          WCBottomSheetResult.reject;

      log("result  => $result");
      if (result != WCBottomSheetResult.reject) {
        try {
          final session = await walletKit!.approveSession(
            id: args.id,
            namespaces: NamespaceUtils.regenerateNamespacesWithChains(
              args.params.generatedNamespaces!,
            ),
            sessionProperties: args.params.sessionProperties,
          );
          MethodsUtils(walletKit: walletKit).handleRedirect(
            session.topic,
            session.session!.peer.metadata.redirect,
          );
        } on ReownSignError catch (error) {
          MethodsUtils(
            walletKit: walletKit!,
          ).handleRedirect('', proposer.metadata.redirect, error.message);
        }
      } else {
        final error = Errors.getSdkError(Errors.USER_REJECTED).toSignError();
        await walletKit!.rejectSession(id: args.id, reason: error);
        await walletKit.core.pairing.disconnect(
          topic: args.params.pairingTopic,
        );
        MethodsUtils(
          walletKit: walletKit,
        ).handleRedirect('', proposer.metadata.redirect, error.message);
      }
    }
  }

  void onSessionProposalError(SessionProposalErrorEvent? args) async {
    var walletKit = state.valueOrNull;
    log('[BetherWallet] _onSessionProposalError $args');
    DeepLinkHandler.waiting.value = false;
    if (args != null) {
      String errorMessage = args.error.message;
      if (args.error.code == 5100) {
        errorMessage = errorMessage.replaceFirst(
          'Requested:',
          '\n\nRequested:',
        );
        errorMessage = errorMessage.replaceFirst(
          'Supported:',
          '\n\nSupported:',
        );
      }
      MethodsUtils(
        walletKit: walletKit!,
      ).goBackModal(title: 'Error', message: errorMessage, success: false);
    }
  }

  void onSessionAuthRequest(SessionAuthRequest? args) async {
    var walletKit = state.valueOrNull;

    final listChain = ref.watch(listChainSearchProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final bottomSheetHandler = GetIt.I<IBottomSheetService>();
    if (args != null) {
      final SessionAuthPayload authPayload = args.authPayload;
      final jsonPyaload = jsonEncode(authPayload.toJson());
      log('[BetherWallet] _onSessionAuthRequest $jsonPyaload');
      final supportedChains = listChain.map((e) => "eip155:${e.chainId}");
      final supportedMethods = SupportedEVMMethods.values.map((e) => e.name);
      final newAuthPayload = AuthSignature.populateAuthPayload(
        authPayload: authPayload,
        chains: supportedChains.toList(),
        methods: supportedMethods.toList(),
      );
      final cacaoRequestPayload = CacaoRequestPayload.fromSessionAuthPayload(
        newAuthPayload,
      );
      final List<Map<String, dynamic>> formattedMessages = [];
      for (var chain in newAuthPayload.chains) {
        final iss = 'did:pkh:$chain:${account?.addressETH}';
        final message = walletKit!.formatAuthMessage(
          iss: iss,
          cacaoPayload: cacaoRequestPayload,
        );
        formattedMessages.add({iss: message});
      }
      log("Formated message session auth request $formattedMessages");
      final WCBottomSheetResult rs =
          (await bottomSheetHandler.queueBottomSheet(
            widget: WCSessionAuthRequestWidget(
              child: WCConnectionRequestWidget(
                sessionAuthPayload: newAuthPayload,
                verifyContext: args.verifyContext,
                requester: args.requester,
              ),
            ),
          )) ??
          WCBottomSheetResult.reject;

      if (rs != WCBottomSheetResult.reject) {
        final credentials = EthPrivateKey.fromHex(
          EcryptionHelper().decrypt(account?.keyETH ?? ''),
        );
        //
        final messageToSign = formattedMessages.length;
        final count = (rs == WCBottomSheetResult.one) ? 1 : messageToSign;
        //
        final List<Cacao> cacaos = [];
        for (var i = 0; i < count; i++) {
          final iss = formattedMessages[i].keys.first;
          final message = formattedMessages[i].values.first;
          final signature = credentials.signPersonalMessageToUint8List(
            Uint8List.fromList(message.codeUnits),
          );
          final hexSignature = bytesToHex(signature, include0x: true);
          cacaos.add(
            AuthSignature.buildAuthObject(
              requestPayload: cacaoRequestPayload,
              signature: CacaoSignature(
                t: CacaoSignature.EIP191,
                s: hexSignature,
              ),
              iss: iss,
            ),
          );
        }
        //
        try {
          final session = await walletKit!.approveSessionAuthenticate(
            id: args.id,
            auths: cacaos,
          );
          MethodsUtils(walletKit: walletKit).handleRedirect(
            session.topic,
            session.session?.peer.metadata.redirect,
          );
        } on ReownSignError catch (error) {
          MethodsUtils(walletKit: walletKit!).handleRedirect(
            args.topic,
            args.requester.metadata.redirect,
            error.message,
          );
        }
      } else {
        final error = Errors.getSdkError(Errors.USER_REJECTED_AUTH);
        await walletKit!.rejectSessionAuthenticate(
          id: args.id,
          reason: error.toSignError(),
        );
        MethodsUtils(walletKit: walletKit).handleRedirect(
          args.topic,
          args.requester.metadata.redirect,
          error.message,
        );
      }
    }
  }
}
