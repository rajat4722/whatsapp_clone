import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  final String title;
  final String avatar;

  const ChatDetails({Key? key, required this.title, required this.avatar})
      : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  bool isRecordingAudio = false;
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 23, 15),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 19, 17),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Add functionality to go back
          },
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                // Chat messages display area
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 40, 39, 39),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.insert_emoticon),
                        onPressed: () {
                          // Add your action here
                        },
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!isTyping) // Show camera and currency icons only if not typing
                            IconButton(
                              icon: const Icon(Icons.attach_file),
                              onPressed: () {
                                // Add your action here
                              },
                            ),
                          if (!isTyping)
                            IconButton(
                              icon: const Icon(Icons.currency_rupee_rounded),
                              onPressed: () {
                                // Add your action here
                              },
                            ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              // Add your action here
                            },
                          ),
                        ],
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    onChanged: (value) {
                      setState(() {
                        isTyping = value.isNotEmpty;
                      });
                      // Add your text change handling here
                    },
                    onSubmitted: (value) {
                      // Add your send message functionality here
                    },
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: const Color(0xff25D366),

                  radius: 20,
                  // Adjust the radius as needed
                  child: isRecordingAudio
                      ? IconButton(
                          icon: const Icon(Icons.stop),
                          onPressed: () {
                            setState(() {
                              isRecordingAudio = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.mic),
                          onPressed: () {
                            setState(() {
                              isRecordingAudio = true;
                            });
                          },
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
