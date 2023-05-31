import 'package:flutter/material.dart';
import 'package:beatSeller/theme/color.dart';
import 'package:beatSeller/utils/data.dart';
import 'package:beatSeller/utils/widget_extension.dart';
import 'package:beatSeller/widgets/type_beat_item.dart';

class DialogTypeBeat extends StatelessWidget {
  const DialogTypeBeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: _size.height / 3,
        width: _size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: appBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            "Type of beat".desc().marg(0, 0, 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Wrap(
                runSpacing: 8,
                children: List.generate(
                  types.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TypeBeatItem(
                      data: types[index],
                      onTap: () async {
                        Navigator.pop(context, index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
