import 'package:dawini/app/models/patient.dart';
import 'package:dawini/services/api_path.dart';
import 'package:dawini/services/database.dart';

class AllPatientsBloc {
  AllPatientsBloc({
    required this.database,
  });

  final Database database;
  Stream<List<Patient>> getAllPatients() {
    return database.streamCollection(
      path: APIPath.newPatientCollection(),
      builder: (data, documentId) => Patient.fromMap(data, documentId),
    );
  }
}