import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../presentation/widget/card_general.dart';

import 'wc_connection_model.dart';

class WCConnectionWidgetInfo extends StatelessWidget {
  const WCConnectionWidgetInfo({
    super.key,
    required this.model,
  });

  final WCConnectionModel model;

  @override
  Widget build(BuildContext context) {
    return CardGeneral(
      width: double.infinity,
      background: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(top: 8),
      child: model.elements != null ? _buildList(context) : _buildText(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (model.title != null)
          Text(model.title!,
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor)),
        if (model.title != null) height(4),
        Wrap(
          spacing: 4,
          runSpacing: 0,
          direction: Axis.horizontal,
          children:
              model.elements!.map((e) => _buildElement(context, e)).toList(),
        ),
      ],
    );
  }

  Widget _buildElement(BuildContext context, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 0,
          side: BorderSide(width: 1, color: Theme.of(context).canvasColor),
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed:
          model.elementActions != null ? model.elementActions![text] : null,
      child: Text(
        text,
        style: AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      model.text!,
      style: AppFont.medium14.copyWith(color: Theme.of(context).indicatorColor),
    );
  }
}
