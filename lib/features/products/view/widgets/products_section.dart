import 'package:bila_hodoud/features/products/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.px),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              // Number of columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 300.px,
              childAspectRatio: 1),
          itemCount: 6, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return ProductWidget();
          }),
    );
  }
}
