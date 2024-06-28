import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/permissions/model/models/role_model.dart';
import 'package:bila_hodoud/features/permissions/model/params/role_params.dart';
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
import '../../controller/roles_controller.dart';

class ModifyRoleScreen extends StatefulWidget {
  final RoleModel? role;

  const ModifyRoleScreen({super.key, this.role});

  @override
  State<ModifyRoleScreen> createState() => _ModifyRoleScreenState();
}

class _ModifyRoleScreenState extends State<ModifyRoleScreen> {
  final RolesController? rolesController = Get.find<RolesController>();
  final _roleFormKey = GlobalKey<FormState>();
  RoleParams params = RoleParams();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.role != null) {
      name.text = widget.role?.name ?? "";
      description.text = widget.role?.description ?? "";
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
          widget.role != null ? 'تعديل دور' : 'إضافة دور جديد',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Form(
      key: _roleFormKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsedFilled(
              label: 'اسم الدور',
              controller: name,
              isMandatory: true,
              onSaved: (value) {
                params.name = value;
              },
            ),
            UsedFilled(
              label: 'وصف الدور',
              controller: description,
              isMandatory: true,
              onSaved: (value) {
                params.description = value;
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
          if (_roleFormKey.currentState!.validate()) {
            _roleFormKey.currentState?.save();

            if (widget.role != null) {
              rolesController?.updateRole(widget.role?.id ?? 0, params);
            } else {
              rolesController?.addRole(params);
            }
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
