import 'package:dawini/app/all_patient/all_patient_screen.dart';
import 'package:dawini/app/new_patient/new_patient_screen.dart';
import 'package:dawini/app/scanne_patient/scanne_patient_screen.dart';
import 'package:dawini/common_widgets/custom_elevated_button.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:dawini/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  buttonText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Ajoute un patient",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const NewPatientScreen();
                        },
                      ),
                    );
                  },
                  minHeight: 35,
                  minWidth: 200,
                ),
                CustomElevatedButton(
                  buttonText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Voir mes patients",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const AllPatientScreen(
                            scanneQR: false,
                          );
                        },
                      ),
                    );
                  },
                  minHeight: 35,
                  minWidth: 200,
                ),
                CustomElevatedButton(
                  buttonText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Scanner un patient",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const ScannerPatientScreen();
                        },
                      ),
                    );
                  },
                  minHeight: 35,
                  minWidth: 200,
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: SizeConfig.screenHeight * 0.15,
              left: SizeConfig.screenHeight * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: const Text(
                      'powerdBy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 216, 91, 91),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: const Text(
                      'Toubal Zine-eddine',
                      style: TextStyle(
                        color: Color.fromARGB(255, 216, 91, 91),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
