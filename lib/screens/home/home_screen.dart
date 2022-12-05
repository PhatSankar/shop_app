

import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components//home_app_bar.dart';
import 'package:shop_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(),
      body: Body(),
    );
  }
}
