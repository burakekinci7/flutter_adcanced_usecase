import 'package:image_picker/image_picker.dart';

abstract class IPickerImage {
  Future<XFile?> pickImageGallery();
  Future<XFile?> pickImageCamera();
}

class ImagePickerClass implements IPickerImage {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<XFile?> pickImageGallery() {
    return _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Future<XFile?> pickImageCamera() {
    return _picker.pickImage(source: ImageSource.camera);
  }
}
