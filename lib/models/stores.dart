import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shapp/models/store.dart';
import '../utils/input_dialog.dart';

class Stores with ChangeNotifier {
  List<Store> stores = [];

  // Memory Management
  final storeBox = Hive.box('MyBoxer');

  Stores() {
    stores = storeBox.get('STORES', defaultValue: <Store>[]).cast<Store>();
  }

  // ADDING STORES:
  TextEditingController storeController = TextEditingController();

  void addStore(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StoreDialogue(
          storeControler: storeController,
          saveItem: () {
            stores.add(
              Store(
                storeName: storeController.text,
                product: ["test"],
                price: [00],
              ),
            );
            storeBox.put('STORES', stores);
            storeController.clear();
            Navigator.pop(context);
            notifyListeners();
          },
        );
      },
    );
  }

  void removeStore(int index) {
    stores.removeAt(index);
    notifyListeners();
    storeBox.put('STORES', stores);
  }

  // ADDING ITEMS
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  int totalss(Store store) {
    if (store.price.isNotEmpty) {
      int total = store.price.reduce((a, b) => a + b);
      return total;
    } else {
      return 0;
    }
  }

  void addItem(BuildContext context, Store store) {
    final targetStore = stores.firstWhere((s) => s == store);
    showDialog(
      context: context,
      builder: (context) {
        return InputDialog(
          productController: productController,
          priceController: priceController,
          saveItem: () {
            targetStore.product.add(productController.text);
            targetStore.price.add(int.parse(priceController.text));
            notifyListeners();
            totalss(targetStore);
            storeBox.put('STORES', stores);
            Navigator.of(context).pop();
            productController.clear();
            priceController.clear();
            notifyListeners();
          },
        );
      },
    );
  }

  void removeProductFromStore(Store store, int index) {
    final targetStore = stores.firstWhere((s) => s == store);
    targetStore.product.removeAt(index);
    targetStore.price.removeAt(index);
    totalss(store);
    storeBox.put('STORES', stores);
    notifyListeners();
  }

  // Read data
  List<Store> getStores() => storeBox.get('STORES', defaultValue: <Store>[]).cast<Store>();

  // Write data
  void setStores(List<Store> stores) => storeBox.put('STORES', stores);

  @override
  void dispose() {
    storeController.dispose();
    productController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
