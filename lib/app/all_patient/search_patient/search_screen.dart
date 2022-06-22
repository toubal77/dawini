import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawini/app/all_patient/add_consigne/add_consigne_screen.dart';
import 'package:dawini/app/all_patient/all_patients_bloc.dart';
import 'package:dawini/app/models/patient.dart';
import 'package:dawini/app/new_patient/new_patient_screen.dart';
import 'package:dawini/common_widgets/empty_content.dart';
import 'package:dawini/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DataSearch extends SearchDelegate<String> {
  Stream<List<Patient>?> allPatientSearch;
  final AllPatientsBloc bloc;
  DataSearch({required this.allPatientSearch, required this.bloc});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, 'value');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildResult(context);
  @override
  Widget buildSuggestions(BuildContext context) => buildResult(context);

  Widget buildResult(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: query.isEmpty
            ? Center(
                child: Container(
                  width: 250.w,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Effectue la recherche avec le nom de famille ou la chambre / lit',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : StreamBuilder<List<Patient>?>(
                stream: allPatientSearch,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    List<Patient> patients = snapshot.data!;
                    List<Patient> patientsSearch = [];
                    // allPatients = patients;
                    // if (widget.scanneQR) {
                    //   onQRViewCreated(patients);
                    // }
                    if (query.isNotEmpty) {
                      for (var i = 0; i < patients.length; i++) {
                        if (patients[i].nom!.isNotEmpty) {
                          if (patients[i].nom!.startsWith(query)) {
                            patientsSearch.add(patients[i]);
                          }
                        } else if ((patients[i].prenom!.isNotEmpty)) {
                          if (patients[i].prenom!.startsWith(query)) {
                            patientsSearch.add(patients[i]);
                          }
                        }
                        if (query.startsWith('ch')) {
                          if (patients[i].room!.startsWith(query)) {
                            patientsSearch.add(patients[i]);
                          }
                        }
                      }
                    } else {
                      patientsSearch = patients;
                    }
                    return DataTable(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      columns: columnTableList,
                      rows: patientsSearch
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
                                DataCell(Text(player.diagnostic!)),
                                DataCell(player.sixe != 0
                                    ? player.sixe == 2
                                        ? const Icon(Icons.man,
                                            color: Colors.blue)
                                        : const Icon(Icons.woman,
                                            color: Colors.pink)
                                    : const Text('null')),
                                DataCell(Text(player.age.toString())),
                                DataCell(
                                  IconButton(
                                    onPressed: () {
                                      bloc.removePatient(player);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
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
    );
  }
}
