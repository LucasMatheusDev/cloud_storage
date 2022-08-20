import 'package:cloud_storage/core/routes/custom_navigator.dart';
import 'package:cloud_storage/modules/home/view/components/custom_card_image_component.dart';
import 'package:cloud_storage/modules/home/view/home_view_controller.dart';
import 'package:cloud_storage/modules/home/view/utils/custom_pop_up_image_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            'Olá ${controller.currentUser?.displayName}',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: controller.logout,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: controller.selectedImageFromGallery,
          ),
        ],
      ),
      body: controller.obx((imagesUrl) {
        if (imagesUrl == null) {
          return const SizedBox();
        } else {
          return RefreshIndicator(
            onRefresh: controller.getStorageImages,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: imagesUrl.length > 3 ? 3 : 2,
              ),
              itemCount: imagesUrl.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCardGalleryImageComponent(
                  urlImage: imagesUrl[index],
                  tag: imagesUrl[index] + index.toString(),
                  onTap: () => showPopUpImage(
                    context: context,
                    tag: imagesUrl[index] + index.toString(),
                    urlImage: imagesUrl[index],
                    button: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'Fechar',
                          ),
                          onPressed: () => CustomNavigator().back(),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          child: const Text(
                            'Deletar Imagem',
                          ),
                          onPressed: () async {
                            controller.deleteImage(
                              imageUrl: imagesUrl[index],
                            );
                            CustomNavigator().back();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nenhuma imagem encontrada',
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: controller.getStorageImages,
                  child: const Text(
                    'Buscar imagens Novamente',
                  ),
                ),
              ],
            ),
          ),
          onError: (error) => const Center(
                child: Text(
                  'Erro ao carregar as imagens',
                ),
              )),
    );
  }
}
