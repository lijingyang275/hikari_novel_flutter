import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikari_novel_flutter/router/route_path.dart';
import 'package:hikari_novel_flutter/service/local_storage_service.dart';
import 'package:hikari_novel_flutter/widgets/state_page.dart';
import '../../models/common/wenku8_node.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LogoPage(),
            const SizedBox(height: 20),
            Text("welcome_to_use_app".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text("welcome_tip".tr, style: TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            FilledButton.icon(onPressed: () => Get.toNamed(RoutePath.login), label: Text("go_to_login".tr), icon: const Icon(Icons.login)),
            const SizedBox(height: 40),
            PopupMenuButton<Wenku8Node>(
              onSelected: (Wenku8Node value) {
                LocalStorageService.instance.setWenku8Node(value);
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<Wenku8Node>(value: Wenku8Node.wwwWenku8Net, child: Text(Wenku8Node.wwwWenku8Net.node)),
                PopupMenuItem<Wenku8Node>(value: Wenku8Node.wwwWenku8Cc, child: Text(Wenku8Node.wwwWenku8Cc.node)),
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lan_outlined, size: 16, color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 8),
                  Text("node".tr, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
