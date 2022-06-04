import 'package:dawini/app/new_patient/widgets/build_date_info.dart';
import 'package:dawini/app/new_patient/widgets/build_list_info.dart';
import 'package:dawini/app/new_patient/widgets/build_title.dart';
import 'package:dawini/app/new_patient/widgets/build_title_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dawini/app/new_patient/widgets/build_buttom_info.dart';
import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:dawini/constants/strings.dart';
import 'package:dawini/utils/validators.dart';

class NewPatientForm extends StatefulWidget {
  const NewPatientForm({
    Key? key,
    required this.onSaved,
  }) : super(key: key);
  final void Function({
    required String nom,
    required String prenom,
    required int age,
    required List<String> antecedentsMedicaux,
    required List<String> antecedentsChirurgicaux,
    required List<String> signeFonctionnel,
    required List<String> examenClinique,
    required List<String> examenBiologique,
  }) onSaved;

  @override
  State<NewPatientForm> createState() => _NewPatientFormState();
}

class _NewPatientFormState extends State<NewPatientForm> {
  late final _formKey = GlobalKey<FormState>();
  late String nom = '';
  late String prenom = '';
  late int age;
  late String antecedentsMedicauxString;
  late List<String> antecedentsMedicaux = [];
  late String antecedentsChirurgicauxString;
  late List<String> antecedentsChirurgicaux = [];
  late String signeFonctionnelString;
  late List<String> signeFonctionnel = [];
  late String examenCliniqueString;
  late List<String> examenClinique = [];
  late String examenBiologiqueString;
  late List<String> examenBiologique = [];
  late DateTime signeFonctionnelDate = DateTime.now();
  late DateTime examenCliniqueDate = DateTime.now();
  late DateTime examenBiologiqueDate = DateTime.now();
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
                      const BuildTitle(),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Nom:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            nom = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return invalidNameError;
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Prenom:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return invalidPrenomError;
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Age:',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          onChanged: (var value) {
                            age = int.parse(value);
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return invalidAgeError;
                            } else if (!Validators.isValidNumber(value)) {
                              return invalidAgeTypeError;
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const BuildTitleInfo(text: 'Antécédents medicaux:'),
                      if (antecedentsMedicaux.isNotEmpty)
                        BuildListInfo(
                          listInfo: antecedentsMedicaux,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            antecedentsMedicauxString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (antecedentsMedicauxString != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              antecedentsMedicaux
                                  .add(antecedentsMedicauxString);
                              antecedentsMedicauxString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(),
                      ),
                      const BuildTitleInfo(text: 'Antécédents chirurgicaux:'),
                      if (antecedentsChirurgicaux.isNotEmpty)
                        BuildListInfo(
                          listInfo: antecedentsChirurgicaux,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            antecedentsChirurgicauxString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (antecedentsChirurgicauxString != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              antecedentsChirurgicaux
                                  .add(antecedentsChirurgicauxString);
                              antecedentsChirurgicauxString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(),
                      ),
                      const BuildTitleInfo(text: 'Signe fonctionnel:'),
                      BuildDateInfo(
                        date: signeFonctionnelDate,
                        fct: (DateTime date) {
                          setState(() {
                            signeFonctionnelDate = date;
                          });
                        },
                      ),
                      if (signeFonctionnel.isNotEmpty)
                        BuildListInfo(
                          listInfo: signeFonctionnel,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            signeFonctionnelString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (signeFonctionnelString != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              signeFonctionnel.add(signeFonctionnelString);
                              signeFonctionnelString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(),
                      ),
                      const BuildTitleInfo(text: 'Examen clinique:'),
                      BuildDateInfo(
                        date: examenCliniqueDate,
                        fct: (DateTime date) {
                          setState(() {
                            examenCliniqueDate = date;
                          });
                        },
                      ),
                      if (examenClinique.isNotEmpty)
                        BuildListInfo(
                          listInfo: examenClinique,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            examenCliniqueString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (examenCliniqueString != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              examenClinique.add(examenCliniqueString);
                              examenCliniqueString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(),
                      ),
                      const BuildTitleInfo(text: 'Examen biologique:'),
                      BuildDateInfo(
                        date: examenBiologiqueDate,
                        fct: (DateTime date) {
                          setState(() {
                            examenBiologiqueDate = date;
                          });
                        },
                      ),
                      if (examenBiologique.isNotEmpty)
                        BuildListInfo(
                          listInfo: examenBiologique,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            examenBiologiqueString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (examenBiologiqueString != '') {
                              FocusScope.of(context).requestFocus(FocusNode());
                              examenBiologique.add(examenBiologiqueString);
                              examenBiologiqueString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtomMedia(
                        press: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            widget.onSaved(
                              nom: nom,
                              prenom: prenom,
                              age: age,
                              antecedentsMedicaux: antecedentsMedicaux,
                              antecedentsChirurgicaux: antecedentsChirurgicaux,
                              signeFonctionnel: signeFonctionnel,
                              examenClinique: examenClinique,
                              examenBiologique: examenBiologique,
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
