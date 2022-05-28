// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:khatabook/models/customer_list.dart';

class Storage with ChangeNotifier {
  List<CustomersList> _storageList = [];
  int get count => _storageList.length;
  List<CustomersList> get storageList => _storageList;

  void addCustomer(CustomersList c) {
    _storageList.add(c);
    notifyListeners();
  }

  void deleteCustomer(int index) {
    _storageList.removeAt(index);
    notifyListeners();
  }

  void updateCustomer(int index, int a, int b) {
    _storageList[index].amtGiven += a;
    _storageList[index].amtGot += b;
    notifyListeners();
  }
}
