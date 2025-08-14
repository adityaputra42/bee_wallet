import 'package:flutter/material.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import 'wc_connection_model.dart';
import 'wc_connection_widget.dart';

class ConnectionWidgetBuilder {
  static List<WCConnectionWidget> buildFromRequiredNamespaces(
    Map<String, Namespace> generatedNamespaces,
  ) {
    final List<WCConnectionWidget> views = [];
    for (final key in generatedNamespaces.keys) {
      final namespaces = generatedNamespaces[key]!;
      final chains = NamespaceUtils.getChainsFromAccounts(namespaces.accounts);
      final List<WCConnectionModel> models = [];
      // If the chains property is present, add the chain data to the models
      models.add(
        WCConnectionModel(
          title: "chain",
          elements: chains,
        ),
      );
      models.add(
        WCConnectionModel(
          title: "method",
          elements: namespaces.methods,
        ),
      );
      if (namespaces.events.isNotEmpty) {
        models.add(
          WCConnectionModel(
            title: "event",
            elements: namespaces.events,
          ),
        );
      }

      views.add(
        WCConnectionWidget(
          title: key,
          info: models,
        ),
      );
    }

    return views;
  }

  static List<WCConnectionWidget> buildFromNamespaces(
    String topic,
    Map<String, Namespace> namespaces,
    BuildContext context,
  ) {
    final List<WCConnectionWidget> views = [];
    for (final key in namespaces.keys) {
      final ns = namespaces[key]!;
      final List<WCConnectionModel> models = [];
      // If the chains property is present, add the chain data to the models
      models.add(
        WCConnectionModel(
          title: "account",
          elements: ns.accounts,
        ),
      );
      models.add(
        WCConnectionModel(
          title: "method",
          elements: ns.methods,
        ),
      );

      if (ns.events.isNotEmpty) {
        models.add(
          WCConnectionModel(
            title: "event",
            elements: ns.events,
          ),
        );
      }

      views.add(
        WCConnectionWidget(
          title: key,
          info: models,
        ),
      );
    }

    return views;
  }
}
