import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart'; // Import the services library

class ChatBubble extends StatelessWidget {
  // final String messageId;
  final String message;
  final bool isCurrentUser;
  final VoidCallback? onDeletePressed;

  const ChatBubble({
    Key? key,
    // required this.messageId,
    required this.message,
    required this.isCurrentUser,
    this.onDeletePressed,
  }) : super(key: key);

  // // Function to delete a message from Firestore
  // Future<void> deleteMessage(String messageId) async {
  //   try {
  //     // Get a reference to the message document in Firestore
  //     var messageRef = FirebaseFirestore.instance.collection('messages').doc(messageId);
  //
  //     // Delete the document from Firestore
  //     await messageRef.delete();
  //
  //     print('Message deleted successfully');
  //   } catch (error) {
  //     print('Error deleting message: $error');
  //     // Handle error appropriately (e.g., show error message to user)
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for correct bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onLongPress: () {
        _copyMessageToClipboard(context); // Call _copyMessageToClipboard function on long press
        _showDeleteConfirmation(context);
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 2 / 3,
        ),
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Colors.green.shade600 : Colors.green.shade500)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
        child: Text(
          message,
          style: TextStyle(
            color: isCurrentUser ? Colors.white : (isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  void _copyMessageToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: message)); // Copy message to clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Message copied to clipboard'), // Show snackbar to inform user
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    // Show delete confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Message'),
          content: Text('Are you sure you want to delete this message?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onDeletePressed?.call(); // Trigger the delete action
                // deleteMessage(messageId);
              },
            ),
          ],
        );
      },
    );
  }
}
