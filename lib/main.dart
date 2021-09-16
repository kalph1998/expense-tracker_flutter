import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction('t1', 'new shoes', 200, DateTime.now()),
    Transaction('t2', 'milk', 25, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Expense tracker'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueGrey,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Card(
              child: Column(
                children: [TextField()],
              ),
            ),
            Column(
              children: transactions
                  .map((tx) => Card(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '₹ ${tx.amount}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(tx.date),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
