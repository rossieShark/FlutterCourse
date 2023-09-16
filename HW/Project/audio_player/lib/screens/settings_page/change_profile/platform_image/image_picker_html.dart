// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';

class ImagePickerService {
  Future<String?> pickImageFromGallery() async {
    final uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    final completer =
        Completer<String?>(); // Create a completer to handle the future result

    uploadInput.onChange.listen((event) async {
      final files = uploadInput.files;
      final file = files![0];
      final reader = FileReader();

      reader.onLoadEnd.listen((event) async {
        final bytesData = const Base64Decoder()
            .convert(reader.result.toString().split(",").last);

        final ref = FirebaseStorage.instance
            .ref()
            .child('userProfileImage')
            .child('${DateTime.now()}.jpg');

        try {
          await ref.putData(bytesData);
          final imageUrl = await ref.getDownloadURL();
          completer
              .complete(imageUrl); // Resolve the completer with the imageUrl
        } catch (e) {
          print('Error uploading image: $e');
          completer.completeError(e); // Reject the completer with an error
        }
      });

      reader.readAsDataUrl(file);
    });

    return completer.future; // Return the future from the completer
  }

  Future<String?> pickImageFromCamera() {
    // Implement camera image picking for web (if applicable)
    // This may involve using additional libraries or plugins
    return Future.value(null); // Placeholder
  }
}
