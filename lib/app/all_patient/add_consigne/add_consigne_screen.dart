import 'package:dawini/app/all_patient/add_consigne/add_consigne_bloc.dart';
import 'package:dawini/app/all_patient/add_consigne/add_consigne_form.dart';
import 'package:dawini/app/models/patient.dart';
import 'package:dawini/app/new_patient/new_patient_bloc.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddConsigneScreen extends StatefulWidget {
  final Patient? patient;
  const AddConsigneScreen({
    Key? key,
    this.patient,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddConsigneScreenState createState() => _AddConsigneScreenState();
}

class _AddConsigneScreenState extends State<AddConsigneScreen> {
  late final PageController _pageController;

  late final AddConsigneBloc bloc;

  @override
  void initState() {
    _pageController = PageController();
    final Database database = context.read<Database>();
    bloc = AddConsigneBloc(
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
      bloc.addConsignePatient(patient).then((value) {
        Fluttertoast.showToast(
          msg: 'La consigne est enregistre avec succès',
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
          AddConsigneForm(
            patient: widget.patient!.consigne,
            onSaved: ({
              required List<dynamic>? consigneList,
            }) {
              consigneList = consigneList;
              Patient patient = Patient(
                age: widget.patient!.age,
                antecedentsChirurgicaux:
                    widget.patient!.antecedentsChirurgicaux,
                room: widget.patient!.room,
                id: widget.patient!.id,
                bed: widget.patient!.bed,
                sixe: widget.patient!.sixe,
                examenBiologique: widget.patient!.examenBiologique,
                examenClinique: widget.patient!.examenClinique,
                antecedentsMedicaux: widget.patient!.antecedentsMedicaux,
                imagerie: widget.patient!.imagerie,
                nom: widget.patient!.nom,
                prenom: widget.patient!.prenom,
                signeFonctionnel: widget.patient!.signeFonctionnel,
                consigne: consigneList,
              );
              sendInfo(patient);
            },
          ),
        ],
      ),
    );
  }
}
