import 'package:dawini/app/models/patient.dart';
import 'package:dawini/services/api_path.dart';
import 'package:dawini/services/database.dart';
import 'package:uuid/uuid.dart';

class NewPatientBloc {
  NewPatientBloc({
    required this.database,
  });

  final Database database;

  Future<void> addNewPatient(Patient patient) async {
    const Uuid uuid = Uuid();
    if (patient.id == '') {
      await database.setData(
        path: APIPath.newPatientDocument(uuid.v4()),
        data: patient.toMap(),
        merge: false,
      );
    } else {
      await database.setData(
        path: APIPath.newPatientDocument(patient.id),
        data: patient.toMap(),
        merge: false,
      );
    }
  }

  Future<void> updatePatientRoom(Patient patient) async {
    await database.updateData(
      path: APIPath.newPatientDocument(patient.id),
      data: {
        'room': 'room',
      },
    );
  }
}
