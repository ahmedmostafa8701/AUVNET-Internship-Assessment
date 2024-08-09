import 'package:auvnet_internship_assessment/core/presentation/responsive.dart';
import 'package:auvnet_internship_assessment/core/presentation/widgets/app_bar.dart';
import 'package:auvnet_internship_assessment/features/products/models/products_model.dart';
import 'package:auvnet_internship_assessment/styles/colors.dart';
import 'package:auvnet_internship_assessment/styles/text_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  static String routeName = '/product';
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(title: 'Product Page'),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: responsiveHeight(50)),
        child: SingleChildScrollView(
          child: Column(
            children: ProductList.products.map((product) =>
              ProductItemWidget(
                productName: product.name,
                price: product.price,
                image: AssetImage(product.image),
              )
            ).toList(),
          ),
        ),
      ),
    );
  }
}