import 'package:flutter/material.dart';
import 'package:hotel_booking/models/model_coupon.dart';

import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/widget_extension.dart';
import 'package:intl/intl.dart';

class CouponItem extends StatelessWidget {
  final CouponModel coupon;
  final Function() onTap;
  const CouponItem({Key? key, required this.coupon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    loadDate() {
      final DateTime date = DateTime.parse(coupon.expirationDate);
      var req = DateFormat("dd-MM-yyyy").format(date);
      return req;
    }

    return Card(
      color: appBgColor,
      child: Container(
        height: 80,
        width: _size.width * 2 / 3,
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
                        "${coupon.code}".toUpperCase(),
                        style: TextStyle(
                          color: inActiveColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        coupon.name,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Valid till ${loadDate()}",
                        style: TextStyle(
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
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: mainColor))),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
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
