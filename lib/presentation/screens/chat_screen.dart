import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:username_generator/username_generator.dart';
import 'package:whatsapp_clone/presentation/data/model/chat_model.dart';
import 'package:whatsapp_clone/presentation/screens/chat_details.dart';
import 'package:random_avatar/random_avatar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<Chat> chats = List.generate(50, (index) {
    final faker = Faker();
    final user = UsernameGenerator().generate;

// Inside your ChatDetails class or wherever you're formatting the time
    // final DateFormat formatter = DateFormat('dd/MM/yyyy');
    // final String formattedTime = formatter.format(DateTime.now());

    return Chat(
      title: faker.person.name(),
      lastMessage: faker.lorem.sentence(),
      time: faker.date.time(),
      // formattedTime,
      avatar: RandomAvatarString(DateTime.now().toIso8601String(),
          trBackground: false),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 19, 17),
      body: Padding(
        padding: EdgeInsets.zero,
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final chat = chats[index];
            return ListTile(
              leading: RandomAvatar(
                chat.avatar,
                height: 50,
                width: 50,
              ),
              title: Text(
                chat.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                chat.lastMessage,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                chat.time,
                style: const TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetails(
                      title: chat.title,
                      avatar: chat.avatar,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your functionality here
        },
        backgroundColor: const Color(0xff25D366),
        child: const Icon(
          Icons.chat_rounded,
          color: Color.fromARGB(255, 0, 19, 17),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
