import 'package:baby_shop/common/extentions/money_format/usd.dart';

class ProductModel {
  final List<String> images;
  final String name;
  final int price;
  ProductModel({
    required this.images,
    required this.name,
    required this.price,
  });

  String get priceFormat => price.currencyFormatUsd;
}
