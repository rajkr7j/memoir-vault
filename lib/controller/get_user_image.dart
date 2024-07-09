import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<File?> getUserImageFile() async {
  try {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    String imageUrl = userData.data()?['userImage'] ?? '';

    if (imageUrl.trim().isEmpty) {
      return null;
    } else {
      // Download the image from the URL
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Get the temporary directory
        final tempDir = await getTemporaryDirectory();
        // Create a new file with the image's name
        final file = File('${tempDir.path}/user_image.jpg');
        // Write the image bytes to the file
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        throw Exception('Failed to download image');
      }
    }
  } catch (e) {
    print('Error getting user image file: $e');
    return null;
  }
}
