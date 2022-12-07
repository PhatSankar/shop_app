

import 'package:dio/dio.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';


class ProductRepository {
  ProductRepository._privateConstructor();
  static final ProductRepository instance = ProductRepository._privateConstructor();

  static var options = BaseOptions(
    baseUrl: baseURL
  );
  static Dio dio = Dio(options);

  Future<List<FakeProduct>> getAllProducts() async {
    try {
      // https://fakestoreapi.com/products
      var response = await dio.get('/products');
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

  Future<List<FakeProduct>> getLimitedProducts(int limited) async {
    try {
      // https://fakestoreapi.com/products?limit=5
      var response = await dio.get('/products', queryParameters: {'limit': limited});
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

  Future<List<FakeProduct>> getCategoryAndLimitedProducts(int limited, String category) async {
    try {
      // https://fakestoreapi.com/products/category/jewelery?limit=2
      var response = await dio.get('/products/category/${category}', queryParameters: {'limit': limited});
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