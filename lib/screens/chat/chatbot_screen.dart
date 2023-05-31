import 'dart:async';
import 'dart:convert';

import 'package:beatSeller/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/dialogflow/v2.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  late FocusNode myFocusNode;
  final bool _isRecording = false;
  bool _isWaitingBot = false;
  late AnimationController _animationIconMenuController;
  bool isShowingIconMenu = false;
  late DialogflowApi dialogflow;
  int funcSelected = 0;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    initPlugin();
    _animationIconMenuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationIconMenuController.dispose();
    super.dispose();
  }

  Future<void> initPlugin() async {
    final credentials = ServiceAccountCredentials.fromJson(
        jsonDecode(await rootBundle.loadString('assets/credentials.json')));

    final client = await clientViaServiceAccount(
        credentials, [DialogflowApi.dialogflowScope]);
    dialogflow = DialogflowApi(client);
  }

  void handleSubmitted(text) async {
    try {
      setState(() {
        _isWaitingBot = true;
      });
      _textController.clear();

      //TODO Dialogflow Code
      ChatMessage message = ChatMessage(
        text: text,
        type: true,
      );

      setState(() {
        _messages.insert(0, message);
      });

      late String fulfillmentText;
      late ChatMessage botMessage;

      final request = GoogleCloudDialogflowV2DetectIntentRequest();
      request.queryInput = GoogleCloudDialogflowV2QueryInput();
      request.queryInput?.text = GoogleCloudDialogflowV2TextInput();
      request.queryInput?.text?.text = text;
      request.queryInput?.text?.languageCode = 'vi-VN';
      final response = await dialogflow.projects.agent.sessions.detectIntent(
          request, 'projects/beat-seller/agent/sessions/my-session-123');

      fulfillmentText = response.queryResult?.fulfillmentText ?? '';
      setState(() {
        _isWaitingBot = false;
      });
      botMessage = ChatMessage(
        text: fulfillmentText,
        type: false,
      );
      setState(() {
        _messages.insert(0, botMessage);
      });
    } catch (e) {
      print(e);
      ChatMessage errorMessage = ChatMessage(
        text: "Có lỗi xảy ra vui lòng thử lại",
        type: false,
      );
      setState(() {
        _isWaitingBot = false;

        _messages.insert(0, errorMessage);
      });
    }
  }

  List<String> suggestion = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (myFocusNode.hasFocus) {
          setState(() {
            myFocusNode.unfocus();
          });
        }
      },
      child: Scaffold(
        appBar: BaseAppBar.lightAppBar(
          context: context,
          titleString: "Chat Bot",
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            if (_isWaitingBot)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Đang trả lời...",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ),
            const Divider(height: 1.0),
            Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: IconTheme(
                  data: IconThemeData(
                      color: Theme.of(context).colorScheme.background),
                  child: Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextField(
                            focusNode: myFocusNode,
                            controller: _textController,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  funcSelected = 5;
                                });
                              } else {
                                setState(() {
                                  funcSelected = 0;
                                });
                              }
                            },
                            onSubmitted: (value) {
                              if (value.isNotEmpty) handleSubmitted(value);
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: _isRecording
                                  ? "Bạn muốn nói gì?"
                                  : "Viết ra câu hỏi của bạn...",
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.send,
                            size: 30,
                          ),
                          onTap: () {
                            if (_textController.text.isNotEmpty) {
                              handleSubmitted(_textController.text);
                            }
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20)
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatMessage extends StatelessWidget {
  ChatMessage({Key? key, required this.text, required this.type})
      : super(key: key);

  final String text;
  final bool type;

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
              child: Text(
                text,
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
