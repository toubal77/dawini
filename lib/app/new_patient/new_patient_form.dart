import 'dart:math';

import 'package:dawini/app/all_patient/add_consigne/add_consigne_screen.dart';
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

class NewPatientForm extends StatefulWidget {
  const NewPatientForm({
    Key? key,
    required this.patient,
    required this.onSaved,
  }) : super(key: key);
  final void Function({
    required String id,
    required String? nom,
    required String? prenom,
    required int? age,
    required int sixe,
    required List<dynamic>? antecedentsMedicaux,
    required List<dynamic>? antecedentsChirurgicaux,
    required Map? signeFonctionnel,
    required Map? examenClinique,
    required Map? examenBiologique,
    required List<dynamic>? imagerieList,
  }) onSaved;
  final Patient? patient;
  @override
  State<NewPatientForm> createState() => _NewPatientFormState();
}

class _NewPatientFormState extends State<NewPatientForm> {
  late final _formKey = GlobalKey<FormState>();
  late String id = '';
  late String? nom = '';
  late String? prenom = '';
  late int? age = 0;
  late int sixe = 0;
  late bool hommeBool = false;
  late bool femmeBool = false;
  late String antecedentsMedicauxString;
  late List<dynamic>? antecedentsMedicaux = [];
  late List<String> antecedentsMedicauxListNameKey =
      antecedentsMedicauxListName;
  late Map<String, List<String>> antecedentsMedicauxList =
      antecedentsMedicauxMap;
  late String antecedentsChirurgicauxString;
  late List<dynamic>? antecedentsChirurgicaux = [];
  late String signeFonctionnelString;
  late List<dynamic>? signeFonctionnelList = [];
  late Map? signeFonctionnel = {};
  late String examenCliniqueString;
  late List<dynamic>? examenCliniqueList = [];
  late Map? examenClinique = {};
  late String examenBiologiqueString;
  late Map? examenBiologique = {};
  late List<dynamic>? examenBiologiqueList = [];
  late DateTime signeFonctionnelDate = DateTime.now();
  late DateTime examenCliniqueDate = DateTime.now();
  late DateTime examenBiologiqueDate = DateTime.now();
  late DateTime imagerieDate = DateTime.now();
  late List<dynamic>? imagerieList = [];
  late List<dynamic>? imagerie = [];
  late String imagerieString;
  late String typeImagerie;

  @override
  void initState() {
    if (widget.patient != null) {
      id = widget.patient!.id;
      nom = widget.patient!.nom;
      prenom = widget.patient!.prenom;
      age = widget.patient!.age;
      sixe = widget.patient!.sixe;
      if (sixe == 2) {
        hommeBool = true;
      } else if (sixe == 1) {
        femmeBool = true;
      }
      antecedentsMedicaux = widget.patient!.antecedentsMedicaux;
      antecedentsChirurgicaux = widget.patient!.antecedentsChirurgicaux;
      signeFonctionnel = widget.patient!.signeFonctionnel;
      if (signeFonctionnel!.isNotEmpty) {
        signeFonctionnelDate = signeFonctionnel!['date'].toDate();
        signeFonctionnelList = signeFonctionnel!['list'];
      }
      examenClinique = widget.patient!.examenClinique;
      if (examenClinique!.isNotEmpty) {
        examenCliniqueDate = examenClinique!['date'].toDate();
        examenCliniqueList = examenClinique!['list'];
      }
      examenBiologique = widget.patient!.examenBiologique;
      if (examenBiologique!.isNotEmpty) {
        examenBiologiqueDate = examenBiologique!['date'].toDate();
        examenBiologiqueList = examenBiologique!['list'];
      }
      imagerieList = widget.patient!.imagerie;
    }
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
                      const BuildTitle(title: 'Ajoute un nouveau patient'),
                      if (widget.patient != null)
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AddConsigneScreen(patient: widget.patient);
                            }));
                          },
                          child: const Text('Voir les consignes'),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: CustomTextForm(
                          title: 'Nom:',
                          initialValue: nom,
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            nom = value;
                          },
                          validator: (String? value) {
                            // if (value!.isEmpty) {
                            //   return invalidNameError;
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
                          initialValue: prenom,
                          textInputAction: TextInputAction.done,
                          onChanged: (var value) {
                            prenom = value;
                          },
                          validator: (String? value) {
                            // if (value!.isEmpty) {
                            //   return invalidPrenomError;
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
                          initialValue: age.toString(),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          onChanged: (var value) {
                            age = int.parse(value);
                          },
                          validator: (String? value) {
                            // if (value!.isEmpty) {
                            //   return invalidAgeError;
                            // } else
                            // if (!Validators.isValidNumber(value)) {
                            //   return invalidAgeTypeError;
                            // }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const BuildTitleInfo(text: 'Sixe:'),
                      CheckboxListTile(
                        title: const Text('Homme'),
                        value: hommeBool,
                        onChanged: (value) {
                          setState(() {
                            hommeBool = value!;
                            femmeBool = false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: const Text('Femme'),
                        value: femmeBool,
                        onChanged: (value) {
                          setState(() {
                            femmeBool = value!;
                            hommeBool = false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const BuildTitleInfo(text: 'Antécédents medicaux:'),
                      if (antecedentsMedicaux!.isNotEmpty)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showAM(context).then((value) => setState(() {}));
                            },
                            child: const BuildButtomInfo(title: 'CHOISIR'),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                if (antecedentsMedicauxString != '') {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  antecedentsMedicaux!
                                      .add(antecedentsMedicauxString);
                                  antecedentsMedicauxString = '';
                                }
                              });
                            },
                            child: const BuildButtomInfo(title: 'ENVOYER'),
                          ),
                        ],
                      ),
                      const BuildTitleInfo(text: 'Antécédents chirurgicaux:'),
                      if (antecedentsChirurgicaux!.isNotEmpty)
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
                              antecedentsChirurgicaux!
                                  .add(antecedentsChirurgicauxString);
                              antecedentsChirurgicauxString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(title: 'ENVOYER'),
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
                      if (signeFonctionnelList!.isNotEmpty)
                        BuildListInfo(
                          listInfo: signeFonctionnelList,
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
                              signeFonctionnelList!.add(signeFonctionnelString);
                              signeFonctionnelString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(title: 'ENVOYER'),
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
                      if (examenCliniqueList!.isNotEmpty)
                        BuildListInfo(
                          listInfo: examenCliniqueList,
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
                              examenCliniqueList!.add(examenCliniqueString);
                              examenCliniqueString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(title: 'ENVOYER'),
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
                      if (examenBiologiqueList!.isNotEmpty)
                        BuildListInfo(
                          listInfo: examenBiologiqueList,
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
                              examenBiologiqueList!.add(examenBiologiqueString);
                              examenBiologiqueString = '';
                            }
                          });
                        },
                        child: const BuildButtomInfo(title: 'ENVOYER'),
                      ),
                      const BuildTitleInfo(text: 'Imagerie:'),
                      if (imagerieList!.isNotEmpty)
                        BuildImagerieList(imagerie: imagerieList),
                      CustomDropDown(
                        fillColor: Colors.white70,
                        title: 'Type',
                        hint: 'Type d\'imagerie',
                        validator: (String? value) {
                          return null;
                        },
                        onChanged: (String? value) {
                          if (value == null) {
                          } else {
                            typeImagerie = value;
                          }
                        },
                      ),
                      BuildDateInfo(
                        date: imagerieDate,
                        fct: (DateTime date) {
                          setState(() {
                            imagerieDate = date;
                          });
                        },
                      ),
                      if (imagerie!.isNotEmpty)
                        BuildListInfo(
                          listInfo: imagerie,
                        ),
                      SizedBox(
                        child: CustomTextForm(
                          title: '',
                          textInputAction: TextInputAction.done,
                          suffix: IconButton(
                              onPressed: () {
                                if (typeImagerie != '') {
                                  if (imagerieString != '') {
                                    imagerie!.add(imagerieString);
                                    imagerieString = '';
                                  }
                                  setState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez sélectionner type d\'imagerie')));
                                }
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.blue,
                              )),
                          onChanged: (var value) {
                            imagerieString = value;
                          },
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final String result = await Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ImageToText();
                              }));
                              imagerie!.add(result);

                              setState(() {});
                            },
                            child: const BuildButtomInfo(title: 'IMAGE'),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (typeImagerie != '' && imagerie!.isNotEmpty) {
                                Map data = {
                                  'typeImagerie': typeImagerie,
                                  'imagerieDate': imagerieDate,
                                  'imagerie': imagerie,
                                };
                                imagerieList!.add(data);
                                typeImagerie = '';
                                imagerieDate = DateTime.now();
                                imagerie = [];

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Données sont enregistrée, Vous pouvez entre d\'autres données d\'imagerie')));
                              } else {
                                if (typeImagerie == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez sélectionner type d\'imagerie')));
                                }
                                if (imagerie!.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez ajoute une conclusion')));
                                }
                              }
                              setState(() {});
                            },
                            child: const BuildButtomInfo(title: 'ENVOYER'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtomMedia(
                        press: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            if (signeFonctionnelList!.isNotEmpty) {
                              signeFonctionnel = {
                                'date': signeFonctionnelDate,
                                'list': signeFonctionnelList
                              };
                            } else {
                              signeFonctionnel = {};
                            }
                            if (examenCliniqueList!.isNotEmpty) {
                              examenClinique = {
                                'date': examenCliniqueDate,
                                'list': examenCliniqueList
                              };
                            } else {
                              examenClinique = {};
                            }
                            if (examenBiologiqueList!.isNotEmpty) {
                              examenBiologique = {
                                'date': examenBiologiqueDate,
                                'list': examenBiologiqueList
                              };
                            } else {
                              examenBiologique = {};
                            }
                            if (imagerieList!.isEmpty) {}
                            if (hommeBool) {
                              sixe = 2;
                            }
                            if (femmeBool) {
                              sixe = 1;
                            }

                            if (nom != '' ||
                                prenom != '' ||
                                age != 0 ||
                                antecedentsMedicaux!.isNotEmpty ||
                                antecedentsChirurgicaux!.isNotEmpty ||
                                signeFonctionnelList!.isNotEmpty ||
                                examenBiologiqueList!.isNotEmpty ||
                                examenCliniqueList!.isNotEmpty ||
                                imagerieList!.isNotEmpty) {
                              widget.onSaved(
                                id: id,
                                nom: nom ?? nom,
                                prenom: prenom ?? prenom,
                                age: age ?? age,
                                sixe: sixe,
                                antecedentsMedicaux:
                                    antecedentsMedicaux ?? antecedentsMedicaux,
                                antecedentsChirurgicaux:
                                    antecedentsChirurgicaux ??
                                        antecedentsChirurgicaux,
                                signeFonctionnel:
                                    signeFonctionnel ?? signeFonctionnel,
                                examenClinique:
                                    examenClinique ?? examenClinique,
                                examenBiologique:
                                    examenBiologique ?? examenBiologique,
                                imagerieList: imagerieList ?? imagerieList,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Veullez au moins remplire une case',
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
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

  Future<dynamic> showAM(BuildContext context) {
    var expanded = false;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              scrollable: true,
              title: const Text('Antécédents medicaux:'),
              content: AnimatedContainer(
                // height: double.maxFinite,
                width: double.maxFinite,
                height: double.maxFinite,
                duration: const Duration(milliseconds: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: antecedentsMedicauxListNameKey.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String antecedentsMedicauxName =
                                antecedentsMedicauxListNameKey[index];

                            return Column(
                              children: [
                                ListTile(
                                  title: Text(antecedentsMedicauxName),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        expanded = !expanded;
                                      });
                                    },
                                    icon: Icon(expanded
                                        ? Icons.expand_less
                                        : Icons.expand_more),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 4),
                                  height: expanded
                                      ? antecedentsMedicauxList[
                                                      antecedentsMedicauxName]!
                                                  .length !=
                                              1
                                          ? min(
                                              antecedentsMedicauxList[
                                                              antecedentsMedicauxName]!
                                                          .length *
                                                      70.0 +
                                                  180,
                                              118)
                                          : min(
                                              antecedentsMedicauxList[
                                                              antecedentsMedicauxName]!
                                                          .length *
                                                      20.0 +
                                                  120,
                                              85)
                                      : 0,
                                  child: ListView.builder(
                                    itemCount: antecedentsMedicauxList[
                                            antecedentsMedicauxName]!
                                        .length,
                                    itemBuilder: (_, index) {
                                      final String antecedentsMedicauxListName =
                                          antecedentsMedicauxList[
                                              antecedentsMedicauxName]![index];
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (!antecedentsMedicaux!.contains(
                                                    antecedentsMedicauxListName)) {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                  antecedentsMedicaux!.add(
                                                      antecedentsMedicauxListName);
                                                }
                                              });
                                            },
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.60,
                                              child: Text(
                                                antecedentsMedicauxListName,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
