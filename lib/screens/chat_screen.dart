import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../models/image_item.dart';
import '../services/api_service.dart'; // Contains ChatService now

class ChatScreen extends StatefulWidget {
  final ImageItem selectedItem;
  final String? initialMessage;

  const ChatScreen({
    super.key,
    required this.selectedItem,
    this.initialMessage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService = ChatService();
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _bot = const types.User(id: 'bot', firstName: 'Alter Ego');

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      _handleSendPressed(types.PartialText(text: widget.initialMessage!));
    } else {
      // Default bot greeting if no initial message
      _addMessage(
        types.TextMessage(
          author: _bot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text:
              "You selected a ${widget.selectedItem.style} look. How can I help you refine it?",
        ),
      );
    }
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    // Call Python Chatbot
    try {
      // We need a service to call the Python API.
      // Since we removed ApiService usage from other screens, we can repurpose it or create a new one.
      // Let's assume we have a ChatService.
      final response = await _chatService.sendMessage(
        message.text,
        widget.selectedItem.style,
      );

      final botMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: response,
      );
      _addMessage(botMessage);
    } catch (e) {
      print("Chat Error: $e");
      final errorMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "Sorry, I'm having trouble connecting to my brain. ($e)",
      );
      _addMessage(errorMessage);
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stylist Chat"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        theme: DefaultChatTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          inputBackgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest,
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          inputTextColor:
              Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
          receivedMessageBodyTextStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          sentMessageBodyTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
