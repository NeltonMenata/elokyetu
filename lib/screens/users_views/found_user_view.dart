import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/chat/chat_view.dart';
import 'controllers/user_controller.dart';

class FoundUserView extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuários Encontrados"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<UserController>(
              init: UserController(),
              builder: (_) {
                if (controller.isUsersFound) {
                  return ListView.builder(
                    itemCount: controller.usersFound.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(controller.usersFound[index]["nome"]),
                        trailing: const Icon(Icons.chat),
                        onTap: () {
                          Get.to(const ChatView(),
                              arguments: controller.usersFound[index]);
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
