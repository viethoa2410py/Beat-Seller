import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {Key? key,
      required this.text,
      required this.type,
      this.showBtn = false,
      this.openRecommendation})
      : super(key: key);

  final String text;
  final bool type;
  final bool showBtn;
  final Function()? openRecommendation;
  DateTime date = DateTime.now();

  List<Widget> otherMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F3F3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Text(
                    text,
                  ),
                  if (showBtn) ...[
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: openRecommendation,
                      child: Container(
                        height: 30,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Open recommendation",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: RichText(
                text: TextSpan(
                  text: "${date.hour}:${date.minute}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Color(0xFF2198E7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: RichText(
                text: TextSpan(
                    text: "${date.hour}:${date.minute}",
                    style: const TextStyle(color: Colors.grey),
                    children: const [
                      TextSpan(text: " ✓", style: TextStyle(color: Colors.grey))
                    ]),
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 27),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
