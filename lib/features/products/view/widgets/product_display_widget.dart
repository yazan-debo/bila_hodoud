import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

class ProductDisplayWidget extends StatelessWidget {
  final String images;
  final String description;
  final String productName;
  final String barcode;
  final int price;
  final int quantity;
  final int minimumQuantity;
  final Map<String, dynamic> additionalSpecifications;

  ProductDisplayWidget({
    required this.images,
    required this.description,
    required this.productName,
    required this.barcode,
    required this.price,
    required this.quantity,
    required this.minimumQuantity,
    this.additionalSpecifications = const {},
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                productName,
                style: TextStyleFeatures.generalTextStyle,
              ),
              const SizedBox(height: 30),
              Container(
                height: 500,
                child:
                    SingleChildScrollView(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSpecificationRow('باركود', barcode),
                  const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                  _buildSpecificationRow('سعر المنتج', '$price ليرة '),
                  const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                  _buildSpecificationRow('الكمية', '$quantity'),
                  const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                  _buildSpecificationRow('أقل كمية مسموح بها', '$minimumQuantity'),
                  const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                  for (var entry in additionalSpecifications.entries)
                    _buildSpecificationRow(entry.key, entry.value.toString()),

                ],
              ),
                    ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'صور المنتج', // Images Label (in Arabic)
                style: TextStyleFeatures.generalTextStyle,

              ),
              SizedBox(height: 10),

              Container(
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(images[index]);
                  },
                ),
              ),

              SizedBox(height: 20),
              Text(
                'الوصف', // Description Label (in Arabic)
                style: TextStyleFeatures.generalTextStyle,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildSpecificationRow(String key, String value) {
    return Column(
      children: [
        const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: TextStyleFeatures.generalTextStyle,
            ),
            Text(value, style: TextStyle(fontSize: 18),),
          ],
        ),
      ],
    );
  }
}