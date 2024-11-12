import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _introMessageVisible = true;

  final String apiUrl = "https://api.vultrinference.com/v1/chat/completions";  // Correct API URL
  final String apiKey = "IVEKMMPTEGMD63XRXN2FEO5B2MZDS2OGZLPA";  // Correct API key

  // Custom function to create chat bubbles
  Widget _chatBubble(String text, String sender) {
    bool isUser = sender == 'user';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.shade200,
              child: Icon(Icons.android, color: Colors.white),
            ),
            SizedBox(width: 8),
          ],
          // Chat bubble container with dynamic height based on the content
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75, // Limit width of the chat bubble
            ),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Extra padding for better spacing
            decoration: BoxDecoration(
              color: isUser ? Colors.blue.shade200 : Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: isUser ? Radius.circular(20) : Radius.zero,
                bottomRight: isUser ? Radius.zero : Radius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
                fontSize: 16,
              ),
              softWrap: true, // Allows text to wrap inside the bubble
              overflow: TextOverflow.visible, // Ensures overflowed text is visible within the bubble
            ),
          ),
          if (isUser) ...[
            SizedBox(width: 8),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green.shade200,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }

  // Introductory message for the chatbot
  Widget _introText() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "Hi! I'm your Chatbot. I can assist you with various tasks. Ask me anything!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Function to send messages to the API
  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    String userMessage = _controller.text.trim();

    // Add user's message to the chat
    setState(() {
      messages.insert(0, {'text': userMessage, 'sender': 'user'});
      _controller.clear();
    });

    // Hide intro message once user starts chatting
    if (_introMessageVisible) {
      setState(() {
        _introMessageVisible = false;
      });
    }

    // Prepare data for API request
    final Map<String, dynamic> requestBody = {
      'model': 'llama2-13b-chat-Q5_K_M',  // Example model, replace as needed
      'messages': [
        {'role': 'user', 'content': userMessage}
      ],
      'max_tokens': 512,  // You can adjust max tokens as needed
      'seed': -1,  // Use -1 for no specific seed
      'temperature': 0.8,  // Controls randomness
      'top_k': 40,  // Number of most likely tokens
      'top_p': 0.9,  // Nucleus sampling probability
      'stream': false,  // If you want to stream the response
    };

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Parse the response
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Extract the chatbot's reply from the response
        String botReply = responseData['choices'][0]['message']['content'];

        // Add bot's reply to the chat
        setState(() {
          messages.insert(0, {'text': botReply, 'sender': 'bot'});
        });
      } else {
        // Handle error if the response is not successful
        setState(() {
          messages.insert(0, {'text': 'Error: Unable to get response from the server.', 'sender': 'bot'});
        });
      }
    } catch (e) {
      // Handle network or other errors
      setState(() {
        messages.insert(0, {'text': 'Error: ${e.toString()}', 'sender': 'bot'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          if (_introMessageVisible) _introText(),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _chatBubble(messages[index]['text']!, messages[index]['sender']!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blueAccent,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
