// ignore: avoid_classes_with_only_static_members
class APIPath {
  static String newPatientDocument(String uid) => 'patient/$uid/';
  static String newPatientCollection() => 'patient';
}
