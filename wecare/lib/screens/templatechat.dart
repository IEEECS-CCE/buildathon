import 'package:flutter/material.dart';


class ChatBotHomePage extends StatefulWidget {
  @override
  _ChatBotHomePageState createState() => _ChatBotHomePageState();
}

class _ChatBotHomePageState extends State<ChatBotHomePage> {
  List<String> _conversation = [];
  List<String> _options = [
    'Fever?',
    'Headache?',
    'Sore Throat?',
    'Enter your own query'
  ];

  TextEditingController _queryController = TextEditingController();

  // Function to handle user's input or selection of an option
  void _handleUserChoice(String choice) {
    setState(() {
      _conversation.add("You: $choice");

      if (choice == 'Enter your own query') {
        // Show text input option if user wants to enter their own query
        _showQueryInput();
      } else {
        // Provide another set of options for each main option
        _conversation.add("Bot: You chose $choice. Here are more options:");
        _provideNextOptions(choice);
      }
    });
  }

  // Function to provide next set of options based on user selection
  void _provideNextOptions(String mainOption) {
    setState(() {
      _options = [' Nausea', ' Vomiting', ' Dizziness', 'Enter your own query'];
    });
  }

  // Function to show input for custom query
  void _showQueryInput() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your query'),
          content: TextField(
            controller: _queryController,
            decoration: InputDecoration(hintText: "Type your query here..."),
          ),
          actions: [
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                String query = _queryController.text;
                setState(() {
                  _conversation.add("You: $query");
                  _conversation.add(
                      "Bot: Thanks for your query! We will get back to you.");
                });
                _queryController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot UI'),
        backgroundColor: Colors.white, // Green AppBar
      ),
      body: Column(
        children: <Widget>[
          // Display the conversation
          Expanded(
            child: ListView.builder(
              itemCount: _conversation.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_conversation[index]),
                );
              },
            ),
          ),
          // Display the options as left-aligned buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align options to the left
              children: _options.map((option) {
                return Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft, // Align text to the left
                    ),
                    onPressed: () {
                      _handleUserChoice(option);
                    },
                    child: Text(option),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green, // Green BottomNavigationBar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
