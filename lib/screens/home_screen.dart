// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:khatabook/models/customer_list.dart';
import 'package:khatabook/screens/customer_details.dart';
import 'package:khatabook/screens/customer_record.dart';
import 'package:khatabook/storage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Business'),
      ),
      body: ListView.builder(
        itemCount: storage.storageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Info(
            customersList: storage.storageList[index],
            index: index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomerRecord()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Info extends StatefulWidget {
  final CustomersList customersList;
  final int index;
  const Info({required this.customersList, required this.index});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context, listen: true);
    return Card(
      child: ListTile(
        title: Text(
            '${widget.customersList.name}                                       Rs. ${widget.customersList.amtGiven - widget.customersList.amtGot}'),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            storage.deleteCustomer(widget.index);
          },
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomerDetails(widget.index)));
        },
      ),
    );
  }
}
