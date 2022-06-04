import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/common_widgets/date_picker.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  late List<String> antecedentsMedicaux = [];
  late List<String> antecedentsChirurgicaux = [];
  late List<String> signeFonctionnel = [];
  late List<String> examenClinique = [];
  late List<String> examenBiologique = [];
  late DateTime creationDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: 130.w,
              //   height: 130.h,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(whiteLogo),
              //     ),
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width.w,
                margin: const EdgeInsets.only(left: 24.95, right: 24.95),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220.w,
                        height: 50.h,
                        child: const Text(
                          'Ajoute un nouveau patient',
                          style: TextStyle(
                            color: Color(0xff181725),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                            // if (!Validators.isValidUsername(value)) {
                            //   return invalidUsernameSignInError;
                            // }
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
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
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
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 233.w,
                        height: 30.h,
                        child: const Text(
                          'Antécédents chirurgicaux:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Age:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 233.w,
                        height: 30.h,
                        child: const Text(
                          'Signe fonctionnel:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DatePicker(
                        title: 'Date',
                        hintText: 'DD/MM/YYYY',
                        selectedDate: creationDate,
                        onSelectedDate: (DateTime date) {
                          setState(() {
                            creationDate = date;
                          });
                        },
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Age:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 233.w,
                        height: 30.h,
                        child: const Text(
                          'Examen clinique:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DatePicker(
                        title: 'Date',
                        hintText: 'DD/MM/YYYY',
                        selectedDate: creationDate,
                        onSelectedDate: (DateTime date) {
                          setState(() {
                            creationDate = date;
                          });
                        },
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Age:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 233.w,
                        height: 30.h,
                        child: const Text(
                          'Examen biologique:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DatePicker(
                        title: 'Date',
                        hintText: 'DD/MM/YYYY',
                        selectedDate: creationDate,
                        onSelectedDate: (DateTime date) {
                          setState(() {
                            creationDate = date;
                          });
                        },
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Age:',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtomMedia(
                        press: () {
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
