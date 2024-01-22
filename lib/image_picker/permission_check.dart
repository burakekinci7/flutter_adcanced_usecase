import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionCheck {
  Future<bool> chechkMediaLibrary();
  Future<bool> chechkCameraLibrary();
}

class ApplicationPermission implements IPermissionCheck {
  @override
  Future<bool> chechkMediaLibrary() async {
    final PermissionStatus status = await Permission.photos.status;
    //isDenied -> engellendi (tr)
    //isGranted -> izin verildi
    //isLimited -> sınırlı erisim
    return status.isGranted;
  }
  
  @override
  Future<bool> chechkCameraLibrary() async{
  final PermissionStatus status = await Permission.camera.status;
    //isDenied -> engellendi
    //isGranted -> izin verildi
    //isLimited -> sınırlı erisim
    return status.isGranted;
  }
}
