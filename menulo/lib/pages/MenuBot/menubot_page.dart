import 'package:flutter/material.dart';

class MenuBotPage extends StatefulWidget {
  const MenuBotPage({super.key});

  @override
  State<MenuBotPage> createState() => _MenuBotPageState();
}

class _MenuBotPageState extends State<MenuBotPage> {
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello Menu Bot !", "isMe": true, "type": "text"},
    {
      "text": "Hello Berkay, How can I help you today?",
      "isMe": false,
      "type": "text",
    },
    {"text": "I want to eat pizza today", "isMe": true, "type": "text"},
    {
      "text": "Here's some recommandations for you near by.",
      "isMe": false,
      "type": "text",
    },
    {
      "isMe": false,
      "type": "card",
      "name": "Domino's",
      "category": "Fast-Food",
      "distance": "0.6 km away",
      "rating": "4.5 (86)",
    },
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "MenuBot",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.info_outline, color: primaryColor, size: 28),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                if (msg["type"] == "card") {
                  return _buildBotCard(msg, primaryColor);
                }
                return _buildChatBubble(msg, primaryColor);
              },
            ),
          ),

          _buildInputArea(primaryColor),
        ],
      ),
    );
  }

  Widget _buildChatBubble(Map<String, dynamic> msg, Color primaryColor) {
    bool isMe = msg["isMe"];
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isMe ? primaryColor.withOpacity(0.8) : Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isMe ? 15 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
        ),
        child: Text(
          msg["text"],
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildBotCard(Map<String, dynamic> msg, Color primaryColor) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/restaurant_mock_up.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${msg["category"]} • ${msg["distance"]}",
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 12),
                      Text(
                        " ${msg["rating"]}",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.info_outline, color: primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Ask me anything",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 25,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _messages.add({
                      "text": _controller.text,
                      "isMe": true,
                      "type": "text",
                    });
                    _controller.clear();
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
