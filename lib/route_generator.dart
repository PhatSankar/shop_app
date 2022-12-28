import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/FakeProduct.dart';
import 'package:shop_app/screens/detail/detail_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case "/detail":
        final routeArgs = settings.arguments as Map;
        final FakeProduct product = routeArgs['product'] as FakeProduct;
        return MaterialPageRoute(
            builder: (context) => Provider(
                  create: (_) => product,
                  child: DetailScreen(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Center(
            child: Text("Error"),
          ),
        ),
      );
    });
  }
}
