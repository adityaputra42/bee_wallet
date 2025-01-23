import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../presentation/widget/card_general.dart';
import 'wc_connection_model.dart';
import 'wc_connection_widget_info.dart';

class WCConnectionWidget extends StatelessWidget {
  const WCConnectionWidget({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final List<WCConnectionModel> info;

  @override
  Widget build(BuildContext context) {
    return CardGeneral(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context, title),
          height(4),
          ...info.map(
            (e) => WCConnectionWidgetInfo(
              model: e,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String text) {
    return CardGeneral(
      width: double.infinity,
      margin: EdgeInsets.zero,
      background: Theme.of(context).colorScheme.surface,
      child: Text(
        text,
        style:
            AppFont.medium16.copyWith(color: Theme.of(context).indicatorColor),
      ),
    );
  }
}
