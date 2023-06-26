import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'StatsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
