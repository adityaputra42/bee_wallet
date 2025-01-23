import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'i_bottom_sheet_service.dart';

class BottomSheetListener extends StatefulWidget {
  final Widget child;

  const BottomSheetListener({
    super.key,
    required this.child,
  });

  @override
  BottomSheetListenerState createState() => BottomSheetListenerState();
}

class BottomSheetListenerState extends State<BottomSheetListener> {
  late final IBottomSheetService _bottomSheetService;

  @override
  void initState() {
    super.initState();
    _bottomSheetService = GetIt.I<IBottomSheetService>();
    log("init bottomSheet listerner");
    _bottomSheetService.currentSheet.addListener(_showBottomSheet);
    log("success init bottomSheet listerner");
  }

  @override
  void dispose() {
    _bottomSheetService.currentSheet.removeListener(_showBottomSheet);
    log("dispose bottomSheet listerner");
    super.dispose();
  }

  Future<void> _showBottomSheet() async {
    log("bottomSheet CurrentSheet => ${_bottomSheetService.currentSheet.value}");
    if (_bottomSheetService.currentSheet.value != null) {
      BottomSheetQueueItem item = _bottomSheetService.currentSheet.value!;
      final value = await showModalBottomSheet(
          context: context,
          builder: (context) {
            if (item.closeAfter > 0) {
              Future.delayed(Duration(seconds: item.closeAfter), () {
                if (mounted && Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                }
              });
            }
            return Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: item.widget,
            );
          },
          backgroundColor: Theme.of(context).cardColor,
          isScrollControlled: true,
          isDismissible: false,
          showDragHandle: true,
          useSafeArea: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))));

      if (!item.completer.isCompleted) {
        item.completer.complete(value);
      }
      _bottomSheetService.showNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
