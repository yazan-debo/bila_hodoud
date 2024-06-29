import 'dart:typed_data';

import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/products/controller/products_controller.dart';
import 'package:bila_hodoud/features/products/model/models/book_model.dart';
import 'package:bila_hodoud/features/products/model/models/image_file_model.dart';
import 'package:bila_hodoud/features/products/model/models/product_model.dart';
import 'package:bila_hodoud/features/products/model/params/product_params.dart';
import 'package:bila_hodoud/features/subsections/controller/subsection_controller.dart';
import 'package:bila_hodoud/features/subsections/model/models/subsection_model.dart';
import 'package:bila_hodoud/features/subsections/model/params/subsection_params.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/components/most_used_button.dart';
import '../../../../../core/components/used_filled.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../core/constants/style/text_style_features.dart';
import '../../../../../core/constants/urls.dart';
import '../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../presentation/view/global_interface.dart';
import '../../../controller/file_upload_controller.dart';

class ModifyBookScreen extends StatefulWidget {
  final int? sectionId;
  final ProductModel? product;

  const ModifyBookScreen({super.key, this.product, this.sectionId});

  @override
  State<ModifyBookScreen> createState() => _ModifyBookScreenState();
}

class _ModifyBookScreenState extends State<ModifyBookScreen> {
  final ProductsController? productsController = Get.find<ProductsController>();

  final FileUploadController fileUploadController =
      Get.put(FileUploadController());
  final _bookFormKey = GlobalKey<FormState>();
  ProductParams params = ProductParams();
  TextEditingController name = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController minimumQuantity = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController translator = TextEditingController();
  TextEditingController dimensions = TextEditingController();
  TextEditingController numberOfPages = TextEditingController();
  TextEditingController printType = TextEditingController();
  TextEditingController targetAge = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    params.book = BookModel();

    if (widget.product != null) {
      name.text = widget.product?.name ?? "";
      barcode.text = widget.product?.barcode ?? "";
      description.text = widget.product?.description ?? "";
      price.text = widget.product?.price.toString() ?? "";
      quantity.text = widget.product?.quantity.toString() ?? "";
      minimumQuantity.text = widget.product?.minimumQuantity.toString() ?? "";
      author.text = widget.product?.book?.author.toString() ?? "";
      translator.text = widget.product?.book?.translator.toString() ?? "";
      dimensions.text = widget.product?.book?.dimensions.toString() ?? "";
      numberOfPages.text = widget.product?.book?.numOfPages.toString() ?? "";
      printType.text = widget.product?.book?.printType.toString() ?? "";
      targetAge.text = widget.product?.book?.targetAge.toString() ?? "";
    }

    super.initState();
  }

  void _selectFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileUploadController.addFile(
          result.files.first.bytes!, result.files.first.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          widget.product != null ? 'تعديل كتاب' : 'إضافة كتاب',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Form(
      key: _bookFormKey,
      child: Expanded(
        child: SingleChildScrollView(
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
              UsedFilled(
                label: 'المؤلف',
                controller: author,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.author = value;
                },
              ),
              UsedFilled(
                label: 'المترجم',
                controller: translator,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.translator = value;
                },
              ),
              UsedFilled(
                label: 'الأبعاد',
                controller: dimensions,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.dimensions = value;
                },
              ),
              UsedFilled(
                label: 'عدد الصفحات',
                controller: numberOfPages,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.numOfPages = value;
                },
              ),
              UsedFilled(
                label: 'طريقة الطباعة',
                controller: printType,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.printType = value;
                },
              ),
              UsedFilled(
                label: 'الأعمار المستهدفة',
                controller: targetAge,
                isMandatory: true,
                onSaved: (value) {
                  params.book?.targetAge = value;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    "صورة المنتج",
                    style: TextStyleFeatures.generalTextStyle,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(width: 25),
                  Container(
                      width: 15.w,
                      height: 12.w,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          _selectFile();
                        },
                        child: SizedBox(
                          width: 13.w,
                          height: 10.w,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 33,
                            ),
                          ),
                        ),
                      ))),
                  Obx(
                    () => fileUploadController.images.isEmpty &&
                            widget.product != null
                        ? Expanded(
                            child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    Urls.imageUrl +
                                        widget.product!.images!
                                            .replaceAll('[', "")
                                            .replaceAll(']', '')
                                            .replaceAll('"', "")
                                            .replaceAll("\\", ""),
                                    height: 10.w,
                                    fit: BoxFit.cover,
                                  ),
                                  Text("")
                                ],
                              ))
                            ],
                          ))
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: fileUploadController.images.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.memory(
                                      fileUploadController.images[index].image,
                                      height: 10.w,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(fileUploadController
                                        .images[index].fileName)
                                  ],
                                ));
                              },
                            ),
                          ),
                  )
                ],
              )
            ],
          ),
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
        onTap: () async {
          _bookFormKey.currentState?.save();
          if (_bookFormKey.currentState!.validate() &&
              fileUploadController.images.isNotEmpty) {
            _bookFormKey.currentState?.save();

            if (widget.product != null) {
              params.sectionId = widget.sectionId.toString();
              List<ImageFileModel> images = [];
              for (int i = 0; i < fileUploadController.images.length; i++) {
                images.add(fileUploadController.images[i]);
              }
              productsController?.updateProduct(widget.sectionId ?? 0,
                  widget.product?.id ?? 0, params, images);
            } else {
              params.sectionId = widget.sectionId.toString();
              List<ImageFileModel> images = [];
              for (int i = 0; i < fileUploadController.images.length; i++) {
                images.add(fileUploadController.images[i]);
              }

              bool? isClear =
                  await productsController?.addProduct(params, images);
              if (isClear ?? false) {
                fileUploadController.clear();
              }
            }
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
