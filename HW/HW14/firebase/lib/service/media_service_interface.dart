import 'dart:io';

import 'package:firebase/service/service.dart';
import 'package:flutter/cupertino.dart';

// Created our own enum to prevent an abstract interface
// from having a dependency on an external package
enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaServiceInterface {
  PermissionService get permissionService;

  Future<File?> uploadImage(
    BuildContext context,
    AppImageSource appImageSource, {
    bool shouldCompress = true,
  });

  Future<File?> compressFile(File file, {int quality = 30});
}
