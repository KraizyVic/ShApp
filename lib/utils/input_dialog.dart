import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget {
  final productController;
  final priceController;
  final VoidCallback saveItem;

  const InputDialog({
    super.key,
    required this.productController,
    required this.priceController,
    required this.saveItem,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Input"),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Container(
        height: 150,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text("Item to add"),
            TextField(
              controller: productController,
              decoration: InputDecoration(
                hintText: "Item",
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )
              ),
            ),
            SizedBox(height: 10,),
            //Text("Price"),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Price",
                filled: true,
                fillColor: Theme.of(context).colorScheme.tertiary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                )
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: saveItem,
                  child: Text("Add"),
                  color: Theme.of(context).colorScheme.tertiary,

                ),
                SizedBox(width: 20,),
                MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class StoreDialogue extends StatelessWidget {

  final storeControler;
  final VoidCallback saveItem;

  const StoreDialogue({
    super.key,
    required this.storeControler,
    required this.saveItem,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Input"),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Container(
        height: 100,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text("Item to add"),
            TextField(
              controller: storeControler,
              decoration: InputDecoration(
                  hintText: "Store",
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: saveItem,
                  child: Text("Add"),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                SizedBox(width: 20,),
                MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

