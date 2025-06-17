import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageCustom extends ConsumerWidget {
  const PageCustom({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // Image.asset(
          //   AppImages.maskBg,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
