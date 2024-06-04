// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$browserHistoryHash() => r'427f11a9eb12fe0f0a037b1ede04c4344bafa4df';

/// See also [BrowserHistory].
@ProviderFor(BrowserHistory)
final browserHistoryProvider = AutoDisposeAsyncNotifierProvider<BrowserHistory,
    List<DappsHistory>>.internal(
  BrowserHistory.new,
  name: r'browserHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$browserHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BrowserHistory = AutoDisposeAsyncNotifier<List<DappsHistory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
