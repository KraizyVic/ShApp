import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shapp/models/store.dart';

class HomeTiles extends StatelessWidget {
  final Store selectedStore;
  final String name;
  final VoidCallback toItems;
  final Function(BuildContext)? deleteItem;
  const HomeTiles({
    required this.selectedStore,
    required this.name,
    required this.toItems,
    this.deleteItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: toItems,
        child: Slidable(
          endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: deleteItem,
                  borderRadius: BorderRadius.circular(15),//only(topRight: Radius.circular(15),bottomRight:Radius.circular(13) ),
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                ),
              ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Text(name),
            ),
          ),
        ),
      ),
    );
  }
}
