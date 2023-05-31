import 'package:flutter/material.dart';
import 'package:beatSeller/models/model_coupon.dart';

import 'package:beatSeller/theme/color.dart';
import 'package:intl/intl.dart';

class CouponItem extends StatelessWidget {
  final CouponModel coupon;
  final Function() onTap;
  const CouponItem({Key? key, required this.coupon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    loadDate() {
      final DateTime date = DateTime.parse(coupon.expirationDate);
      var req = DateFormat("dd-MM-yyyy").format(date);
      return req;
    }

    return Card(
      color: appBgColor,
      child: Container(
        height: 80,
        width: size.width * 2 / 3,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coupon.code.toUpperCase(),
                        style: const TextStyle(
                          color: inActiveColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        coupon.name,
                        style: const TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Valid till ${loadDate()}",
                        style: const TextStyle(
                          color: inActiveColor,
                          fontSize: 10,
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: mainColor))),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        "User",
                        style: TextStyle(
                            color: primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
