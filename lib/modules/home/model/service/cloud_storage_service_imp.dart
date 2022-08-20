import 'dart:io';

import 'package:cloud_storage/core/interface/service/cloud_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// This class is responsible for [uploadNewImage], [getStorageImagesUrl]
/// and [deleteImage] in cloud storage
class CloudStorageServiceImp implements ICloudStorageService {
  /// Returns a list of urls of images stored in the cloud storage
  @override
  Future<List<String>> getStorageImagesUrl() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    List<String> urlImages = [];

    final refs = await storage.ref("images/${auth.currentUser!.uid}").listAll();

    for (final ref in refs.items) {
      urlImages.add(await ref.getDownloadURL());
    }

    return urlImages;
  }

  /// Get all images url from storage of the current user
  @override
  Future uploadNewImage({required File file}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    String storageReference = 'images/${auth.currentUser!.uid}/'
        'image-${DateTime.now().millisecondsSinceEpoch}.jpg';

    await storage.ref(storageReference).putFile(file);
  }

  /// Deletes an image from the cloud storage by its url
  @override
  Future<void> deleteImage({required String urlImage}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final ref = storage.refFromURL(urlImage);
    await ref.delete();
  }
}
