import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({Key? key}) : super(key: key);
  final List<Transaction> _userTransaction = [
    Transaction('t1', 'new shoes', 200, DateTime.now()),
    Transaction('t2', 'milk', 25, DateTime.now()),
  ];

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
