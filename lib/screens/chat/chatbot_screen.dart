import 'dart:async';
import 'dart:convert';

import 'package:beatSeller/repository/repository.dart';
import 'package:beatSeller/screens/beat_detail.dart';
import 'package:beatSeller/utils/data.dart';
import 'package:beatSeller/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/dialogflow/v2.dart';

import 'widgets/w_message.dart';

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
      request.queryInput?.text?.text = text.toString().toLowerCase();
      request.queryInput?.text?.languageCode = 'vi-VN';
      final response = await dialogflow.projects.agent.sessions.detectIntent(
          request, 'projects/beat-seller/agent/sessions/my-session-123');

      fulfillmentText = response.queryResult?.fulfillmentText ?? '';
      setState(() {
        _isWaitingBot = false;
      });
      var showBtn = false;
      String type = '';
      for (var element in types) {
        if (text
            .toString()
            .toLowerCase()
            .contains(element["name"].toString().toLowerCase())) {
          type = element["name"].toString();
          showBtn = true;
        }
      }
      botMessage = ChatMessage(
        text: fulfillmentText,
        showBtn: showBtn,
        openRecommendation: () async {
          var beat = await BeatRepository.getBeatByType(type);
          if (beat != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BeatDetail(beat: beat)));
          }
        },
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

  checkRecommend(String query) {
    for (var element in types) {
      if (query.contains(element["name"].toString().toLowerCase())) {
        return true;
      }
    }
    return false;
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
