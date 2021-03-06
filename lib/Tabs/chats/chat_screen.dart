import 'package:flutter/material.dart';
import 'package:unify_app/utils/chat_outline.dart';

// ignore_for_file: prefer_const_constructors
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Material(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      OutlineItem(
                        imageUrl: 'assets/images/user_4.jpg',
                        name: 'Charlotte',
                        code: 'hiii',
                        time: '7:10 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_2.jpg',
                        name: 'Noah',
                        code: 'hello',
                        time: '3:04 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_5.jpg',
                        name: 'Oliver',
                        code: 'byyy',
                        time: '10:45 am',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user.jpg',
                        name: 'Emma',
                        code: 'No i am not',
                        time: '5:56 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_2.jpg',
                        name: 'Alis',
                        code: 'Enjoy',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_4.jpg',
                        name: 'Charlotte',
                        code: 'hiii',
                        time: '1:56 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_5.jpg',
                        name: 'Michal',
                        code: 'Good Morning',
                        time: '6.14 pm',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
