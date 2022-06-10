import 'package:dawini/app/models/patient.dart';
import 'package:dawini/services/api_path.dart';
import 'package:dawini/services/database.dart';

class AddConsigneBloc {
  AddConsigneBloc({
    required this.database,
  });

  final Database database;

  Future<void> addConsignePatient(Patient patient) async {
    await database.setData(
      path: APIPath.newPatientDocument(patient.id),
      data: patient.toMap(),
      merge: false,
    );
  }
}
