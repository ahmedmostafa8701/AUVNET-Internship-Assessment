import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/text_sizes.dart';
class ProductItemWidget extends StatelessWidget {
  ProductItemWidget({
    super.key,
    required this.productName,
    required this.price,
    required this.image,
  });
  String productName;
  double price;
  ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: image,
          width: 200,
          height: 120,
        ),
        Text(
          productName,
          style: TextStyle(
            fontSize: heading1,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        Text(
          'Price: \$$price',
          style: TextStyle(
            fontSize: heading2,
            fontWeight: FontWeight.w400,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
