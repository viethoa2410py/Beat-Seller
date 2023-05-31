import 'package:flutter/material.dart';
import 'package:beatSeller/blocs/app_bloc.dart';
import 'package:beatSeller/blocs/bloc.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/models/model_coupon.dart';
import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/screens/my_cart/complete.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/utils/widget_extension.dart';
import 'package:beatSeller/widgets/coupon_item.dart';
import 'package:beatSeller/widgets/text_input_field.dart';

class Checkout extends StatefulWidget {
  final List<BeatModel> beatsToBuy;
  const Checkout({Key? key, required this.beatsToBuy}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _emailController = TextEditingController();
  loadSubTotalPrice() {
    var totalPrice = 0.0;
    if (widget.beatsToBuy.isNotEmpty) {
      for (var _item in widget.beatsToBuy) {
        totalPrice += _item.discount;
      }
    }
    return totalPrice;
  }

  loadTotalPrice() {
    var totalPrice = 0.0;
    totalPrice = loadSubTotalPrice() - loadTotalPriceDiscount();
    return totalPrice;
  }

  loadTotalPriceDiscount() {
    var totalDiscountPrice = 0.0;
    if (coupon != null) {
      totalDiscountPrice = loadSubTotalPrice() * coupon!.value;
    }
    return totalDiscountPrice;
  }

  CouponModel? coupon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darker,
      body: CustomScrollView(
        slivers: [
          const _AppBarWidget(),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  color: appBgColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.only(top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      'Email'.desc().marg(0, 0, 20),
                      AppTextInputField.authVisibleInputText(
                        hintText: UserRepository.currentUser!.email,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Input your mail";
                          }
                          return null;
                        },
                      ).marg(0, 0, 6, 20),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: appBgColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        'Your Order'.desc().marg(0, 0, 20),
                        Column(
                          children: List.generate(
                            widget.beatsToBuy.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.beatsToBuy[index].name.desc(),
                                  widget.beatsToBuy[index].discount
                                      .toString()
                                      .desc(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Subtotal'.desc(),
                            loadSubTotalPrice().toString().desc()
                          ],
                        ),
                      ]),
                ),
                FutureBuilder(
                    future: BeatRepository.getCoupons(),
                    builder:
                        (context, AsyncSnapshot<List<CouponModel>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) return const SizedBox();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            snapshot.data!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CouponItem(
                                coupon: snapshot.data![index],
                                onTap: () {
                                  setState(() {
                                    coupon = snapshot.data![index];
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )),
          )
        ],
      ),
      bottomSheet: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (coupon != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("You choose voucher: ${coupon!.code}",
                    style: const TextStyle(color: mainColor, fontSize: 12)),
              ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(color: inActiveColor, fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$ ${loadTotalPrice()}",
                        style: const TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        await BeatRepository.soldBeat(
                            UserRepository.currentUser!.id, widget.beatsToBuy);
                        AppBloc.cartBloc.add(const LoadData());
                        AppBloc.beatBloc
                            .add(const ChangeStatus(UploadStatus.complete));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Complete()));
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Order",
                            style: TextStyle(color: textBoxColor)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appBarColor,
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: darker,
        ),
      ),
      title: const Text(
        "Checkout",
        style: TextStyle(
          color: darker,
          fontSize: 16,
        ),
      ),
    );
  }
}
