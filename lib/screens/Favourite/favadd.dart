import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/favlistprovider.dart';

class FavaddScreen extends StatelessWidget {
  const FavaddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var favlist = context.watch<favlistprovider>().favlist;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favourite"),
      ),
      body: ListView.builder(
        itemCount: favlist.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('index ${favlist[index]}'),
              trailing: IconButton(
                  onPressed: () {
                    // if (favlist.contains(index)) {
                    //   context.read<favlistprovider>().Removefav(index);
                    // } else {
                    //   context.read<favlistprovider>().Addfav(index);
                    // }
                  },
                  icon: Icon(Icons.favorite)));
        },
      ),
    );
  }
}
