

import 'package:dio/dio.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';

const productUrl = '${baseURL}/products';

class ProductRepository {
  ProductRepository._privateConstructor();
  static final ProductRepository instance = ProductRepository._privateConstructor();

  static var options = BaseOptions(
    baseUrl: productUrl
  );
  static Dio dio = Dio(options);

  Future<List<FakeProduct>> getAllProducts() async {
    try {
      var response = await dio.get('');
      if (response.statusCode == 200)
        {
          List<FakeProduct> _list = [];
          if (response.data != null)
            {
              response.data.forEach((e) {
                _list.add(FakeProduct.fromJson(e));
              });
            }
          return _list;
        }
      else
        {
          throw Exception('Fail to get products');
        }
    }
    catch (exeption) {
      throw Exception('Can not get all products ' + exeption.toString());
    }
  }

}