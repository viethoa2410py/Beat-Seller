import 'package:flutter/material.dart';
import 'package:beatSeller/models/model_coupon.dart';
import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/widgets/coupon_item.dart';

class PopupCoupon extends StatefulWidget {
  const PopupCoupon({Key? key}) : super(key: key);

  @override
  State<PopupCoupon> createState() => _PopupCouponState();
}

class _PopupCouponState extends State<PopupCoupon> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: _size.height / 2,
        width: _size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: appBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: FutureBuilder(
            future: BeatRepository.getCoupons(),
            builder: (context, AsyncSnapshot<List<CouponModel>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) return SizedBox();

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: CouponItem(
                        coupon: snapshot.data![index],
                        onTap: () {
                          // setState(() {
                          //   coupon = snapshot.data![index];
                          // });
                          Navigator.pop(context, snapshot.data![index]);
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
