import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/config/app_style.dart';
import 'add_expense_controller.dart';

class AddExpenseScreen extends GetView<AddExpenseController> {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.whiteColor,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
