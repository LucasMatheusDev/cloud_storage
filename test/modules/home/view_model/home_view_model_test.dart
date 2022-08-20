import 'dart:io';

import 'package:cloud_storage/modules/home/view_model/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../model/service/cloud_storage_service_imp_test.mocks.dart';
import 'home_view_model_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  group('home view model', () {
    test('should make upload file', () async {
      final MockHomeViewModel mockHomeViewModel = MockHomeViewModel();
      when(mockHomeViewModel.uploadFile(file: anyNamed('file')))
          .thenAnswer((_) async => true);

      final result = await mockHomeViewModel.uploadFile(file: File('test'));

      expect(result, true);
    });

    test('should not make upload file', () async {
      final MockHomeViewModel mockHomeViewModel = MockHomeViewModel();
      when(mockHomeViewModel.uploadFile(file: anyNamed('file')))
          .thenAnswer((_) async => false);

      final result = await mockHomeViewModel.uploadFile(file: File('test'));

      expect(result, false);
    });

    test('should make download of images', () async {
      final images = List<String>.from(["image1", "image2", "image3"]);
      final MockCloudStorageServiceImp mockCloudStorageService =
          MockCloudStorageServiceImp();
      final HomeViewModel homeViewModel = HomeViewModel(
        cloudStorageService: mockCloudStorageService,
      );

      when(mockCloudStorageService.getStorageImagesUrl())
          .thenAnswer((_) async => images);

      final result = await homeViewModel.getStorageImages();

      expect(result, isNotNull);
      expect(result!.length, images.length);
    });

    test('should delete image', () async {
      final MockHomeViewModel mockHomeViewModel = MockHomeViewModel();

      when(mockHomeViewModel.deleteImage(urlImage: "image"))
          .thenAnswer((_) async => true);
      final result = await mockHomeViewModel.deleteImage(urlImage: 'image');
      expect(result, true);
    });
  });
}
