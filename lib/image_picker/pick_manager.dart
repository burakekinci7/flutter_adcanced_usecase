import 'package:app_settings/app_settings.dart';
import 'package:flutter_adcanced_usecase/image_picker/image_picker_class.dart';
import 'package:flutter_adcanced_usecase/image_picker/permission_check.dart';
import 'package:image_picker/image_picker.dart';

abstract class IPickManager {
  final IPermissionCheck permissionCheck = ApplicationPermission();
  final IPickerImage pickerImage = ImagePickerClass();

  Future<PickImageModel?> fetchMediaImage();
  Future<PickImageModel?> fetchCameraImage();
}

class PickManager extends IPickManager {
  /// Photos Library manager
  @override
  Future<PickImageModel?> fetchMediaImage() async {
    if (!await permissionCheck.chechkMediaLibrary()) {
      await AppSettings.openAppSettings();
      return PickImageModel(null);
    }
    final model = await pickerImage.pickImageGallery();
    return PickImageModel(model, status: true);
  }

  /// Camera manger
  @override
  Future<PickImageModel?> fetchCameraImage() async {
    if (!await permissionCheck.chechkCameraLibrary()) {
      await AppSettings.openAppSettings();
      return PickImageModel(null);
    }
    final model = await pickerImage.pickImageCamera();

    return PickImageModel(model, status: true);
  }
}

class PickImageModel {
  final XFile? file;
  final bool status;

  PickImageModel(this.file, {this.status = false});
}
