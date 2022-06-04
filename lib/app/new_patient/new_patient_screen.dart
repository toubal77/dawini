import 'package:dawini/app/new_patient/new_patient_form.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:flutter/material.dart';

class NewPatientScreen extends StatefulWidget {
  const NewPatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewPatientScreenState createState() => _NewPatientScreenState();
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  late final PageController _pageController;

  late String nom = '';
  late String prenom = '';
  late int age;
  late List<String> antecedentsMedicaux = [];
  late List<String> antecedentsChirurgicaux = [];
  late List<String> signeFonctionnel = [];
  late List<String> examenClinique = [];
  late List<String> examenBiologique = [];

  @override
  void initState() {
    _pageController = PageController();

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

  Future<void> sendInfo() async {
    try {} on Exception catch (e) {
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
            onSaved: ({
              required String nom,
              required String prenom,
              required int age,
              required List<String> antecedentsMedicaux,
              required List<String> antecedentsChirurgicaux,
              required List<String> signeFonctionnel,
              required List<String> examenClinique,
              required List<String> examenBiologique,
            }) {
              nom = nom;
              prenom = prenom;
              age = age;
              antecedentsMedicaux = antecedentsMedicaux;
              antecedentsChirurgicaux = antecedentsChirurgicaux;
              signeFonctionnel = signeFonctionnel;
              examenClinique = examenClinique;
              examenBiologique = examenBiologique;
              //    swipePage(1);
              sendInfo();
            },
          ),
        ],
      ),
    );
  }
}
