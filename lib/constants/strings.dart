import 'package:flutter/material.dart';

const String localUserInfoKey = 'userInfo';
const String wrongNameError = '';
const String invalidPrenomError = 'Ce champ est obligatoire';
const String invalidNameError = 'Ce champ est obligatoire';
const String invalidAgeError = 'Ce champ est obligatoire';
const String invalidAgeTypeError = 'Ce champ doit etre numerique';
const String invalidPhoneNumberError = '';
const String invalidVerificationCodeError = '';
const String invalidActivityError = '';
const String invalidClubMembersError = '';
const String invalidEmailError = '';
const String invalidTypeImagerieError = 'Invalide type d\'imagerie';
const String invalidClubActivitiesError = '';
const String internetError =
    'pas de connexion Internet, assurez-vous que le wifi ou les données mobiles sont activés et réessayez';
const List<String> imagerieTypeList = ['a', 'b', 'c'];
const Map<String, List<dynamic>> imagerieTypeMap = {
  'a': [],
  'b': [],
  'c': [],
};
const List<DataColumn> columnTableList = [
  DataColumn(
    label: Text('Chambre',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  DataColumn(
    label: Text('Lit',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  DataColumn(
    label: Text('Nom',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  DataColumn(
    label: Text('Prenom',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  DataColumn(
    label: Text('Sixe',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  DataColumn(
    label: Text('Age',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
];
const List<String> antecedentsMedicauxListName = [
  'Maladies cardiovasculaires',
  'Cancers',
  'Maladies endocriniennes et ORL',
  'Maladies digestives',
  'Maladies rhumatologiques',
  'Maladies neurilogiques et musculaires',
  'Maladies gynécologiques, urinaires ou rénales',
  'Maladies de la peau',
  'Maladies des yeux',
  'Maladies hématologiques'
];
const Map<String, List<String>> antecedentsMedicauxMap = {
  'Maladies cardiovasculaires': [
    'hypertension artérielle',
    'infractus du myocarde',
    'angine de poitrine',
    'insuffisance cardiaque',
    'phlébite',
    'embolie pulmonaire',
    'hypercholeshtérolémie',
    'troubles du rythme cardiaque',
    'valvulopathie'
  ],
  'Cancers': [
    'cancers du cerveau',
    'cancer du col de l\'utérus',
    'cancer du colon',
    'cancer de l\'estomac',
    'cancer du foie',
    'cancer des os',
    'cancer du poumon',
    'cancer du rein',
    'cancer du sein',
    'cancer de la thyroide'
  ],
  'Maladies endocriniennes et ORL': [
    'asthme',
    'bronchite chronique',
    'emphysème',
    'apnée chronique',
    'sinusite chronique'
  ],
  'Maladies digestives': [
    'ulcère gastro duodénal',
    'gastrite chronique',
    'reflux gastro oesophagien',
    'colon irritable',
    'maladie coeliaque',
    'rectocolite hémorragique',
    'cirrhose'
  ],
  'Maladies rhumatologiques': [
    'arthrose',
    'hernie discale',
    'sciatique',
    'lombalgie',
    'tendinite chronique',
    'ostéoporose',
    'scoliose'
  ],
  'Maladies neurilogiques et musculaires': [
    'sclérose en plaques',
    'céphalées chroniques',
    'épulepsie',
    'maladie d\'alzheimer',
    'démence',
    'algie vasculaire de la face',
    'accident vasculaire cérébral'
  ],
  'Maladies gynécologiques, urinaires ou rénales': [
    'endometriose',
    'insuffisance rénale',
    'incontinence urinaire',
    'fibrome utérin',
    'kyste ovarien',
    'trouble de la fertilité',
    'adénome de la prostate',
    'calculs rénaux',
    'trouble érectile'
  ],
  'Maladies de la peau': [
    'acné',
    'eczéma',
    'urticaire',
    'psoriasis',
    'vitiligo',
    'zona',
    'herpès'
  ],
  'Maladies des yeux': [
    'glaucome',
    'cataracte',
    'rétinopathie',
    'troubles de la vision'
  ],
  'Maladies hématologiques': ['leucémie', 'lymphome', 'déficit imminitaire']
};
