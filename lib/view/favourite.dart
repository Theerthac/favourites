import 'package:favourite/controller/favourite_provider.dart';
import 'package:favourite/view/my_favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
 
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites    ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyFavourites(),
                ));
              },
              child: const Icon(Icons.favorite),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectedItems.contains(index)) {
                        value.removeItems(index);
                      } else {
                        value.addItems(index);
                      }
                    },
                    title: Text('item $index'),
                    trailing: Icon(value.selectedItems.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  );
                });
              },
            ),
          ),
        ],
      )),
    );
  }
}
