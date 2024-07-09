import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/stores.dart';
import 'package:shapp/pages/items_page.dart';
import 'package:shapp/utils/home_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Stores>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Home page"),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: value.stores.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return HomeTiles(
                    selectedStore: value.stores[index],
                    name: value.stores[index].storeName,
                    toItems: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemsPage(store: value.stores[index]),
                      ),
                    ),
                    deleteItem: (context) => value.removeStore(index),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () => value.addStore(context),
          child: const Icon(Icons.add, color: Colors.blue),
        ),
      ),
    );
  }
}
