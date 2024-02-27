import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/token_chain/selected_token_chain.dart';

part 'swap_provider.g.dart';

@riverpod
class ChainSwap extends _$ChainSwap {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChain(SelectedTokenChain chain) {
    state = chain;
  }
}
