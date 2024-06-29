import 'package:bila_hodoud/features/products/controller/products_controller.dart';
import 'package:bila_hodoud/features/products/model/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../pages/display_products/display_book_page.dart';
import '../pages/display_products/display_game_page.dart';
import '../pages/display_products/display_product_page.dart';
import '../pages/display_products/display_quran_page.dart';
import '../pages/display_products/display_stationary_page.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final ProductsController? productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {

          if (widget.product.book != null){
            Get.to(() =>  DisplayBookPage(productModel: widget.product,));
          }
          else   if (widget.product.stationery != null){
            Get.to(() =>  DisplayStationaryPage(productModel: widget.product,));
          }
          else   if (widget.product.game != null){
            Get.to(() =>  DisplayGamePage(productModel: widget.product,));
          }
          else   if (widget.product.quran != null){
            Get.to(() =>  DisplayQuranPage(productModel: widget.product,));
          } else   {
            Get.to(() =>  DisplayProductPage(productModel: widget.product,));
          }

        },
        child: Stack(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.all(10.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                    color: ColorStyleFeatures.headLinesTextColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.px),
                          ),
                          child: Icon(
                            Icons.document_scanner_sharp,
                            size: 75,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.px),
                          ),
                          child: Center(
                              child: Text(
                            widget.product.name ?? "",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.px),
                          )),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    icon: Icons.edit,
                    backgroundColor: Colors.grey[400]!,
                    onTap: () {
                      switch (widget.product.sectionId) {
                        case 1:
                          print("1");
                          break;
                        case 2:
                          print("1");
                          break;
                        case 3:
                          print("1");
                          break;

                        case 4:
                          print("1");
                          break;
                        default:
                          print("1");
                          break;
                      }
                      // Get.to(() => ModifySubsectionScreen(
                      //   subsection: widget.subsection,
                      //   sectionId: widget.sectionId,
                      // ));
                    },
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  CustomButton(
                    icon: Icons.delete,
                    backgroundColor: Colors.red[600]!,
                    onTap: () async {
                      // bool? isSuccess = await productsController
                      //     ?.deleteSubsection(widget.subsection.id ?? 0);
                      // if (isSuccess ?? false) {
                      //   widget.onDelete();
                      // }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
