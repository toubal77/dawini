import 'package:dawini/common_widgets/custom_text_field.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageToText> createState() => _AddCarouselSliderState();
}

class _AddCarouselSliderState extends State<ImageToText> {
  String? profilePictures;
  late String profilePictureUrl;
  late String result = '';
  late bool clickClear = false;
  getTextFromImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final RecognizedText recogniseText =
        await GoogleMlKit.vision.textRecognizer().processImage(inputImage);

    result = '';
    setState(() {
      for (TextBlock block in recogniseText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            result += ("${element.text} ");
          }
        }
        result += "\n";
      }
    });

    // ignore: avoid_print
    print('image to text: $result');
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 480, maxWidth: 480);
    if (image != null) {
      setState(() {
        getTextFromImage(image);
      });
    }
  }

  Future<void> sendCarouselSliderInfo() async {
    try {
      if (result != '') {
        Navigator.pop(context, result);
      } else {
        Navigator.pop(context, 'null');
      }
    } on Exception catch (e) {
      PlatformExceptionAlertDialog(exception: e).show(context);
    }
  }

  Widget buildUploadButton() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 5.0,
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: pickImage,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          minimumSize: MaterialStateProperty.all(const Size(200, 70)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Télécharger des images',
              style: TextStyle(
                color: Color.fromRGBO(51, 77, 115, 0.88),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(
                Icons.file_upload,
                color: Color.fromRGBO(51, 77, 115, 0.95),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          result != ''
              ? Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, left: 20, right: 20),
                  child: SizedBox(
                    child: CustomTextForm(
                      title:
                          'Si aucune modification est envisagé clique sur suivant',
                      initialValue: result,
                      textInputAction: TextInputAction.done,
                      lines: 10,
                      onChanged: (var value) {
                        result = value;
                      },
                      validator: (String? value) {
                        return null;
                      },
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 20, right: 20),
                  child: Text(
                    "Veuillez choisir une image horizontale ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(34, 50, 99, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
          if (result == '' && !clickClear) Align(child: buildUploadButton()),
          if (result != '' || clickClear)
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 20),
                    child: TextButton(
                      onPressed: sendCarouselSliderInfo,
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff5383EC),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Suivant',
                        style: TextStyle(
                          color: Color(0xffFCFCFC),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          result = '';
                        });
                        pickImage();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff5383EC),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Prendre une photo',
                        style: TextStyle(
                          color: Color(0xffFCFCFC),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
