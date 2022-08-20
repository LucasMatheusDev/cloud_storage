import 'dart:io';

/// This class is responsible for [uploadNewImage], [getStorageImagesUrl]
/// and [deleteImage] in cloud storage
abstract class ICloudStorageService {
  
  Future uploadNewImage({required File file});


  Future getStorageImagesUrl();


  Future deleteImage({required String urlImage});
}
