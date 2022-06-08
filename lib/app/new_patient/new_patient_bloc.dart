import 'package:dawini/services/database.dart';
import 'package:uuid/uuid.dart';

class NewPatientBloc {
  NewPatientBloc({
    required this.database,
  });

  final Database database;
  final Uuid uuid = Uuid();
}
