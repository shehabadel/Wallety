import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:flutter/foundation.dart';

import 'package:wallety/Logic/Transaction.dart';

class SembastDB {
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database _db;
  final store = intMapStoreFactory.store('transactions');
  static SembastDB _singleton = SembastDB._internal();
  SembastDB._internal();

  factory SembastDB() {
    return _singleton;
  }

  Future<Database> init() async {
    if (_db == null) {
      _db = await _openDB();
    }
    return _db;
  }

  Future _openDB() async {
    final docDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docDir.path, 'pass.db');
    final db = await dbFactory.openDatabase(dbPath);

    return db;
  }

  Future<int> addTransaction(TransactionW transaction) async {
    int id = await store.add(_db, transaction.toMap());
    return id;
  }

  Future getTransactions() async {
    await init();

    final finder = Finder(sortOrders: [SortOrder('date')]);
    final snapshot = await store.find(_db, finder: finder);
    return snapshot.map((item) {
      final transaction = TransactionW.fromMap(item.value);
      transaction.transID = item.key;
      return transaction;
    }).toList();
  }

  Future deleteTransaction(TransactionW transaction) async {
    final finder = Finder(filter: Filter.byKey(transaction.transID));
    await store.delete(_db, finder: finder);
  }

  Future updateTransaction(TransactionW transaction) async {
    final finder = Finder(filter: Filter.byKey(transaction.transID));
    await store.update(_db, transaction.toMap(), finder: finder);
  }

  Future deleteAll() async {
    await store.delete(_db);
  }

  //Provider functions

 /*
  Future<int> createTransaction(TransactionW transaction) async {

    int id = await store.add(_db, transaction.toMap());
    _transactionsList = await getTransactionsList();
    return id;
  }

  Future<List<TransactionW>> getTransactionsList() async {
    await init();

    final finder = Finder(sortOrders: [SortOrder('date')]);
    final snapshot = await store.find(_db, finder: finder);
    List<TransactionW> transactions = snapshot.map((item) {
      final transaction = TransactionW.fromMap(item.value);
      transaction.transID = item.key;
      return transaction;
    }).toList();
    _transactionsList = transactions;

    notifyListeners();

    return transactions;
  }

  List<TransactionW> get transactionsListGetter {
    return _transactionsList;
  }
  int get transactionsCount {
    return _transactionsList.length;
  }

  */
}
