import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/favlistprovider.dart';
import 'package:provider1/screens/Favourite/favadd.dart';

class FavlistScreen extends StatelessWidget {
  const FavlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mylist = context.watch<favlistprovider>().favlist;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Favourite List"),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("index $index"),
              trailing: IconButton(
                  onPressed: () {
                    if (mylist.contains(index)) {
                      context.read<favlistprovider>().Removefav(index);
                    } else {
                      context.read<favlistprovider>().Addfav(index);
                    }
                  },
                  icon: Icon(mylist.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_outline)),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FavaddScreen(),
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
