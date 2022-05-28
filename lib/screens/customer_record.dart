// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:khatabook/models/customer_list.dart';
import 'package:khatabook/storage.dart';
import 'package:provider/provider.dart';

class CustomerRecord extends StatefulWidget {
  const CustomerRecord({Key? key}) : super(key: key);

  @override
  _CustomerRecordState createState() => _CustomerRecordState();
}

class _CustomerRecordState extends State<CustomerRecord> {
  TextEditingController custName = TextEditingController();
  TextEditingController youGave = TextEditingController();
  TextEditingController youGot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: custName,
                  decoration: InputDecoration(hintText: "Enter customer name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: youGave,
                  decoration: InputDecoration(hintText: "Amount you gave"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: youGot,
                  decoration: InputDecoration(hintText: "Amount you got"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Done'),
                  onPressed: () {
                    CustomersList obj = CustomersList(custName.text,
                        int.parse(youGot.text), int.parse(youGave.text));
                    Provider.of<Storage>(context, listen: false)
                        .addCustomer(obj);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
