import 'package:dawini/app/new_patient/new_patient_screen.dart';
import 'package:dawini/common_widgets/custom_elevated_button.dart';
import 'package:dawini/constants/app_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
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
              onPressed: () {},
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
                      return const NewPatientScreen();
                    },
                  ),
                );
              },
              minHeight: 35,
              minWidth: 200,
            ),
          ],
        ),
      ),
    );
  }
}
