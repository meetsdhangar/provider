import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider1/models/todomodel.dart';

class favlistprovider with ChangeNotifier {
  List favlist = [];
  List todolist = [];

  bool isDataLoaded = false;

  Addfav(index) {
    favlist.add(index);
    notifyListeners();
  }

  Removefav(index) {
    favlist.remove(index);
    notifyListeners();
  }

  todoapi() async {
    try {
      var url = "https://dummyjson.com/todos";
      var responce = await http.get(Uri.parse(url));
      var decodedata = jsonDecode(responce.body);
      print(decodedata);
      var data = decodedata['todos'];

      print(data);
      var list = data.map((m) => Todo.fromMap(m)).toList();
      print(list);
      todolist.clear();
      todolist.addAll(list);
      print(todolist);
      isDataLoaded = true;
      notifyListeners();
      print(todolist);
    } catch (error) {
      error.toString();
    }
  }
}
