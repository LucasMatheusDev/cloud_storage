import 'package:cloud_storage/core/theme/custom_style_form.dart';
import 'package:cloud_storage/modules/login/view/components/custom_background.dart';
import 'package:cloud_storage/modules/login/view/components/register_new_user_component.dart';
import 'package:cloud_storage/modules/login/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: CustomBackground(
        imageUrl:
            "https://i0.wp.com/www.intelligentcio.com/latam-pt/wp-content/uploads/sites/52/2021/04/1000-28-600x344-1.jpg?fit=600%2C344&ssl=1",
        opacity: 0.3,
        child: PageView(
          controller: controller.pageController,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                  child: Form(
                    key: controller.formKeyLogin,
                    child: Column(
                      children: [
                        const Text(
                          "Cloud Storage",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const Text(
                          "Você sempre Seguro",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) => controller.emailValidator(
                            value: value,
                          ),
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomStyleForm().roundedBorder(
                            label: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          validator: (value) => controller.defaultValidator(
                            value: value,
                          ),
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomStyleForm().roundedBorder(
                            label: "Senha",
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton.extended(
                                      onPressed: controller.login,
                                      label: const Text("Logar"),
                                      heroTag: "logar",
                                    ),
                                    FloatingActionButton.extended(
                                      heroTag: "register",
                                      onPressed: () =>
                                          controller.pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOutCubic,
                                      ),
                                      label: Row(
                                        children: const [
                                          Text("Novo Registro"),
                                          Icon(Icons.arrow_forward),
                                        ],
                                      ),
                                      backgroundColor:
                                          Colors.red.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const RegisterNewUserComponent()
          ],
        ),
      ),
    );
  }
}
