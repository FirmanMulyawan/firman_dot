import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/config/app_style.dart';
import 'home_controller.dart';

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
                )
              ],
            ),
          ),
        ));
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
}
