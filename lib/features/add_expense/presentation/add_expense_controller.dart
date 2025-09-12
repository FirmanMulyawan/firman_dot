import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../component/model/expense_category.dart';

class AddExpenseController extends GetxController {
  final focusNode = FocusNode();
  var isFocusedNominal = false.obs;
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController dateExpenseController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final Rx<TextEditingController> categoriController =
      TextEditingController(text: ExpenseCategory.makanan.label).obs;
  var selectedCategoryLabel = ExpenseCategory.makanan.label.obs;
  ExpenseCategory get selectedCategory => ExpenseCategory.values
      .firstWhere((e) => e.label == selectedCategoryLabel.value);
  bool isValid = false;

  AddExpenseController();

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      isFocusedNominal.value = focusNode.hasFocus;
    });

    nominalController.addListener(() {
      final text = nominalController.text.replaceAll('.', '');
      if (text.isEmpty) return;

      final number = int.tryParse(text);
      if (number == null) return;

      final formatted = NumberFormat('#,###', 'id_ID').format(number);
      if (formatted != nominalController.text) {
        nominalController.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.collapsed(offset: formatted.length),
        );
      }
    });
  }

  @override
  void onClose() {
    focusNode.dispose();
    nominalController.dispose();
    super.onClose();
  }

  void validate() {
    isValid = expenseController.text.isNotEmpty &&
        nominalController.text.isNotEmpty &&
        dateExpenseController.text.isNotEmpty &&
        categoriController.value.text.isNotEmpty;
    update();
  }

  void changeCategory(String category) {
    selectedCategoryLabel.value = category;
    categoriController.value.text = category;
    // Get.back();
  }
}
