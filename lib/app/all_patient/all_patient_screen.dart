import 'package:dawini/app/all_patient/all_patients_bloc.dart';
import 'package:dawini/app/models/patient.dart';
import 'package:dawini/common_widgets/empty_content.dart';
import 'package:dawini/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPatientScreen extends StatefulWidget {
  const AllPatientScreen({Key? key}) : super(key: key);

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
                  print('rani baghi affichi');
                  return DataTable(
                    columns: [
                      const DataColumn(
                        label: Text('Chambre',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const DataColumn(
                        label: const Text('Lit',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const DataColumn(
                        label: const Text('Nom',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const DataColumn(
                        label: const Text('Prenom',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const DataColumn(
                        label: Text('Sixe',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const DataColumn(
                        label: const Text('Age',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: patients
                        .map(
                          (player) => DataRow(
                            cells: [
                              DataCell(Text(player.room!)),
                              DataCell(Text(player.bed!)),
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