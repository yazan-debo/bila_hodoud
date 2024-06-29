import 'package:bila_hodoud/features/products/controller/products_controller.dart';
import 'package:bila_hodoud/features/products/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/retry_widget.dart';

class ProductsSection extends StatefulWidget {
  final int sectionId;

  const ProductsSection({super.key, required this.sectionId});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final ProductsController? productsController = Get.find<ProductsController>();

  @override
  void initState() {
    // TODO: implement initState
    productsController?.getProducts(widget.sectionId, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.px),
        child: productsController!.obx(
          (state) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                // Number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300.px,
                childAspectRatio: 1),
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductWidget(
                sectionId: widget.sectionId,
                product: state![index],
                onDelete: () {
                  productsController?.getProducts(widget.sectionId, false);
                },
              );
            },
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: Center(
            child: RetryWidget(
                error: "لا يوجد نتائج",
                func: () =>
                    productsController?.getProducts(widget.sectionId, true)),
          ),
          onError: (error) => Center(
              child: RetryWidget(
                  error: error!,
                  func: () =>
                      productsController?.getProducts(widget.sectionId, true))),
        ));
  }
}
