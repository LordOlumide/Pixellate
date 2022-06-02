import 'package:permission_handler/permission_handler.dart';

// I suspect permission checking is not necessary.
checkForStoragePermission() async {
  PermissionStatus permissionStatus = await Permission.storage.status;
  if (permissionStatus != PermissionStatus.granted) {
    await Permission.storage.request().isGranted;
  }
}
