import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/favlistprovider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final myprovider = Provider.of<favlistprovider>(context, listen: false);
    myprovider.todoapi();
    //context.read<favlistprovider>().todoapi();
    final list = myprovider.favlist;
    //final list = context.watch<favlistprovider>().todolist;
    print(list);
    // var list = [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Todo List"),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(''),
              // title: Text(list[index].todo),
              // trailing: Text(list[index].completed),
            );
          },
        ),
      ),
    );
  }
}

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.greeting)),
      body: Consumer<favlistprovider>(
        builder: (context, todoProvider, child) {
          if (!todoProvider.isDataLoaded) {
            todoProvider.todoapi();
          }
          var data = todoProvider.todolist;
          return ListView.builder(
              itemCount: todoProvider.todolist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${data[index].todo}'),
                );
              });
        },
      ),
    );
  }
}
