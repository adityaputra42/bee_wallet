// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

import '../../config/config.dart';
import '../../data/model/model.dart';
import '../util.dart';

class EthHelper {
  Map<String, String> getEthInfo(String mnemonic) {
    var seed = bip39.mnemonicToSeedHex(mnemonic);
    Chain chain = Chain.seed(seed);
    ExtendedKey key = chain.forPath("m/44'/60'/0'/0/0");
    var privateKey = key.privateKeyHex();
    Credentials account = EthPrivateKey.fromHex(privateKey);
    var encodedPrivateKey = privateKey.replaceRange(0, 2, "0x");
    return {
      'mnemonic': mnemonic,
      'private_key': encodedPrivateKey,
      'address': account.address.toString()
    };
  }

  bool validatePrivateKey(String privateKey) {
    var credential = EthPrivateKey.fromHex(privateKey);
    EthereumAddress address = credential.address;
    if (isValidEthereumAddress(address.hex)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateAddress(String address) {
    if (isValidEthereumAddress(address)) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> transferChain(
      {required String to,
      required double amount,
      double? gasPrice,
      required SelectedTokenChain chain,
      required String privateKey}) async {
    final Credentials credentials = EthPrivateKey.fromHex(privateKey);
    final toAddress = EthereumAddress.fromHex(to);

    try {
      BigInt gweiBigInt = MethodHelper().convertToGwei(amount);
      final transaction = Transaction(
          from: credentials.address,
          to: toAddress,
          gasPrice: gasPrice == null
              ? null
              : EtherAmount.fromBase10String(
                  EtherUnit.ether, gasPrice.toString()),
          value: EtherAmount.fromBigInt(EtherUnit.gwei, gweiBigInt));
      final web3client = Web3Client(
        chain.rpc ?? '',
        http.Client(),
      );
      final response = await web3client.sendTransaction(
        credentials,
        transaction,
        chainId: int.parse(chain.chainId ?? "1"),
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getEstimateGasTokenTransfer({
    required String to,
    required double amount,
    required SelectedTokenChain chainToken,
    required String privateKey,
  }) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final web3client = Web3Client(
      chainToken.rpc ?? '',
      http.Client(),
    );
    final erc20AbiString =
        await rootBundle.loadString('assets/abi/ERC-20.json');
    ContractAbi erc20Abi = ContractAbi.fromJson(erc20AbiString, 'ERC20');
    final contract = DeployedContract(
        erc20Abi, EthereumAddress.fromHex(chainToken.contractAddress ?? ''));
    final fromAddress = credentials.address;
    final gasprice = await web3client.getGasPrice();
    final transferFunction = contract.function('transfer');
    final transferParams = [EthereumAddress.fromHex(to), BigInt.from(0)];
    final transferData = transferFunction.encodeCall(transferParams);

    final gaslimit = await web3client.estimateGas(
      data: transferData,
      gasPrice: gasprice,
      to: EthereumAddress.fromHex(to),
      sender: fromAddress,
      value: EtherAmount.zero(),
    );

    var gasLimit = gaslimit.toDouble();
    var gasPrice = (gasprice.getInWei / BigInt.from(pow(10, 9)));

    final txFee = gasprice.getInWei * gaslimit;
    final fee = txFee / BigInt.from(10).pow(18);
    return {"txFee": fee, "gasLimit": gasLimit, "gasPrice": gasPrice};
  }

  Future<String?> transferToken(
      {required String privateKey,
      required String to,
      required double amount,
      required SelectedTokenChain token}) async {
    final erc20AbiString =
        await rootBundle.loadString('assets/abi/ERC-20.json');
    ContractAbi erc20Abi = ContractAbi.fromJson(erc20AbiString, 'ERC20');
    final web3client = Web3Client(
      token.rpc ?? '',
      http.Client(),
    );
    final contract = DeployedContract(
        erc20Abi, EthereumAddress.fromHex(token.contractAddress ?? ""));
    var credentials = EthPrivateKey.fromHex(privateKey);
    dev.log(credentials.address.toString());

    final value = BigInt.from(amount * pow(10, token.decimal!));

    try {
      final transaction = Transaction.callContract(
        contract: contract,
        from: credentials.address,
        function: contract.function('transfer'),
        parameters: <dynamic>[
          EthereumAddress.fromHex(to),
          value,
        ],
      );

      final response = await web3client.sendTransaction(
          credentials, transaction,
          chainId: int.parse(token.chainId!));

      return response;
    } catch (e) {
      dev.log("Error Transfer Token=> $e");

      return null;
    }
  }

  Future<Map<String, dynamic>> getEstimateGasFee({
    required String to,
    required double amount,
    required String privateKey,
    required SelectedTokenChain chain,
  }) async {
    dev.log("web3 => $privateKey");

    final Credentials credentials = EthPrivateKey.fromHex(privateKey);
    BigInt gweiBigInt = (BigInt.from(amount * 1000000000) ~/ BigInt.one);
    final web3client = Web3Client(
      chain.rpc ?? '',
      http.Client(),
    );

    try {
      EtherAmount gasprice = await web3client.getGasPrice();

      final gaslimit = await web3client.estimateGas(
        to: EthereumAddress.fromHex(to),
        sender: credentials.address,
        value: EtherAmount.fromBigInt(EtherUnit.gwei, gweiBigInt),
        gasPrice: gasprice,
      );

      dev.log("gas Price => $gasprice");
      dev.log("gas Limit => $gaslimit");
      var gasLimit = gaslimit.toDouble();
      var gasPrice = (gasprice.getInWei / BigInt.from(pow(10, 9)));
      dev.log("gas Price 2=> $gasPrice");
      dev.log("gas Limit 2=> $gasLimit");

      final txFee = gasprice.getInWei * gaslimit;
      dev.log("tx Fee => $txFee");
      var fee = txFee / BigInt.from(10).pow(18);
      return {"txFee": fee, "gasLimit": gasLimit, "gasPrice": gasPrice};
    } catch (e) {
      dev.log("Error estimate gas fee => $e");
      return {"txFee": 0.0, "gasLimit": 0.0, "gasPrice": 0.0};
    }
  }

  Future<Nft?> fetchNFT(
      {required BuildContext context,
      required String contractAddress,
      required int tokenId,
      required TokenChain chain,
      required String address}) async {
    try {
      // if (!evm.listNFT.any((element) => element.tokenId == tokenId)) {
      final nftAbiString =
          await rootBundle.loadString('assets/abi/ERC-721.json');
      ContractAbi erc721Abi = ContractAbi.fromJson(nftAbiString, 'ERC721');
      final web3client = Web3Client(
        chain.rpc ?? '',
        http.Client(),
      );
      final contract = DeployedContract(
        erc721Abi,
        EthereumAddress.fromHex(contractAddress),
      );
      final tokenURIFunction = contract.function('tokenURI');
      final tokenOwnerFunction = contract.function('ownerOf');
      final tokenSymbolFunction = contract.function('symbol');

      final tokenURI = await web3client.call(
          contract: contract,
          function: tokenURIFunction,
          params: [BigInt.from(tokenId)]);
      final tokenOwner = await web3client.call(
          contract: contract,
          function: tokenOwnerFunction,
          params: [BigInt.from(tokenId)]);
      final tokenSymbol = await web3client
          .call(contract: contract, function: tokenSymbolFunction, params: []);
      dev.log("token Uri => $tokenURI");
      dev.log("token Owner => $tokenOwner");
      dev.log("token Symbol => $tokenSymbol");

      String owner = (tokenOwner.first).toString();
      dev.log("token Symbol => $tokenSymbol");
      if (address == owner) {
        List<Nft> nfts = [];
        for (var uri in tokenURI) {
          if (uri.startsWith('ipfs://')) {
            final ipfsHash = uri.replaceFirst('ipfs://', '');
            dev.log("hash ipfs nft => $ipfsHash");
            final ipfsUrl = 'https://ipfs.io/ipfs/$ipfsHash';
            final response = await http.Client().get(Uri.parse(ipfsUrl));
            dev.log("reposponse nft => ${response.body}");
            dev.log("reposponse nft => ${response.statusCode}");
            if (response.statusCode == 200) {
              final metadata = jsonDecode(response.body);
              final imageURL = metadata['image'];
              if (imageURL.startsWith('ipfs://')) {
                final ipfsHash = imageURL.replaceFirst('ipfs://', '');
                final ipfsImageURL =
                    'https://ipfs.io/ipfs/$ipfsHash'; // Use a public IPFS gateway
                final imageResponse =
                    await http.Client().get(Uri.parse(ipfsImageURL));
                if (imageResponse.statusCode == 200) {
                  final imageBytes = imageResponse.bodyBytes;
                  String imageBase64 =
                      MethodHelper().convertUint8ListToString(imageBytes);
                  dev.log("response image byte => $imageBase64");
                  Nft nft = Nft(
                      contractAddress: contractAddress,
                      tokenId: tokenId,
                      name: metadata['name'],
                      owner: owner,
                      chainId: chain.chainId,
                      imageByte: imageBase64,
                      description: metadata['description']);
                  nfts.add(nft);
                }
              } else {
                final imageResponse =
                    await http.Client().get(Uri.parse(imageURL));
                if (imageResponse.statusCode == 200) {
                  final imageBytes = imageResponse.bodyBytes;
                  String imageBase64 =
                      MethodHelper().convertUint8ListToString(imageBytes);
                  dev.log("response image byte => $imageBase64");
                  Nft nft = Nft(
                      contractAddress: contractAddress,
                      tokenId: tokenId,
                      owner: owner,
                      chainId: chain.chainId,
                      name: metadata['name'],
                      imageByte: imageBase64,
                      description: metadata['description']);
                  nfts.add(nft);
                }
              }
            }
          } else {
            final response = await http.Client().get(Uri.parse(uri));
            if (response.statusCode == 200) {
              final metadata = jsonDecode(response.body);
              dev.log("token metadata => $metadata");
              final imageURL = metadata['image'];
              dev.log("Image  => $imageURL");
              if (imageURL.startsWith('ipfs://')) {
                final ipfsHash = imageURL.replaceFirst('ipfs://', '');
                final ipfsImageURL =
                    'https://ipfs.io/ipfs/$ipfsHash'; // Use a public IPFS gateway
                final imageResponse =
                    await http.Client().get(Uri.parse(ipfsImageURL));

                if (imageResponse.statusCode == 200) {
                  final imageBytes = imageResponse.bodyBytes;

                  String imageBase64 =
                      MethodHelper().convertUint8ListToString(imageBytes);
                  dev.log("response image byte => $imageBase64");
                  Nft nft = Nft(
                      contractAddress: contractAddress,
                      tokenId: tokenId,
                      owner: owner,
                      chainId: chain.chainId,
                      name: metadata['name'],
                      imageByte: imageBase64,
                      description: metadata['description']);
                  nfts.add(nft);
                }
              } else {
                final imageResponse =
                    await http.Client().get(Uri.parse(imageURL));
                if (imageResponse.statusCode == 200) {
                  final imageBytes = imageResponse.bodyBytes;
                  dev.log(imageBytes.toString());
                  String imageBase64 =
                      MethodHelper().convertUint8ListToString(imageBytes);
                  dev.log("response image byte => $imageBase64");
                  Nft nft = Nft(
                      contractAddress: contractAddress,
                      tokenId: tokenId,
                      owner: owner,
                      chainId: chain.chainId,
                      name: metadata['name'],
                      imageByte: imageBase64,
                      description: metadata['description']);
                  nfts.add(nft);
                }
              }
            }
          }
        }
        dev.log("nft length => ${nfts.length}");
        return nfts.first;
      } else {
        MethodHelper().showSnack(
            context: context,
            content: "Invalid Owner NFT",
            backgorund: AppColor.redColor);
        return null;
      }
    } catch (e) {
      MethodHelper().showSnack(
          context: context,
          content: "Invalid Chain NFT",
          backgorund: AppColor.redColor);
      return null;
    }
  }

  Future<Map<String, dynamic>> getEstimateGasNFTTransfer(
      {required String to,
      required Nft nft,
      required SelectedTokenChain chain,
      required String privateKey}) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final nftAbiString = await rootBundle.loadString('assets/abi/ERC-721.json');
    ContractAbi erc721Abi = ContractAbi.fromJson(nftAbiString, 'ERC721');
    final web3client = Web3Client(
      chain.rpc ?? '',
      http.Client(),
    );
    final contract = DeployedContract(
        erc721Abi, EthereumAddress.fromHex(nft.contractAddress!));
    final fromAddress = credentials.address;
    final gasprice = await web3client.getGasPrice();
    final transferFunction = contract.function('transferFrom');
    final transferParams = [
      EthereumAddress.fromHex(nft.owner!),
      EthereumAddress.fromHex(to),
      BigInt.from(nft.tokenId!)
    ];
    final transferData = transferFunction.encodeCall(transferParams);

    final gaslimit = await web3client.estimateGas(
      data: transferData,
      gasPrice: gasprice,
      to: EthereumAddress.fromHex(to),
      sender: fromAddress,
      value: EtherAmount.zero(),
    );
    double gasLimit = gaslimit.toDouble();
    double gasPrice = (gasprice.getInWei / BigInt.from(pow(10, 9)));
    dev.log("gas Price NFT => $gasPrice");
    final txFee = gasprice.getInWei * gaslimit;
    final fee = txFee / BigInt.from(10).pow(18);
    dev.log('Gas fee estimate: $fee wei');
    return {"txFee": fee, "gasLimit": gasLimit, "gasPrice": gasPrice};
  }

  Future<String?> transferNft(
      {required String to,
      required Nft nft,
      required SelectedTokenChain chain,
      required String privateKey}) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final nftAbiString = await rootBundle.loadString('assets/abi/ERC-721.json');
    ContractAbi erc721Abi = ContractAbi.fromJson(nftAbiString, 'ERC721');
    final web3client = Web3Client(
      chain.rpc ?? '',
      http.Client(),
    );
    final contract = DeployedContract(
        erc721Abi, EthereumAddress.fromHex(nft.contractAddress!));

    try {
      Transaction transaction = Transaction.callContract(
        contract: contract,
        from: credentials.address,
        function: contract.function('transferFrom'),
        parameters: [
          EthereumAddress.fromHex(nft.owner!),
          EthereumAddress.fromHex(to),
          BigInt.from(nft.tokenId!)
        ],
      );

      final response = await web3client.sendTransaction(
          credentials, transaction,
          chainId: int.parse(chain.chainId!));
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<bool> chekRPC(String rpc) async {
    try {
      final web3client = Web3Client(
        rpc,
        http.Client(),
      );
      int block = await web3client.getBlockNumber();
      dev.log("block number $block");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TokenChain>?> getTokenFromContract(TokenChain chain) async {
    if (chain.tokenRegister != '' && chain.tokenRegister != null) {
      final tokenRegistryAbiString =
          await rootBundle.loadString('assets/abi/token_registry.json');
      var tokenRegistryAbi =
          ContractAbi.fromJson(tokenRegistryAbiString, "TokenRegistry");
      final web3client = Web3Client(
        chain.rpc ?? '',
        http.Client(),
      );
      final contract = DeployedContract(
          tokenRegistryAbi, EthereumAddress.fromHex(chain.tokenRegister!));
      final query = contract.function('getTokenList');

      final List<dynamic> result = await web3client.call(
        contract: contract,
        function: query,
        params: [],
      );

      var token = <TokenChain>[];
      dev.log("result => $result");
      for (var element in result) {
        if (element is List) {
          for (var item in element) {
            dev.log("token from contract => $item");
            final data = TokenChain(
                chainId: chain.chainId,
                balance: 0,
                tokenRegister: null,
                contractAddress: item[0].toString(),
                name: item[1],
                symbol: item[2],
                decimal: item[3].toInt(),
                logo: item[4],
                baseLogo: chain.baseLogo,
                explorer: chain.explorer,
                explorerApi: chain.explorerApi,
                baseChain: chain.baseChain,
                rpc: chain.rpc,
                isTestnet: null);
            token.add(data);
          }
        }
      }

      return token;
    }
    return null;
  }
}
