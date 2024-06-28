import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/products/controller/products_controller.dart';
import 'package:bila_hodoud/features/products/model/models/product_model.dart';
import 'package:bila_hodoud/features/products/model/params/product_params.dart';
import 'package:bila_hodoud/features/subsections/controller/subsection_controller.dart';
import 'package:bila_hodoud/features/subsections/model/models/subsection_model.dart';
import 'package:bila_hodoud/features/subsections/model/params/subsection_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/components/most_used_button.dart';
import '../../../../../core/components/used_filled.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../core/constants/style/text_style_features.dart';
import '../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../presentation/view/global_interface.dart';

class ModifyProductScreen extends StatefulWidget {
  final int? sectionId;
  final ProductModel? product;

  const ModifyProductScreen({super.key, this.product, this.sectionId});

  @override
  State<ModifyProductScreen> createState() => _ModifyProductScreenState();
}

class _ModifyProductScreenState extends State<ModifyProductScreen> {
  final ProductsController? productsController = Get.find<ProductsController>();
  final _productFormKey = GlobalKey<FormState>();
  ProductParams params = ProductParams();
  TextEditingController name = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController minimumQuantity = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.product != null) {
      name.text = widget.product?.name ?? "";
      barcode.text = widget.product?.barcode ?? "";
      description.text = widget.product?.description ?? "";
      price.text = widget.product?.price.toString() ?? "";
      quantity.text = widget.product?.quantity.toString() ?? "";
      minimumQuantity.text = widget.product?.minimumQuantity.toString() ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          widget.product != null ? 'تعديل منتج' : 'إضافة منتج',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Form(
      key: _productFormKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsedFilled(
              label: 'اسم المنتج',
              controller: name,
              isMandatory: true,
              onSaved: (value) {
                params.name = value;
              },
            ),
            UsedFilled(
              label: 'الباركود',
              controller: barcode,
              isMandatory: true,
              onSaved: (value) {
                params.barcode = value;
              },
            ),
            UsedFilled(
              label: 'الوصف',
              controller: description,
              isMandatory: true,
              onSaved: (value) {
                params.description = value;
              },
            ),
            UsedFilled(
              label: 'السعر',
              controller: price,
              isMandatory: true,
              onSaved: (value) {
                params.price = value;
              },
            ),
            UsedFilled(
              label: 'الكمية',
              controller: quantity,
              isMandatory: true,
              onSaved: (value) {
                params.quantity = value;
              },
            ),
            UsedFilled(
              label: 'الحد الأدنى للكمية',
              controller: minimumQuantity,
              isMandatory: true,
              onSaved: (value) {
                params.minimumQuantity = value;
              },
            ),
          ],
        ),
      ),
    ));

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      MostUsedButton(
        buttonText: 'حفظ',
        buttonIcon: Icons.save,
        onTap: () {
          if (_productFormKey.currentState!.validate()) {
            _productFormKey.currentState?.save();

            if (widget.product != null) {
              // productsController?.updateSubsection(
              //     widget.sectionId ?? 0, widget.product?.id ?? 0, params);
            } else {
              params.sectionId = widget.sectionId.toString();
              productsController?.addProduct(params);
            }
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
