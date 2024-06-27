import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'order_widget.dart';

class PaidByTransferSection extends StatelessWidget {
  const PaidByTransferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.px),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // Number of columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 300.px,
              childAspectRatio: 1),
          itemCount: 4, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return OrderWidget();
          }),
    );
  }
}
