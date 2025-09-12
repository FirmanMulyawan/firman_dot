import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../component/config/app_const.dart';
import '../../../component/config/app_style.dart';
import '../../../component/model/expense_category.dart';
import 'home_controller.dart';
import 'widget/expense_category_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Halo, User!",
                  style: AppStyle.bold(size: 18),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Jangan lupa catat keuanganmu setiap hari!",
                  style: AppStyle.regular(textColor: AppStyle.grey3),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _cardExpense(
                          title: 'Pengeluaranmu\nhari ini', nominal: "30.000"),
                    ),
                    SizedBox(
                      width: 19,
                    ),
                    Expanded(
                      child: _cardExpense(
                          color: AppStyle.teal,
                          title: 'Pengeluaranmu\nbulan ini',
                          nominal: "335.500"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pengeluaran berdasarkan kategori",
                  style: AppStyle.bold(),
                ),
                SizedBox(
                  height: 20,
                ),
                ExpenseCategoryCard(
                  backgroundColorIcon: AppStyle.yellow,
                  iconCard: AppConst.iconBasketball,
                  title: "Internet",
                  totalAmount: "Rp. 20.000",
                ),
                SizedBox(
                  height: 28,
                ),
                _dailyExpenseList(),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toAddExpense(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppStyle.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppConst.iconUilPlus,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _dailyExpenseList() {
    return FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
        future: controller.getExpenseDaily(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              enabled: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hari ini",
                    style: AppStyle.bold(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _dailyExpenseCards(
                      colorIcon: AppStyle.blue,
                      iconName: AppConst.iconBasketball,
                      title: 'Ayam Geprek',
                      price: 'Rp. 15.000'),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Kemarin",
                    style: AppStyle.bold(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _dailyExpenseCards(
                      colorIcon: AppStyle.blue,
                      iconName: AppConst.iconBasketball,
                      title: 'Ayam Geprek',
                      price: 'Rp. 15.000'),
                ],
              ),
            );
          }

          if (snapshort.data?.isEmpty == true) {
            return Center(
              child: Text("Data Pengeluaran Belum Ada"),
            );
          }

          final data =
              snapshort.data as Map<String, List<Map<String, dynamic>>>;
          return Column(
              children: data.entries.map(
            (entry) {
              final date = entry.key;
              final expenses = entry.value;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDateLabel(date),
                    style: AppStyle.bold(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: expenses.map((value) {
                      return Column(
                        children: [
                          _dailyExpenseCards(
                              colorIcon: ExpenseCategoryExtension.fromLabel(
                                      value['category'])
                                  .color,
                              iconName: ExpenseCategoryExtension.fromLabel(
                                      value['category'])
                                  .icon,
                              title: value['name'],
                              price: formatRupiah(value['nominal'])),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  )
                ],
              );
            },
          ).toList());
        });
  }

  Widget _cardExpense({Color? color, String title = '', String nominal = ''}) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color ?? AppStyle.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.medium(textColor: AppStyle.whiteColor),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Rp. $nominal",
              style: AppStyle.bold(textColor: AppStyle.whiteColor, size: 18))
        ],
      ),
    );
  }

  Widget _dailyExpenseCards(
      {String? iconName,
      Color? colorIcon,
      String title = '',
      String price = ''}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: AppStyle.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: SvgPicture.asset(
              iconName ?? '',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                colorIcon ?? AppStyle.yellow,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: Text(
              title,
              style: AppStyle.regular(),
            ),
          ),
          Text(
            price,
            style: AppStyle.medium(),
          ),
        ],
      ),
    );
  }

  // === helper
  String formatRupiah(int number) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }

  String formatDateLabel(String dateString) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final parsed = DateTime.parse(dateString);
    final target = DateTime(parsed.year, parsed.month, parsed.day);

    final diff = target.difference(today).inDays;

    if (diff == 0) {
      return "Hari ini";
    } else if (diff == -1) {
      return "Kemarin";
    } else {
      return DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(parsed);
    }
  }
}
