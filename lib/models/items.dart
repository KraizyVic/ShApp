import 'package:hive_flutter/hive_flutter.dart';

class Items{
  List<String> products = ["Ho"];
  List<int> prices = [0];

  final theStoreBox = Hive.box('myBoxer');

  void initialStoreData(){
    products = [
      "Swipe >>> to delete",
      "Swipe <<< to edit (non functional)",
      "Press the + to add item",
    ];
    prices = [
      0,
      0,
      0,
    ];
  }
  void loadStoreData(){
    products = theStoreBox.get('PRODUCTS');
    prices = theStoreBox.get('PRICES');

  }
  void updateStoreData(){
    theStoreBox.put('PRODUCTS', products);
    theStoreBox.put('PRICES', prices);
  }
}