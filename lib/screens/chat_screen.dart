import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:yigitler_zone/core/constants.dart';
import 'package:yigitler_zone/screens/home_screen.dart';
import 'package:yigitler_zone/utils/chat_methods.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];

  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: secondaryBgColor,
        titleSpacing: 0,
        title: Row(
          children: [
            AvatarWidget(
              filePath: 'assets/images/Sample_Avatar.jpeg',
              radius: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suhail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: Chat(
        theme: DefaultChatTheme(
          inputPadding: EdgeInsets.zero,
          attachmentButtonIcon:
              const Icon(Icons.attach_file, color: Colors.black),
          sendButtonIcon: const Icon(Icons.send_rounded),
          attachmentButtonMargin: const EdgeInsets.all(8),
          inputTextColor: Colors.black,
          inputMargin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          inputBorderRadius: const BorderRadius.all(Radius.circular(40)),
          inputContainerDecoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                )
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          backgroundColor: const Color.fromARGB(255, 255, 252, 232),
          // inputBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        textMessageOptions: const TextMessageOptions(),
        inputOptions: const InputOptions(
          sendButtonVisibilityMode: SendButtonVisibilityMode.always,
        ),
        onAttachmentPressed: _handleFileSelection,
        messages: _messages,
        showUserAvatars: true,
        showUserNames: true,
        onSendPressed: (message) {
          final textMessage = ChatMethods().handleSendPressed(message, _user);
          _addMessage(textMessage);
        },
        user: _user,
      ),
    );
  }

  _addMessage(textMessage) {
    setState(() {
      _messages.insert(0, textMessage);
    });
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image)
  }
}
