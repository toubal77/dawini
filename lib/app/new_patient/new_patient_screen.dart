import 'package:dawini/app/models/patient.dart';
import 'package:dawini/app/new_patient/new_patient_bloc.dart';
import 'package:dawini/app/new_patient/new_patient_form.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NewPatientScreen extends StatefulWidget {
  final Patient? patient;
  const NewPatientScreen({
    Key? key,
    this.patient,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewPatientScreenState createState() => _NewPatientScreenState();
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  late final PageController _pageController;

  late final NewPatientBloc bloc;

  @override
  void initState() {
    _pageController = PageController();
    final Database database = context.read<Database>();
    bloc = NewPatientBloc(
      database: database,
    );

    super.initState();
  }

  void swipePage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> sendInfo(Patient patient) async {
    try {
      bloc.addNewPatient(patient).then((value) {
        Fluttertoast.showToast(
          msg: 'Le patient est enregistre avec succès',
          toastLength: Toast.LENGTH_LONG,
        );
        Navigator.of(context).pop();
      });
    } on Exception catch (e) {
      PlatformExceptionAlertDialog(exception: e).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        if (_pageController.hasClients) {
          if (_pageController.page == 0) {
            return true;
          } else {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        }
        return false;
      },
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          NewPatientForm(
            patient: widget.patient,
            onSaved: ({
              required String? nom,
              required String id,
              required String? prenom,
              required int? age,
              required int sixe,
              required List<dynamic>? antecedentsMedicaux,
              required List<dynamic>? antecedentsChirurgicaux,
              required Map? signeFonctionnel,
              required Map? examenClinique,
              required Map? examenBiologique,
              required List<dynamic>? imagerieList,
            }) {
              nom = nom;
              prenom = prenom;
              age = age;
              antecedentsMedicaux = antecedentsMedicaux;
              antecedentsChirurgicaux = antecedentsChirurgicaux;
              signeFonctionnel = signeFonctionnel;
              examenClinique = examenClinique;
              sixe = sixe;
              examenBiologique = examenBiologique;
              imagerieList = imagerieList;
              id = id;
              Patient patient = Patient(
                age: age,
                antecedentsChirurgicaux: antecedentsChirurgicaux,
                room: 'room',
                id: id,
                sixe: sixe,
                examenBiologique: examenBiologique,
                examenClinique: examenClinique,
                antecedentsMedicaux: antecedentsMedicaux,
                imagerie: imagerieList,
                nom: nom,
                prenom: prenom,
                signeFonctionnel: signeFonctionnel,
                consigne: [],
              );
              sendInfo(patient);
            },
          ),
        ],
      ),
    );
  }
}
