import 'package:isar/isar.dart';
part 'recent_transaction_address.g.dart';

@Collection()
class RecentTransactionAddress {
  Id? id = Isar.autoIncrement;
  String? address;
  RecentTransactionAddress({this.id, this.address});
}
