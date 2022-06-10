import 'dart:math';

import 'package:dawini/app/all_patient/add_consigne/widgets/build_consigne_list.dart';
import 'package:dawini/app/models/patient.dart';
import 'package:dawini/app/new_patient/image_to_text.dart';
import 'package:dawini/app/new_patient/widgets/build_date_info.dart';
import 'package:dawini/app/new_patient/widgets/build_imagerie_list.dart';
import 'package:dawini/app/new_patient/widgets/build_list_info.dart';
import 'package:dawini/app/new_patient/widgets/build_title.dart';
import 'package:dawini/app/new_patient/widgets/build_title_info.dart';
import 'package:dawini/common_widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dawini/app/new_patient/widgets/build_buttom_info.dart';
import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:dawini/constants/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddConsigneForm extends StatefulWidget {
  const AddConsigneForm({
    Key? key,
    required this.patient,
    required this.onSaved,
  }) : super(key: key);
  final void Function({
    required List<dynamic>? consigneList,
  }) onSaved;
  final Patient? patient;
  @override
  State<AddConsigneForm> createState() => _AddConsigneFormState();
}

class _AddConsigneFormState extends State<AddConsigneForm> {
  late final _formKey = GlobalKey<FormState>();

  late DateTime consigneDate = DateTime.now();
  late String? consigneText = '';
  late List<dynamic>? consigneList = [];
  @override
  void initState() {
    if (widget.patient != null) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width.w,
                margin: const EdgeInsets.only(left: 24.95, right: 24.95),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildTitle(title: 'Ajoute la consigne du jour'),
                      if (consigneList!.isNotEmpty)
                        BuildConsigneList(consigne: consigneList),
                      const SizedBox(
                        height: 15,
                      ),
                      BuildDateInfo(
                        date: consigneDate,
                        fct: (DateTime date) {
                          setState(() {
                            consigneDate = date;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          lines: 10,
                          onChanged: (var value) {
                            consigneText = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (consigneText != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Map consigneMap = {
                                'consigneDate': consigneDate,
                                'consigne': consigneText,
                              };
                              consigneList!.add(consigneMap);
                              consigneText = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(title: 'ENVOYER'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ButtomMedia(
                        press: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            widget.onSaved(
                              consigneList: consigneList,
                            );
                          }
                        },
                        color: const Color(0xff5383EC),
                        text: 'Submit',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
