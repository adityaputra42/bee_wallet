import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

import 'i_bottom_sheet_service.dart';

class BottomSheetService extends IBottomSheetService {
  Queue<BottomSheetQueueItem> queue = Queue<BottomSheetQueueItem>();

  @override
  final ValueNotifier<BottomSheetQueueItem?> currentSheet = ValueNotifier(null);

  @override
  Future<dynamic> queueBottomSheet({
    required Widget widget,
    int closeAfter = 0,
  }) async {
    final completer = Completer<dynamic>();
    final queueItem = BottomSheetQueueItem(
      widget: widget,
      completer: completer,
      closeAfter: closeAfter,
    );

    if (currentSheet.value == null) {
      currentSheet.value = queueItem;
    } else {
      queue.add(queueItem);
    }

    return await completer.future;
  }

  @override
  void showNext() {
    if (queue.isEmpty) {
      currentSheet.value = null;
    } else {
      currentSheet.value = queue.removeFirst();
    }
  }
}
