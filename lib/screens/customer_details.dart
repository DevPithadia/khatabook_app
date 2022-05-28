// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:khatabook/storage.dart';
import 'package:provider/provider.dart';

class CustomerDetails extends StatelessWidget {
  int index;
  CustomerDetails(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    Storage storage = Provider.of<Storage>(context, listen: false);
    int balAmt =
        storage.storageList[index].amtGiven - storage.storageList[index].amtGot;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Customer name : ' + storage.storageList[index].name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Balance amount : Rs.' + (balAmt).toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: t1,
              decoration: InputDecoration(hintText: 'Enter amount oyu gave'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: t2,
              decoration: InputDecoration(hintText: 'Enter amount you got'),
            ),
            ElevatedButton(
              onPressed: () {
                int a = int.parse(t1.text);
                int b = int.parse(t2.text);
                Provider.of<Storage>(context, listen: false)
                    .updateCustomer(index, a, b);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
