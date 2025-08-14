import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import '../../config/config.dart';
import '../../presentation/provider/account/account_provider.dart';
import '../../presentation/provider/dapp/walletconnect_provider.dart';
import '../../presentation/widget/card_general.dart';
import 'namespace_model_builder.dart';
import 'wc_connection_model.dart';
import 'wc_connection_widget.dart';

class WCConnectionRequestWidget extends ConsumerWidget {
  const WCConnectionRequestWidget({
    super.key,
    this.sessionAuthPayload,
    this.proposalData,
    this.requester,
    this.verifyContext,
  });

  final SessionAuthPayload? sessionAuthPayload;
  final ProposalData? proposalData;
  final ConnectionMetadata? requester;
  final VerifyContext? verifyContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var walletKit = ref.watch(walletconnectProvider).valueOrNull;
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    if (requester == null) {
      return const Text('ERROR');
    }

    return CardGeneral(
      margin: EdgeInsets.zero,
      background: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          height(8),
          Text(
            '${requester!.metadata.name} would Like To Connect',
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          height(8),
          (sessionAuthPayload != null)
              ? _buildSessionAuthRequestView(
                  walletKit!, account?.addressETH ?? '')
              : _buildSessionProposalView(context),
        ],
      ),
    );
  }

  Widget _buildSessionAuthRequestView(
      ReownWalletKit walletKit, String address) {
    final cacaoPayload = CacaoRequestPayload.fromSessionAuthPayload(
      sessionAuthPayload!,
    );

    //
    final List<WCConnectionModel> messagesModels = [];
    for (var chain in sessionAuthPayload!.chains) {
      final iss = 'did:pkh:$chain:$address';
      final message = walletKit.formatAuthMessage(
        iss: iss,
        cacaoPayload: cacaoPayload,
      );
      log(message);
    }
    //
    return WCConnectionWidget(
      title: '${messagesModels.length} Messages',
      info: messagesModels,
    );
  }

  Widget _buildSessionProposalView(BuildContext context) {
    final views = ConnectionWidgetBuilder.buildFromRequiredNamespaces(
      proposalData!.generatedNamespaces!,
    );

    return Column(
      children: views,
    );
  }
}
