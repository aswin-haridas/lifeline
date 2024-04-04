import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Bot introduction message when the chat screen initializes
    _messages.add(ChatMessage(
      text: "Hi, I'm here to assist with safety tips. Please mention your disease.",
      isUserMessage: false,
    ));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
      _messages.insert(0, ChatMessage(
        text: _getBotResponse(text),
        isUserMessage: false,
      ));
    });
  }

  String _getBotResponse(String userQuery) {
    if (userQuery.toLowerCase().contains('burn')) {
      return """For minor burns:
1. Cool the burn with cool running water for at least 10 minutes.
2. Remove any clothing or jewelry near the burn, but don't peel off anything sticking to the skin.
3. Cover the burn with a sterile, non-adhesive dressing or a clean cloth.
4. Take over-the-counter pain relievers if necessary.

For severe burns or if in doubt, seek medical attention immediately. Avoid applying ice, butter, or ointments to the burn.""";
    } else {
      // Default response if the query doesn't match any predefined condition
      return "Is there any more queries";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Chatbot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  const ChatMessage({super.key, required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isUserMessage
              ? SizedBox() // To align user messages to the right
              : Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(child: Text('Bot')),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUserMessage ? 'You' : 'Bot',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: isUserMessage ? Colors.blueAccent : Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isUserMessage ? 16.0 : 0),
                      topRight: Radius.circular(isUserMessage ? 0 : 16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          isUserMessage
              ? Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(child: Text('You')),
                )
              : SizedBox(), // To align bot messages to the left
        ],
      ),
    );
  }
}
