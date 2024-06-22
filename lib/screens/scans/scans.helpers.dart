import 'package:image_picker/image_picker.dart';

Future pickImageFromGallery() async {
  return await ImagePicker().pickImage(source: ImageSource.gallery);
}

Future pickImageFromCamera() async {
  return await ImagePicker().pickImage(source: ImageSource.camera);
}
