import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawini/app/new_patient/widgets/buttom_media.dart';
import 'package:dawini/common_widgets/platform_exception_alert_dialog.dart';
import 'package:dawini/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:uuid/uuid.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageToText> createState() => _AddCarouselSliderState();
}

class _AddCarouselSliderState extends State<ImageToText> {
  // File? imageFile;
  // File? profilePicture;
  String? profilePictures;
  late String profilePictureUrl;
  late String result = '';
  getTextFromImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final RecognizedText recogniseText =
        await GoogleMlKit.vision.textRecognizer().processImage(inputImage);
    //  RecognizedText recogniseText = await textDetector.processImage(inputImage);
    //  await textDetector.close();
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
    print('image to text: $result');
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 480, maxWidth: 480);
    if (image != null) {
      // imageFile = File(image.path);
      // profilePicture = File(image.path);
      getTextFromImage(image);

      setState(() {});
    }
  }

  Future<void> sendCarouselSliderInfo() async {
    const Uuid uuid = Uuid();
    String carouselId = uuid.v4();

    // if (profilePicture != null) {
    //   profilePictureUrl = await carouselSliderBloc.uploadProductProfileImage(
    //     profilePicture!,
    //     carouselId,
    //   );
    // }
    try {
      final ProgressDialog pd = ProgressDialog(context: context);

      // final CarouselSlideModel carouselSlider = CarouselSlideModel(
      //   id: carouselId,
      //   pictureUrl: profilePictureUrl,
      //   createdBy: auth.currentUser()!.uid,
      //   createdAt: Timestamp.now(),
      // );
      //  await carouselSliderBloc.saveCarouselSliderInfo(carouselSlider);
      // Fluttertoast.showToast(
      //   msg: 'L\'image est passée avec succès',
      //   toastLength: Toast.LENGTH_LONG,
      // );
      pd.close();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
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

  Widget buildPhoto() {
    return GestureDetector(
      onTap: pickImage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            //  imageFile != null
            //     ? Image.memory(imageFile!.readAsBytesSync())
            //     :
            CachedNetworkImage(imageUrl: profilePictures!),
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
                  padding: EdgeInsets.only(top: 100.0, left: 20, right: 20),
                  child: Text(result),
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
          //  if (imageFile == null && profilePictures == null)
          Align(child: buildUploadButton()),

          //  if (!(imageFile == null && profilePictures == null))
          //    Align(child: SizedBox(child: buildPhoto())),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 20),
              child: ButtomMedia(
                press: sendCarouselSliderInfo,
                color: const Color(0xff5383EC),
                text: 'Suivant',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
