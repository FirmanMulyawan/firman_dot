import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../component/config/app_const.dart';
import '../../../component/config/app_style.dart';
import 'home_controller.dart';
import 'widget/expense_category_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      body: SafeArea(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
}
