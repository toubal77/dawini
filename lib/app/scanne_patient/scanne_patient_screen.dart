import 'package:barcode_widget/barcode_widget.dart';
import 'package:dawini/app/all_patient/all_patient_screen.dart';

import 'package:dawini/app/scanne_patient/widgets/build_button_qr.dart';
import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerPatientScreen extends StatefulWidget {
  const ScannerPatientScreen({Key? key}) : super(key: key);

  @override
  State<ScannerPatientScreen> createState() => _ScannerPatientScreenState();
}

class _ScannerPatientScreenState extends State<ScannerPatientScreen> {
  late String? qrCodeText = '';
  late bool createdQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scanner ou cree un code QR"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          if (createdQR)
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              backgroundColor: Colors.white,
              data: qrCodeText!,
              width: 250.w,
              height: 250.h,
            ),
          if (createdQR)
            GestureDetector(
              onTap: () async {
                setState(() {
                  createdQR = false;
                });
              },
              child: const BuildButtonQR(title: 'GENERE UN AUTRE CODE QR'),
            ),
          if (!createdQR)
            SizedBox(
              child: CustomTextForm(
                title: 'Vuellez saisir la chambre et le lit a cree:',
                textInputAction: TextInputAction.done,
                hintText: 'Par exemple: ch237',
                onChanged: (var value) {
                  qrCodeText = value;
                },
                validator: (String? value) {
                  return null;
                },
              ),
            ),
          if (!createdQR)
            GestureDetector(
              onTap: () {
                if (qrCodeText != '') {
                  setState(() {
                    createdQR = true;
                  });
                }
              },
              child: const BuildButtonQR(title: 'GENERE UN CODE QR'),
            ),
          if (!createdQR)
            const SizedBox(
              height: 30,
            ),
          if (!createdQR)
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AllPatientScreen(
                    scanneQR: true,
                  );
                }));
              },
              child: const BuildButtonQR(title: 'SCANNE UN CODE QR'),
            ),
        ],
      ),
    );
  }
}
