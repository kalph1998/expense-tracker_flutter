import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

  final List<Transaction> _userTransaction;
  final Function deleteTransaction;

  TransactionList(this._userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty
        ? Column(
            children: [
              Text(
                'No transaction added yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                            '₹ ${_userTransaction[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(_userTransaction[index].title.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_userTransaction[index].date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      deleteTransaction(_userTransaction[index].id);
                    },
                  ),
                ),
              );
              // return Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 15),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //               color: Theme.of(context).primaryColor,
              //               width: 2),
              //         ),
              //         padding: const EdgeInsets.all(10),
              //         child: Text(
              //           '₹ ${_userTransaction[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(_userTransaction[index].title.toUpperCase(),
              //               style: Theme.of(context).textTheme.headline6),
              //           Text(
              //             DateFormat.yMMMd()
              //                 .format(_userTransaction[index].date),
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
            itemCount: _userTransaction.length);
  }
}
