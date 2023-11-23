import 'package:baby_shop/common/constants/variabels.dart';
import 'package:baby_shop/data/models/responses/product_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    final response = await http.get(Uri.parse('${Variabels.baseUrl}/api/products?populate=* '));

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left("Server Error");
    }
  }
}
