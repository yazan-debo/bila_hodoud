import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../presentation/view/global_interface.dart';
import '../../../model/models/product_model.dart';
import '../../widgets/product_display_widget.dart';

class DisplayGamePage extends StatefulWidget {
  final ProductModel? productModel;

  const DisplayGamePage({super.key, this.productModel});

  @override
  State<DisplayGamePage> createState() => _DisplayGamePageState();
}

class _DisplayGamePageState extends State<DisplayGamePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
    Get.put(GlobalInterfaceController());

    globalInterfaceController.removeExtraWidgets();

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(ProductDisplayWidget(
      images: widget.productModel?.images ?? "",
      description: widget.productModel?.description??"",
      productName: widget.productModel?.name??"",
      barcode: widget.productModel?.barcode??"",
      price: widget.productModel?.price??0,
      quantity: widget.productModel?.quantity??0,
      minimumQuantity: widget.productModel?.minimumQuantity??0,
      additionalSpecifications:  {

        'الأهداف': widget.productModel?.game?.goals,
        'العمر المستهدف':widget.productModel?.game?.targetAge,
        'المواد المصنعة':widget.productModel?.game?.materials,
        'المصنّع':widget.productModel?.game?.manufacturer,
        'عدد اللاعبين':widget.productModel?.game?.numOfPlayers,
      },
    ));

    return const GlobalInterface();
  }
}
