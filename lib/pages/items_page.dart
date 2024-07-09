import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/store.dart';
import 'package:shapp/models/stores.dart';
import 'package:shapp/utils/item_tile.dart';

class ItemsPage extends StatefulWidget {
  final Store store;
  const ItemsPage({super.key, required this.store});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late int total;

  @override
  void initState() {
    super.initState();
    total = Provider.of<Stores>(context, listen: false).totalss(widget.store);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Stores>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(

          title: Text(
            widget.store.storeName,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.store.price.length,
                    itemBuilder: (context, index) {
                      return ItemTile(
                        name: widget.store.product[index],
                        price: widget.store.price[index],
                        deleteItem: (context) {
                          value.removeProductFromStore(widget.store, index);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Text("Total: ${value.totalss(widget.store).toString()}"),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.addItem(context, widget.store);
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
