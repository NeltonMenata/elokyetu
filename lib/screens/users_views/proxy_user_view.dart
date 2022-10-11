import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/users_views/controllers/user_controller.dart';

// ignore: must_be_immutable
class ProxyUserView extends StatelessWidget {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Procurar Usuários"),
      ),
      body: Column(
        children: [
          Expanded(
              child: GetBuilder<UserController>(
                  init: UserController(),
                  builder: (_) {
                    if (controller.isUsersProxy == true) {
                      return ListView.separated(
                        itemCount: controller.usersProxy.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                              controller.usersProxy[index]["nome"].toString()),
                          subtitle: Text(controller.usersProxy[index]
                                  ["nascimento"]
                              .toString()),
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          trailing: const Icon(Icons.person_add_alt),
                          onTap: () {
                            controller.addUser(
                                controller.usersProxy[index].get("objectId"),
                                controller.usersProxy[index]);
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
