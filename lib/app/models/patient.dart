class Patient {
  Patient({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.sixe,
    required this.room,
    required this.antecedentsMedicaux,
    required this.antecedentsChirurgicaux,
    required this.signeFonctionnel,
    required this.examenClinique,
    required this.examenBiologique,
    required this.imagerie,
    required this.consigne,
  });

  final String id;
  final String? room;
  final String? nom;
  final String? prenom;
  final int? age;
  final int sixe;
  final List<dynamic>? antecedentsMedicaux;
  final List<dynamic>? antecedentsChirurgicaux;
  final Map? signeFonctionnel;
  final Map? examenClinique;
  final Map? examenBiologique;
  final List<dynamic>? imagerie;
  final List<dynamic>? consigne;

  factory Patient.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String? room = data['room'] as String?;
    final String? nom = data['nom'] as String?;
    final String? prenom = data['prenom'] as String?;
    final int? age = data['age'] as int?;
    final int sixe = data['sixe'] as int;
    final List<dynamic>? antecedentsMedicaux =
        data['antecedentsMedicaux'] as List<dynamic>?;
    final List<dynamic>? antecedentsChirurgicaux =
        data['antecedentsChirurgicaux'] as List<dynamic>?;
    final Map? signeFonctionnel = data['signeFonctionnel'] as Map?;
    final Map? examenClinique = data['examenClinique'] as Map?;
    final Map? examenBiologique = data['examenBiologique'] as Map?;
    final List<dynamic>? imagerie = data['imagerie'] as List<dynamic>?;
    final List<dynamic>? consigne = data['consigne'] as List<dynamic>?;

    return Patient(
      id: id,
      age: age,
      signeFonctionnel: signeFonctionnel,
      antecedentsChirurgicaux: antecedentsChirurgicaux,
      antecedentsMedicaux: antecedentsMedicaux,
      nom: nom,
      sixe: sixe,
      examenClinique: examenClinique,
      imagerie: imagerie,
      examenBiologique: examenBiologique,
      prenom: prenom,
      room: room,
      consigne: consigne,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "age": age,
      "signeFonctionnel": signeFonctionnel,
      "antecedentsChirurgicaux": antecedentsChirurgicaux,
      "antecedentsMedicaux": antecedentsMedicaux,
      "sixe": sixe,
      "nom": nom,
      "examenClinique": examenClinique,
      "imagerie": imagerie,
      "examenBiologique": examenBiologique,
      "prenom": prenom,
      "room": room,
      'consigne': consigne,
    };
  }
}
