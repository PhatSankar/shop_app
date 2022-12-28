import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';

class ColorAndSize extends StatefulWidget {
  const ColorAndSize({Key? key}) : super(key: key);

  @override
  State<ColorAndSize> createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<FakeProduct>(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Color"),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: ColorDot(
                      color: Color(0xFF356C95),
                      isSelected: selectedIndex == 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: ColorDot(
                      color: Color(0xFFF8C078),
                      isSelected: selectedIndex == 1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: ColorDot(
                      color: Color(0xFFA29B9B),
                      isSelected: selectedIndex == 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(style: TextStyle(color: kTextColor), children: [
            TextSpan(text: "Category\n"),
            TextSpan(
                text: "${product.category.toUpperCase()}",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold))
          ])),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  Color color;
  final bool isSelected;

  ColorDot({required this.color, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      padding: const EdgeInsets.all(2.5),
      margin: const EdgeInsets.only(
          top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      height: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.transparent)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
