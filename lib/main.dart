import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
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
          title: const Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueGrey,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((e) => Text(e.title)).toList(),
            )
          ],
        ));
  }
}
