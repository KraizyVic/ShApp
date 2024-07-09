import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final int price;
  final Function(BuildContext)?deleteItem;
  //final Function(BuildContext)?editItem;

  ItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.deleteItem,
    //required this.editItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
          ]
        ),
        startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context){},
                borderRadius: BorderRadius.circular(15),
                icon: Icons.edit,
                backgroundColor: Colors.blue,
              )
            ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Row(
              children:[
                Text("$name"),
                Spacer(),
                Text("kSh: ${price.toString()}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
