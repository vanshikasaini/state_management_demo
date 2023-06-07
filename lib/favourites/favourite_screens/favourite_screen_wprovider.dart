import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/favourites/favourite_screens/myfavourite_screen.dart';
import 'package:state_management_demo/providers/favourite_providers.dart';

class FavouritesScren_Pro extends StatefulWidget {
  const FavouritesScren_Pro({Key? key}) : super(key: key);

  @override
  State<FavouritesScren_Pro> createState() => _FavouritesScren_ProState();
}

class _FavouritesScren_ProState extends State<FavouritesScren_Pro> {
  @override
  Widget build(BuildContext context) {
    // final favouriteProviders =Provider.of<FavouritesProvider>(context,listen: true);
    print("builds with providers");

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        actions: [
          InkWell(
            child: Icon(Icons.favorite),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
            },
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouritesProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeSelectedItems(index);
                        } else
                          value.setSelectedItems(index);
                        // favouriteProviders.setSelectedItems(index);
                      },
                      title: Text("Item " + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                      // favouriteProviders.selectedItem.contains(index)
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
