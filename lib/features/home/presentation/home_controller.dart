import 'package:collection/collection.dart';
import 'package:get/get.dart';
// import 'package:notification_center/notification_center.dart';
import 'package:sqflite/sqflite.dart';

import '../../../component/config/app_route.dart';
import '../../../component/database/database.dart';

class HomeController extends GetxController {
  // database expanse
  DatabaseManager database = DatabaseManager.instance;

  HomeController();

  @override
  void onInit() {
    // NotificationCenter().subscribe('refresh-expense', (_) {
    //   getExpenseDaily();
    // });
    super.onInit();
  }

  @override
  void onClose() {
    // NotificationCenter().unsubscribe('refresh-expense');
    super.onClose();
  }

  void toAddExpense() {
    Get.toNamed(AppRoute.addExpense);
  }

  Future<Map<String, List<Map<String, dynamic>>>> getExpenseDaily() async {
    Database db = await database.db;
    List<Map<String, dynamic>> getExpenseDaily = await db.query(
      "expense",
      orderBy: "dateExpense DESC",
    );
    // Grouping
    final grouped = groupBy<Map<String, dynamic>, String>(
        getExpenseDaily, (row) => row["dateExpense"].toString());

    return grouped;
  }

  Future<List<Map<String, dynamic>>> getExpenseCategory() async {
    Database db = await database.db;
    List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT category, SUM(nominal) as total
      FROM expense
      GROUP BY category
    ''');

    return result;
  }
}
