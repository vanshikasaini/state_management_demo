import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_providers.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
     final favouriteProviders =Provider.of<FavouritesProvider>(context,listen: true);
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
                itemCount: favouriteProviders.selectedItem.length,
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
