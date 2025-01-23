import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/model/model.dart';

class DbHelper {
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();
  factory DbHelper() {
    return instance;
  }
  late Isar isar;

  void onInit() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        AccountSchema,
        PasswordSchema,
        RecentAddressSchema,
        BrowserTabSchema,
        DappsHistorySchema,
        DappLinkSchema,
        SelectedChainSchema,
        NftSchema,
        TokenChainSchema,
        SelectedTokenChainSchema,
        ChainNetworkSchema,
        RecentTransactionAddressSchema,
      ],
      inspector: true,
      directory: dir.path,
    );
  }

  Future<void> setPassword(Password password) async {
    await isar.writeTxn(() async {
      await isar.passwords.put(password);
    });
  }

  Future<Password> getPassword() async {
    var password = Password();
    await isar.txn(() async {
      final pass = await isar.passwords.where().findAll();
      if (pass.isNotEmpty) {
        password = pass.first;
      }
    });
    return password;
  }

  Future<void> changePassword(int id, String newPassword) async {
    await isar.writeTxn(() async {
      final pass = await isar.passwords.get(id);
      pass!.password = newPassword;
      await isar.passwords.put(pass);
    });
  }

  Future<Account> addAccount(Account account) async {
    var dataResult = Account();
    await isar.writeTxn(() async {
      var id = await isar.accounts.put(account);
      var result = await isar.accounts.get(id);
      dataResult = result ?? Account();
    });
    return dataResult;
  }

  Future<void> addTokenChain(TokenChain chain) async {
    await isar.writeTxn(() async {
      await isar.tokenChains.put(chain);
    });
  }

  Future<void> deleteToken(TokenChain chain) async {
    var token = await isar.tokenChains
        .filter()
        .symbolEqualTo(chain.symbol)
        .contractAddressEqualTo(chain.contractAddress)
        .findFirst();
    await isar.writeTxn(() async {
      if (token != null) {
        await isar.tokenChains.delete(token.id!);
      }
    });
  }

  Future<void> setSelectedChain(SelectedChain chain) async {
    await isar.writeTxn(() async {
      await isar.selectedChains.clear();
      await isar.selectedChains.put(chain);
    });
  }

  Future<List<Account>?> getAllAccount() async {
    final List<Account> accountList = [];
    final listAccount =
        await isar.accounts.where(distinct: true, sort: Sort.asc).findAll();
    accountList.addAll(listAccount);
    return accountList;
  }

  Future<void> deleteAccount(int id) async {
    await isar.writeTxn(() async {
      await isar.accounts.delete(id);
    });
  }

  Future<void> changeBackupAccount(int id) async {
    await isar.writeTxn(() async {
      final add = await isar.accounts.get(id);
      log("account backup? ${add?.addressETH}");
      add!.backup = true;
      await isar.accounts.put(add);
    });
  }

  Future<Account> changeAccountName(int id, String name) async {
    Account account = Account();
    await isar.writeTxn(() async {
      final add = await isar.accounts.get(id);
      add!.name = name;
      await isar.accounts.put(add);
      account = add;
    });
    return account;
  }

  Future<void> changeWallet(int id) async {
    await isar.writeTxn(() async {
      final add = await isar.accounts.get(id);
      add!.selectedAccount = true;
      await isar.accounts.put(add);
    });
  }

  Future<void> unSelectWallet(int id) async {
    await isar.writeTxn(() async {
      final add = await isar.accounts.get(id);
      add!.selectedAccount = false;
      await isar.accounts.put(add);
    });
  }

  Future<Account?> getSelectedWallet() async {
    final address =
        await isar.accounts.filter().selectedAccountEqualTo(true).findFirst();
    return address;
  }

// ############           Network       ####################//

  Future<SelectedChain> getSelectedChain() async {
    List<SelectedChain> listChain = [];
    await isar.txn(() async {
      listChain = await isar.selectedChains.where().findAll();
    });
    if (listChain.isNotEmpty) {
      return listChain.first;
    } else {
      return SelectedChain();
    }
  }

  Future<void> setAllChainNetwork(List<ChainNetwork> networks) async {
    await isar.writeTxn(() async {
      await isar.chainNetworks.putAll(networks);
    });
  }

  Future<void> setChainNetwork(ChainNetwork network) async {
    await isar.writeTxn(() async {
      await isar.chainNetworks.put(network);
    });
  }

  Future<List<ChainNetwork>> getAllChainNetwork() async {
    List<ChainNetwork> networks = [];
    await isar.txn(() async {
      networks = await isar.chainNetworks.where().findAll();
    });
    return networks;
  }

  Future<void> setAllTokenChain(List<TokenChain> networks) async {
    await isar.writeTxn(() async {
      await isar.tokenChains.putAll(networks);
    });
  }

  Future<void> setTokenChain(TokenChain network) async {
    await isar.writeTxn(() async {
      await isar.tokenChains.put(network);
    });
  }

  Future<void> changeNetwork(List<SelectedTokenChain> chain) async {
    final selectedChain = await isar.selectedChains.where().findAll();
    Set<String> seen = {};
    List<String> newChainId = [];
    for (var item in chain) {
      if (!seen.contains(item.chainId)) {
        newChainId.add(item.chainId!);
        seen.add(item.chainId!);
      }
    }
    await isar.writeTxn(() async {
      selectedChain.first.chainId = newChainId;
      await isar.selectedChains.put(selectedChain.first);
    });
  }

  Future<List<SelectedTokenChain>> getTokenFromChainId(
      String chainId, String mnemonic) async {
    List<SelectedTokenChain> listChain = [];
    await isar.txn(() async {
      listChain = await isar.selectedTokenChains
          .where()
          .filter()
          .chainIdEqualTo(chainId)
          .mnemonicAccountEqualTo(mnemonic)
          .findAll();
    });
    return listChain;
  }

  Future<List<SelectedTokenChain>> getSelectedTokenChainFromChainId(
    String chainId,
  ) async {
    List<SelectedTokenChain> listChain = [];
    await isar.txn(() async {
      listChain = await isar.selectedTokenChains
          .where()
          .filter()
          .chainIdEqualTo(chainId)
          .findAll();
    });
    return listChain;
  }

  Future<List<TokenChain>> getTokenChainFromChainId(
    String chainId,
  ) async {
    List<TokenChain> listChain = [];
    await isar.txn(() async {
      listChain = await isar.tokenChains
          .where()
          .filter()
          .chainIdEqualTo(chainId)
          .findAll();
    });
    return listChain;
  }

  Future<void> updateRPC({required String chainId, required String rpc}) async {
    await isar.writeTxn(() async {
      final tokenchain =
          await isar.tokenChains.filter().chainIdEqualTo(chainId).findAll();
      final selectedChain = await isar.selectedTokenChains
          .filter()
          .chainIdEqualTo(chainId)
          .findAll();
      for (var value in tokenchain) {
        value.rpc = rpc;
        await isar.tokenChains.put(value);
      }
      if (selectedChain.isNotEmpty) {
        for (var element in selectedChain) {
          element.rpc = rpc;
          await isar.selectedTokenChains.put(element);
        }
      }
    });
  }

  Future<List<TokenChain>> getAllTokenChain() async {
    List<TokenChain> networks = [];
    await isar.txn(() async {
      networks = await isar.tokenChains.where().findAll();
    });
    return networks;
  }

  Future<void> addChainNetwork(TokenChain network) async {
    await isar.writeTxn(() async {
      await isar.tokenChains.put(network);
    });
  }

  Future<void> editChainNetwork(TokenChain network) async {
    await isar.writeTxn(() async {
      final item = await isar.tokenChains.get(network.id!);
      item!.chainId = network.chainId;
      item.name = network.name;
      item.rpc = network.rpc;
      item.symbol = network.symbol;
      item.explorer = network.explorer;
      await isar.tokenChains.put(item);
    });
  }

  Future<void> editSelectedChainNetwork(SelectedTokenChain network) async {
    await isar.writeTxn(() async {
      final item = await isar.selectedTokenChains.get(network.id!);
      item!.chainId = network.chainId;
      item.name = network.name;
      item.rpc = network.rpc;
      item.symbol = network.symbol;
      item.explorer = network.explorer;
      await isar.selectedTokenChains.put(item);
    });
  }

  Future<void> deleteTokenChain(String chainId) async {
    var chain = await isar.tokenChains
        .where()
        .filter()
        .chainIdEqualTo(chainId)
        .contractAddressEqualTo(null)
        .findFirst();
    if (chain?.id != null) {
      await isar.writeTxn(() async {
        await isar.tokenChains.delete(chain!.id!);
      });
    }
  }

  Future<void> deleteAllTokenChain() async {
    await isar.writeTxn(() async {
      await isar.tokenChains.clear();
    });
  }

  Future<void> deleteSelectedTokenChain(String chainId, String mnemonic) async {
    final chain = await isar.selectedTokenChains
        .filter()
        .chainIdEqualTo(chainId)
        .mnemonicAccountEqualTo(mnemonic)
        .findFirst();
    await isar.writeTxn(() async {
      await isar.selectedTokenChains.delete(chain?.id ?? 0);
    });
  }

  Future<void> deleteAllSelectedTokenChain() async {
    await isar.writeTxn(() async {
      await isar.selectedTokenChains.clear();
    });
  }

  Future<void> updateNetwork(int chainId, double balance) async {
    await isar.writeTxn(() async {
      final chain = await isar.selectedTokenChains.get(chainId);
      if (chain != null) {
        chain.balance = balance;
        await isar.selectedTokenChains.put(chain);
      }
    });
  }

  Future<List<Account>?> readAccountList() async {
    final List<Account> accountList = [];
    final allAccount =
        await isar.accounts.where(distinct: true, sort: Sort.asc).findAll();

    accountList.addAll(allAccount);

    return accountList;
  }

  Future<List<RecentAddress>> getRecentAddress() async {
    List<RecentAddress> list = [];
    await isar.txn(() async {
      list = await isar.recentAddress.where().findAll();
    });

    return list;
  }

  Future<void> setSelectedTokenChain(SelectedTokenChain chains) async {
    await isar.writeTxn(() async {
      await isar.selectedTokenChains.put(chains);
    });
  }

  Future<List<SelectedTokenChain>> getTokenChainWallet(
      {required String mnemonicAccount}) async {
    List<SelectedTokenChain> chains = [];
    await isar.txn(() async {
      chains = await isar.selectedTokenChains
          .filter()
          .mnemonicAccountEqualTo(mnemonicAccount)
          .findAll();
    });
    return chains;
  }

  Future<List<SelectedTokenChain>> getSelectedTokenChain(
      String mnemonic) async {
    final selectedChain = await isar.selectedChains.where().findFirst();
    List<SelectedTokenChain> listChain = [];
    for (var value in selectedChain?.chainId ?? []) {
      final chain = await isar.selectedTokenChains
          .filter()
          .chainIdEqualTo(value)
          .mnemonicAccountEqualTo(mnemonic)
          .findAll();
      listChain.addAll(chain);
    }
    return listChain;
  }

  //  Future<List<SelectedTokenChain>> getSelectedTokenChain() async {
  //   final selectedChain = await isar.selectedChains.where().findFirst();
  //   List<SelectedTokenChain> listChain = [];
  //   for (var value in selectedChain?.chainId ?? []) {
  //     final chain = await isar.selectedTokenChains
  //         .filter()
  //         .chainIdEqualTo(value)
  //         .findFirst();
  //     listChain.add(chain!);
  //   }
  //   return listChain;
  // }

  /// ######################### TOKEN #######################

  /// ######################### Chain #######################
  Future<List<SelectedTokenChain>> getSelectedChainWallet(
      {required String mnemonicAccount}) async {
    List<SelectedTokenChain> chains = [];
    await isar.txn(() async {
      chains = await isar.selectedTokenChains
          .filter()
          .mnemonicAccountEqualTo(mnemonicAccount)
          .findAll();
    });
    return chains;
  }

  Future<void> setSelectedChainWallet(SelectedTokenChain chains) async {
    await isar.writeTxn(() async {
      await isar.selectedTokenChains.put(chains);
    });
  }

  Future<void> deleteSelectedChainWallet(SelectedTokenChain chainToken) async {
    final chain = await isar.selectedTokenChains
        .filter()
        .chainIdEqualTo(chainToken.chainId)
        .symbolEqualTo(chainToken.symbol)
        .mnemonicAccountEqualTo(chainToken.mnemonicAccount)
        .findFirst();
    await isar.writeTxn(() async {
      await isar.selectedTokenChains.delete(chain?.id ?? 0);
    });
  }

  Future<SelectedTokenChain> getSelectedChainbyChainIdSymbolContractAddress(
      String chainId, String symbol, String contract) async {
    SelectedTokenChain token = SelectedTokenChain();
    await isar.writeTxn(() async {
      final chain = await isar.selectedTokenChains
          .filter()
          .chainIdEqualTo(chainId)
          .symbolEqualTo(symbol)
          .contractAddressEqualTo(contract)
          .findFirst();
      token = chain ?? SelectedTokenChain();
    });
    return token;
  }

  /// ######################### NFT #######################
  Future<List<Nft>> getAllNFT(
      {required String chainId, required String owner}) async {
    List<Nft> tokens = [];
    await isar.txn(() async {
      tokens = await isar.nfts
          .where()
          .filter()
          .chainIdEqualTo(chainId)
          .ownerEqualTo(owner)
          .findAll();
    });
    return tokens;
  }

  Future<void> addAllNFT(List<Nft> nft) async {
    await isar.writeTxn(() async {
      await isar.nfts.putAll(nft);
    });
  }

  Future<void> addNFT(Nft nft) async {
    await isar.writeTxn(() async {
      await isar.nfts.put(nft);
    });
  }

  Future<void> deleteNFT(int id) async {
    await isar.writeTxn(() async {
      await isar.nfts.delete(id);
    });
  }

  Future<void> deleteAllNft() async {
    await isar.writeTxn(() async {
      await isar.nfts.clear();
    });
  }

  // ########## Recemt Address Transaction ################# //

  Future<void> addRecentAddress(RecentTransactionAddress address) async {
    await isar.writeTxn(() async {
      await isar.recentTransactionAddress.put(address);
    });
  }

  Future<List<RecentTransactionAddress>?> getAllRecentTransaction() async {
    final List<RecentTransactionAddress> addressList = [];
    final allAddress = await isar.recentTransactionAddress
        .where(distinct: true, sort: Sort.asc)
        .findAll();
    addressList.addAll(allAddress);
    return addressList;
  }

  Future<void> deleteRecentAddress(int id) async {
    await isar.writeTxn(() async {
      await isar.recentTransactionAddress.delete(id);
    });
  }

  Future<void> deleteAllRecentAddress() async {
    await isar.writeTxn(() async {
      await isar.recentTransactionAddress.clear();
    });
  }

  /// ######################### DappLink #######################
  Future<List<DappLink>> getAllDappLink({
    required String chainId,
  }) async {
    List<DappLink> links = [];
    await isar.txn(() async {
      links = await isar.dappLinks
          .where()
          .filter()
          .chainIdEqualTo(chainId)
          .findAll();
    });
    return links;
  }

  Future<void> addAllDappLink(List<DappLink> dappLinks) async {
    await isar.writeTxn(() async {
      await isar.dappLinks.putAll(dappLinks);
    });
  }

  Future<void> addDappLink(DappLink dappLink) async {
    await isar.writeTxn(() async {
      await isar.dappLinks.put(dappLink);
    });
  }

  Future<void> deleteDappLink(int id) async {
    await isar.writeTxn(() async {
      await isar.dappLinks.delete(id);
    });
  }

  Future<void> deleteAllDappLink() async {
    await isar.writeTxn(() async {
      await isar.dappLinks.clear();
    });
  }

  // Dapps History

  Future<List<DappsHistory>> getDappsHistory() async {
    List<DappsHistory> list = [];
    await isar.txn(() async {
      list = await isar.dappsHistorys.where().findAll();
    });

    return list;
  }

  Future<void> addHistoryDapps(DappsHistory history) async {
    await isar.writeTxn(() async {
      List<DappsHistory> list = await isar.dappsHistorys.where().findAll();
      if (!list.any((e) => e.title == history.title)) {
        await isar.dappsHistorys.put(history);
      }
    });
  }

  Future<void> deleteDappsHistory(int id) async {
    await isar.writeTxn(() async {
      await isar.dappsHistorys.delete(id);
    });
  }

  ///// BROWSER TAB
  ///
  Future<List<BrowserTab>> getAllBrowserTab() async {
    var list = <BrowserTab>[];
    await isar.txn(() async {
      list = await isar.browserTabs.where().findAll();
    });

    return list;
  }

  Future<void> addBrowserTab(BrowserTab tab) async {
    await isar.writeTxn(() async {
      await isar.browserTabs.put(tab);
    });
  }

  Future<void> deleteBrowserTab(int id) async {
    await isar.writeTxn(() async {
      await isar.browserTabs.delete(id);
    });
  }

  onTabStateChanged(BrowserTab tab) async {
    await isar.writeTxn(() async {
      var tabs = await isar.browserTabs.get(tab.id!);
      tabs!.isSelected = tab.isSelected;
      tabs.name = tab.name;
      tabs.url = tab.url;
      tabs.image = tab.image;

      await isar.browserTabs.put(tabs);
    });
  }

  Future<void> changeBrowserTab(BrowserTab tab) async {
    await isar.writeTxn(() async {
      var tabs = await isar.browserTabs.where().findAll();
      for (var element in tabs) {
        element.isSelected = false;
      }
      await isar.browserTabs.putAll(tabs);
      final selectedTab = await isar.browserTabs.get(tab.id!);
      selectedTab!.isSelected = true;
      selectedTab.name = tab.name ?? "";
      selectedTab.url = tab.url ?? "";

      isar.browserTabs.put(selectedTab);
    });
  }

  Future<void> closeAllBrowserTab() async {
    await isar.writeTxn(() async {
      await isar.browserTabs.clear();
    });
  }

  Future<void> resetWallet() async {
    await isar.writeTxn(() async {
      await isar.passwords.clear();
      await isar.dappsHistorys.clear();
      await isar.selectedChains.clear();
      await isar.browserTabs.clear();
      await isar.nfts.clear();
    });
  }
}
