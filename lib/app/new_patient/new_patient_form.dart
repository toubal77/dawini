import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPatientForm extends StatefulWidget {
  const NewPatientForm({
    Key? key,
    required this.onSaved,
  }) : super(key: key);
  final void Function({
    required String email,
    required String password,
  }) onSaved;

  @override
  State<NewPatientForm> createState() => _NewPatientFormState();
}

class _NewPatientFormState extends State<NewPatientForm> {
  late final _formKey = GlobalKey<FormState>();
  bool pswVisible = false;
  late String email = '';
  late String password = '';

  Widget _buildFooter() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Vous n'avez pas de compte ?",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(41, 67, 107, 1.0),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     fullscreenDialog: true,
            //     builder: (context) {
            //       return SignUpScreen();
            //     },
            //   ),
            // );
          },
          child: const Text(
            'Créer un compte maintenant',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(64, 163, 219, 1.0),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   width: 130.w,
            //   height: 130.h,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(whiteLogo),
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              margin: const EdgeInsets.only(left: 24.95, right: 24.95),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 82.w,
                      height: 29.h,
                      child: const Text(
                        'Loging',
                        style: TextStyle(
                          color: Color(0xff181725),
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 233.w,
                      height: 30.h,
                      child: const Text(
                        'Entrez votre email et votre mot de passe',
                        style: TextStyle(
                          color: Color(0xff7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      child: CustomTextForm(
                        title: 'Username:',
                        textInputAction: TextInputAction.done,
                        onChanged: (var value) {
                          email = value;
                        },
                        validator: (String? value) {
                          // if (!Validators.isValidUsername(value)) {
                          //   return invalidUsernameSignInError;
                          // }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: CustomTextForm(
                        textInputType: TextInputType.visiblePassword,
                        title: 'Password:',
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        onChanged: (var value) {
                          password = value;
                        },
                        validator: (String? value) {
                          // if (!Validators.isValidPassword(value)) {
                          //   return invalidPasswordError;
                          // }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return ForgotPassScreen();
                        //     },
                        //   ),
                        // );
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 14.h,
                        child: const Text(
                          'Mot de passe oublié?',
                          style: TextStyle(
                            color: Color(0xff181725),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    ButtomMedia(
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onSaved(
                            email: email,
                            password: password,
                          );
                        }
                      },
                      color: const Color(0xff5383EC),
                      text: 'Suivant',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }
}
