import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/common_widgets/date_picker.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:dawini/constants/strings.dart';
import 'package:dawini/utils/validators.dart';
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
  late DateTime creationDate = DateTime.now();
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
                            if (value!.isEmpty) {
                              return invalidNameError;
                            }
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
                            if (value!.isEmpty) {
                              return invalidPrenomError;
                            }
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
                        height: 15.h,
                        child: const Text(
                          'Antécédents medicaux:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (antecedentsMedicaux.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: antecedentsMedicaux.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '- ${antecedentsMedicaux[index]}',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          antecedentsMedicaux.removeWhere(
                                              (element) =>
                                                  element ==
                                                  antecedentsMedicaux[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            antecedentsMedicauxString = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            antecedentsMedicaux.add(antecedentsMedicauxString);
                            antecedentsMedicauxString = '';
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'ENVOYER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 233.w,
                        height: 15.h,
                        child: const Text(
                          'Antécédents chirurgicaux:',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (antecedentsChirurgicaux.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: antecedentsChirurgicaux.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '- ${antecedentsChirurgicaux[index]}',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          antecedentsChirurgicaux.removeWhere(
                                              (element) =>
                                                  element ==
                                                  antecedentsChirurgicaux[
                                                      index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            antecedentsChirurgicauxString = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            antecedentsChirurgicaux
                                .add(antecedentsChirurgicauxString);
                            antecedentsChirurgicauxString = '';
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'ENVOYER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
                      if (signeFonctionnel.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: signeFonctionnel.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                            '- ${signeFonctionnel[index]}')),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          signeFonctionnel.removeWhere(
                                              (element) =>
                                                  element ==
                                                  signeFonctionnel[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            signeFonctionnelString = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            signeFonctionnel.add(signeFonctionnelString);
                            signeFonctionnelString = '';
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'ENVOYER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
                      if (examenClinique.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: examenClinique.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                        child:
                                            Text('- ${examenClinique[index]}')),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          examenClinique.removeWhere(
                                              (element) =>
                                                  element ==
                                                  examenClinique[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            examenCliniqueString = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            examenClinique.add(examenCliniqueString);
                            examenCliniqueString = '';
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'ENVOYER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
                      if (examenBiologique.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: examenBiologique.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                            '- ${examenBiologique[index]}')),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          examenBiologique.removeWhere(
                                              (element) =>
                                                  element ==
                                                  examenBiologique[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            examenBiologiqueString = value;
                          },
                          validator: (String? value) {
                            // if (!Validators.isValidprenom(value)) {
                            //   return invalidprenomError;
                            // }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            examenBiologique.add(examenBiologiqueString);
                            examenBiologiqueString = '';
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'ENVOYER',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
