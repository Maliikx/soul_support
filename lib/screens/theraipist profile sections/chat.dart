import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:soul_support/constants/constants.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/therapistProfileScreen.dart';

class Chat extends StatefulWidget {
  final String senderRole;
  final int patient_id;
  const Chat({super.key, required this.senderRole, required this.patient_id,});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  IO.Socket? socket;
  final ScrollController _scrollController = ScrollController();

  // List<String> msgs = [];
  List<Map<String, dynamic>> messages = [];
  TextEditingController? msg;

  // Temporary hardcoded IDs — replace with actual user data later
  final int patientId =18;
  final int doctorId = 1;

  @override
  void initState() {
    super.initState();
    msg = TextEditingController();

    initTheSocket();
  }

  @override
  void dispose() {
    socket?.disconnect();
    socket?.dispose();
    msg?.dispose();
    super.dispose();
  }

  void initTheSocket() {
    socket = IO.io(
      '$baseUrl',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    socket!.onConnect((_) {
      print("✅ Connected to server");

      // Join chat room
      socket!.emit('join_room', {
        'patient_id': patientId,
        'doctor_id': doctorId,
      });

      // Load chat history
      loadChatHistory();
    });

    socket!.on('chat_history', (history) {
      print("📜 Chat history received: $history");
      setState(() {
        //     messages = List<Map<String, dynamic>>.from(history.map((msg) => {
        //           'text': msg['message'].toString(),
        //           'sender': msg['sender'].toString(),
        //           'time': msg['createdAt'] != null
        // ? DateTime.parse(msg['createdAt'])
        // : DateTime.now(),
        //         }));
        messages = history.map<Map<String, dynamic>>((msg) => {
          'text': msg['message'].toString(),
          'sender': msg['sender'].toString(),
          'time': msg['createdAt'] != null
              ? DateTime.parse(msg['createdAt'])
              : DateTime.now(),
        }).toList();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      });
    });


    socket!.on('new_msg', (data) {
      print("📥 New message received: $data");
      setState(() {
        messages.add({
          'text': data['message'].toString(),
          'sender': data['sender'].toString(),
          'time': data['createdAt'] != null
              ? DateTime.parse(data['createdAt']) // ✅ Use the actual date key
              : DateTime.now(),
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      });
    });
    socket!.connect();
  }

  void loadChatHistory() {
    socket!.emit("load_history", {
      'patient_id': patientId,
      'doctor_id': doctorId,
    });
  }

  void sendMessage() {
    if (msg!.text.trim().isEmpty) return;

    final messageData = {
      'patient_id': patientId,
      'doctor_id': doctorId,
      'message': msg!.text.trim(),
      'sender': 'patient',
      'timestamp':
      DateTime.now().toIso8601String(), // This identifies the sender
    };



    socket!.emit('msg', messageData);
    msg!.clear();
  }


  Widget _buildMessageBubble(int index) {
    final message = messages[index];
    final isMe = message['sender'] == widget.senderRole;
    final timestamp = message['time'] ?? DateTime.now();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF01709A) : const Color(0xFFD6E8EE),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : const Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message['text'],
                    style: TextStyle(
                      color: isMe ? Colors.white : const Color(0xFF374957),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('hh:mm a').format(timestamp),
                    style: TextStyle(
                      fontSize: 10,
                      color: isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,

      body: Stack(
        children: [
          // Background image
          Positioned(
              top: 17,
              left: -214,
              child: Transform.rotate(
                angle: 0.12,
                child: Container(
                  width: 720,
                  height: 750,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(255, 0, 140, 195), const Color.fromARGB(0, 151, 202, 219)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          Positioned(
              top: 645,
              left: 190,
              child: Transform.rotate(
                angle: 0.12,
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(137, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          SafeArea(
            child: Column(
              children: [
                // App Bar Style
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Color(0xFF374957)),
                        // onPressed: () => Navigator.pushNamed(context, "therapistProfile"),
                        onPressed: () => {},
                      ),
                      CircleAvatar(


                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/imgs/doc1.jpeg"),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Dr Ethar Ayman",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Container(
                            width: 40,
                            height: 40,
                            child: SvgPicture.asset("assets/svg/video.svg",color: Colors.white, )),
                        onPressed: () => Navigator.pushNamed(context, "Appointment"),
                      ),
                    ],
                  ),
                ),

                // Chat Messages
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) => _buildMessageBubble(index),
                  ),
                ),

                // Input Field
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: msg,
                          decoration: InputDecoration(
                            hintText: "Send Message",
                            hintStyle: const TextStyle(color: Color(0xFF01709A)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffD6E8EE),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: const Color(0xFF01709A),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



}