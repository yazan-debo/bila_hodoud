import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/offers/controller/offers_controller.dart';
import 'package:bila_hodoud/features/offers/model/models/offer_model.dart';
import 'package:bila_hodoud/features/offers/model/params/offer_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/used_filled.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

import '../../../../presentation/controllers/global_interface_controller.dart';

import '../../../../core/components/most_used_button.dart';

import '../../../../presentation/view/global_interface.dart';

class ModifyOfferScreen extends StatefulWidget {
  final OfferModel? offer;

  const ModifyOfferScreen({super.key, this.offer});

  @override
  State<ModifyOfferScreen> createState() => _ModifyOfferScreenState();
}

class _ModifyOfferScreenState extends State<ModifyOfferScreen> {
  final OffersController? offersController = Get.find<OffersController>();
  final _offerFormKey = GlobalKey<FormState>();
  OfferParams params = OfferParams();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.offer != null) {
      name.text = widget.offer?.name ?? "";
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
          widget.offer != null ? 'تعديل عرض' : 'إضافة عرض جديد',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Form(
      key: _offerFormKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsedFilled(
              label: 'اسم العرض',
              controller: name,
              isMandatory: true,
              onSaved: (value) {
                params.name = value;
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
          if (_offerFormKey.currentState!.validate()) {
            _offerFormKey.currentState?.save();

            if (widget.offer != null) {
              offersController?.updateOffer(widget.offer?.id ?? 0, params);
            } else {
              offersController?.addOffer(params);
            }
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
