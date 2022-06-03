import 'package:dawini/app/new_patient/new_patient_form.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:flutter/material.dart';

class NewPatientScreen extends StatefulWidget {
  const NewPatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NewPatientScreenState createState() => _NewPatientScreenState();
}

class _NewPatientScreenState extends State<NewPatientScreen> {
  late final PageController _pageController;

  late String passwords;
  late String usernames;
  late String adressUser;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  void swipePage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> sendInfo() async {
    try {} on Exception catch (e) {
      PlatformExceptionAlertDialog(exception: e).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        if (_pageController.hasClients) {
          if (_pageController.page == 0) {
            return true;
          } else {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        }
        return false;
      },
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          NewPatientForm(
            onSaved: ({
              required String email,
              required String password,
            }) {
              usernames = email;
              passwords = password;
              //    swipePage(1);
              sendInfo();
            },
          ),
        ],
      ),
    );
  }
}
