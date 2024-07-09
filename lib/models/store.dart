import 'package:hive/hive.dart';

part 'store.g.dart';

@HiveType(typeId: 0)

class Store {
  @HiveField(0)
  final String storeName;

  @HiveField(1)
  final List<String> product;

  @HiveField(2)
  final List<int> price;

  Store({
    required this.storeName,
    required this.product,
    required this.price,
  });
}

/*class StoreAdapter extends TypeAdapter<Store> {
  @override
  final typeId = 0;

  @override
  Store read(BinaryReader reader) {
    return Store(
      storeName: reader.readString(),
      product: List<String>.from(reader.readList().map((item) => item as String)),
      price: List<int>.from(reader.readList().map((item) => item as int)),
    );
  }

  @override
  void write(BinaryWriter writer, Store obj) {
    writer.writeString(obj.storeName);
    writer.writeList(obj.product);
    writer.writeList(obj.price);
  }
}*/
