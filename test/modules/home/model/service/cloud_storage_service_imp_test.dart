import 'dart:io';

import 'package:cloud_storage/modules/home/model/service/cloud_storage_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cloud_storage_service_imp_test.mocks.dart';

@GenerateMocks([CloudStorageServiceImp])
void main() {
  group('cloud storage service', () {
    test('test upload file', () async {
      final MockCloudStorageServiceImp mockCloudStorageService =
          MockCloudStorageServiceImp();

      when(mockCloudStorageService.uploadNewImage(file: anyNamed('file')))
          .thenAnswer((_) async => true);

      await mockCloudStorageService.uploadNewImage(file: File('test'));

      verify(mockCloudStorageService.uploadNewImage(file: anyNamed('file')));
    });

    test('should delete image', () async {
      final MockCloudStorageServiceImp mockCloudStorageService =
          MockCloudStorageServiceImp();

      when(mockCloudStorageService.deleteImage(urlImage: "image"))
          .thenAnswer((_) async => true);

      await mockCloudStorageService.deleteImage(urlImage: "image");

      verify(mockCloudStorageService.deleteImage(urlImage: "image"));
    });

    test('should get storage images', () async {
      final images = List<String>.from(["image1", "image2", "image3"]);
      final MockCloudStorageServiceImp mockCloudStorageService =
          MockCloudStorageServiceImp();

      when(mockCloudStorageService.getStorageImagesUrl())
          .thenAnswer((_) async => images);

      final result = await mockCloudStorageService.getStorageImagesUrl();

      expect(result, isNotNull);
      expect(result.length, images.length);
    });
  });
}
