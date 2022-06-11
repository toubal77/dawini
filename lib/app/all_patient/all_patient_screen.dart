import 'package:dawini/app/all_patient/add_consigne/add_consigne_screen.dart';
import 'package:dawini/app/all_patient/all_patients_bloc.dart';
import 'package:dawini/app/models/patient.dart';
import 'package:dawini/app/new_patient/new_patient_screen.dart';
import 'package:dawini/common_widgets/empty_content.dart';
import 'package:dawini/common_widgets/platform_alert_dialog.dart';
import 'package:dawini/constants/strings.dart';
import 'package:dawini/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AllPatientScreen extends StatefulWidget {
  final bool scanneQR;
  const AllPatientScreen({Key? key, required this.scanneQR}) : super(key: key);

  @override
  State<AllPatientScreen> createState() => _AllPatientScreenState();
}

class _AllPatientScreenState extends State<AllPatientScreen> {
  late final AllPatientsBloc bloc;
  late Stream<List<Patient>?> allPatient;
  @override
  void initState() {
    final Database database = context.read<Database>();
    bloc = AllPatientsBloc(
      database: database,
    );
    allPatient = bloc.getAllPatients();
    super.initState();
  }

  Future<void> onQRViewCreated() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print('this is a String scaned :$qrCode');
      if (qrCode.startsWith('tbl-')) {
        print('dgjo edgj  pdjg ${qrCode.substring(0, 4)}');
      } else {
        Fluttertoast.showToast(
          msg: 'CODE QR ne presente aucune donne valide',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } on PlatformAlertDialog {
      print('error scanQRcode: Failed to get platform version.');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tous les patients"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder<List<Patient>?>(
              stream: allPatient,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  List<Patient> patients = snapshot.data!;
                  if (widget.scanneQR) {
                    onQRViewCreated();
                  }
                  return DataTable(
                    columns: columnTableList,
                    rows: patients
                        .map(
                          (player) => DataRow(
                            onLongPress: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NewPatientScreen(patient: player);
                                  },
                                ),
                              );
                            },
                            cells: [
                              DataCell(IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AddConsigneScreen(
                                            patient: player);
                                      },
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              )),
                              DataCell(Text(player.room!)),
                              DataCell(Text(player.nom!)),
                              DataCell(Text(player.prenom!)),
                              DataCell(player.sixe != 0
                                  ? player.sixe == 2
                                      ? const Icon(Icons.man,
                                          color: Colors.blue)
                                      : const Icon(Icons.woman,
                                          color: Colors.pink)
                                  : const Text('null')),
                              DataCell(Text(player.age.toString())),
                            ],
                          ),
                        )
                        .toList(),
                  );
                } else if (!(snapshot.hasData && snapshot.data != null)) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: EmptyContent(
                      title: 'Aucune Données',
                      message: '',
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const EmptyContent(
                    title: "Quelque chose s'est mal passé",
                    message:
                        "Impossible de charger les éléments pour le moment",
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
