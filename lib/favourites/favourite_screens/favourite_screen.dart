import 'package:flutter/material.dart';


class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  ///without providers
  List<int> selectedIcon= [];
  
  
  @override
  Widget build(BuildContext context) {
    print("builds");
    
    return Scaffold(
      appBar: AppBar(title: Text("Favourites"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:100 ,
                itemBuilder: (context,index)
            {
              return ListTile(
                onTap: (){

                  selectedIcon.add(index);
                  setState(() {
                    
                  });
                },
                title: Text("Item "+index.toString()),
                trailing: Icon(
                    selectedIcon.contains(index) ?Icons.favorite : Icons.favorite_border_outlined),
              );

            }),
          )
          
        ],
      ),
    );
  }
}
