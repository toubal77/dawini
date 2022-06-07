class Patient {
  Patient({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.room,
    required this.bed,
    required this.antecedentsMedicaux,
    required this.antecedentsChirurgicaux,
    required this.signeFonctionnel,
    required this.examenClinique,
    required this.examenBiologique,
    required this.imagerie,
  });

  final String id;
  final String room;
  final String bed;
  final String nom;
  final String prenom;
  final int age;
  final List<String>? antecedentsMedicaux;
  final List<String>? antecedentsChirurgicaux;
  final List<dynamic>? signeFonctionnel;
  final List<dynamic>? examenClinique;
  final List<dynamic>? examenBiologique;
  final List imagerie;

  factory Patient.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String room = data['romm'] as String;
    final String bed = data['bed'] as String;
    final String nom = data['nom'] as String;
    final String prenom = data['prenom'] as String;
    final int age = data['age'] as int;
    final List<String>? antecedentsMedicaux =
        data['antecedentsMedicaux'] as List<String>?;
    final List<String>? antecedentsChirurgicaux =
        data['antecedentsChirurgicaux'] as List<String>?;
    final List<dynamic>? signeFonctionnel =
        data['signeFonctionnel'] as List<dynamic>?;
    final List<dynamic>? examenClinique =
        data['examenClinique'] as List<dynamic>?;
    final List<dynamic>? examenBiologique =
        data['examenBiologique'] as List<dynamic>?;
    final List imagerie = data['imagerie'] as List;

    return Patient(
      id: id,
      age: age,
      signeFonctionnel: signeFonctionnel,
      antecedentsChirurgicaux: antecedentsChirurgicaux,
      antecedentsMedicaux: antecedentsMedicaux,
      bed: bed,
      nom: nom,
      examenClinique: examenClinique,
      imagerie: imagerie,
      examenBiologique: examenBiologique,
      prenom: prenom,
      room: room,
    );
  }

  // factory Patient.fromMap2(Map<String, dynamic> data, String documentId) {
  //   final int type = data['type'] as int;
  //   if (type == 0) {
  //     return Restaurent.fromMap(data, documentId);
  //   }
  //   return Patient.fromMap(data, documentId);
  // }

  Map<String, dynamic> toMap() {
    return {
      "age": age,
      "signeFonctionnel": signeFonctionnel,
      "antecedentsChirurgicaux": antecedentsChirurgicaux,
      "antecedentsMedicaux": antecedentsMedicaux,
      "bed": bed,
      "nom": nom,
      "examenClinique": examenClinique,
      "imagerie": imagerie,
      "examenBiologique": examenBiologique,
      "prenom": prenom,
      "room": room,
    };
  }
}
