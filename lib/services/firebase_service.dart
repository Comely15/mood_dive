import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/image_item.dart';

class FirebaseService {
  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // Remove final _firestore = FirebaseFirestore.instance;
  // Access it lazily to avoid crash if Firebase isn't initialized.

  /// Fetches 9 random images for the Mood Board.
  /// In a real app with many images, we might use a random ID approach or a specific 'featured' collection.
  Future<List<ImageItem>> getMoodBoardImages() async {
    try {
      // Check if Firebase is initialized
      if (Firebase.apps.isEmpty) {
        print("Firebase not initialized (apps.isEmpty), using mock data.");
        return _getMockImages();
      }

      final firestore = FirebaseFirestore.instance;
      // For MVP, just get first 9 or random.
      // Firestore doesn't support random natively well.
      // We'll fetch a batch and shuffle client side for now (assuming small dataset).
      print("Fetching images from Firestore...");
      final snapshot = await firestore.collection('images').limit(20).get();

      if (snapshot.docs.isEmpty) {
        print("Firestore returned empty snapshot. Using mock data.");
        // Fallback if DB is empty or not connected properly yet
        return _getMockImages();
      }

      List<ImageItem> allImages = snapshot.docs.map((doc) {
        return ImageItem(
          id: doc.id,
          url: doc['url'],
          style: doc['style'],
          description: doc['description'],
        );
      }).toList();

      allImages.shuffle();
      return allImages.take(9).toList();
    } catch (e) {
      print("Firebase Error: $e");
      // Return mock data if Firebase fails (e.g. not configured)
      return _getMockImages();
    }
  }

  /// Fetches recommendations based on the selected image ID.
  /// Implements "Diversity Parameter" client-side for now.
  Future<List<ImageItem>> dive(String selectedId) async {
    try {
      if (Firebase.apps.isEmpty) return _getMockImages().take(4).toList();
      final firestore = FirebaseFirestore.instance;

      // 1. Get the selected image to know its style
      final selectedDoc = await firestore
          .collection('images')
          .doc(selectedId)
          .get();
      if (!selectedDoc.exists) return _getMockImages().take(4).toList();

      final String currentStyle = selectedDoc['style'];

      // 2. Fetch similar images (same style)
      final similarSnapshot = await firestore
          .collection('images')
          .where('style', isEqualTo: currentStyle)
          .where(FieldPath.documentId, isNotEqualTo: selectedId)
          .limit(10)
          .get();

      // 3. Fetch twist images (different style)
      final twistSnapshot = await firestore
          .collection('images')
          .where('style', isNotEqualTo: currentStyle)
          .limit(5)
          .get();

      List<ImageItem> similar = similarSnapshot.docs
          .map(
            (doc) => ImageItem(
              id: doc.id,
              url: doc['url'],
              style: doc['style'],
              description: doc['description'],
            ),
          )
          .toList();

      List<ImageItem> twist = twistSnapshot.docs
          .map(
            (doc) => ImageItem(
              id: doc.id,
              url: doc['url'],
              style: doc['style'],
              description: doc['description'],
              isTwist: true,
            ),
          )
          .toList();

      similar.shuffle();
      twist.shuffle();

      // Take 3 similar and 1 twist
      List<ImageItem> recommendations = [];
      recommendations.addAll(similar.take(3));
      if (twist.isNotEmpty) {
        recommendations.add(twist.first);
      } else if (similar.length > 3) {
        recommendations.add(similar[3]);
      }

      recommendations.shuffle();
      return recommendations;
    } catch (e) {
      print("Firebase Dive Error: $e");
      return _getMockImages().take(4).toList();
    }
  }

  // Mock Data Fallback (Same as Python mock)
  List<ImageItem> _getMockImages() {
    return [
      ImageItem(
        id: "min_1",
        url:
            "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500",
        style: "minimalist",
        description: "Clean white shirt",
      ),
      ImageItem(
        id: "min_2",
        url:
            "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=500",
        style: "minimalist",
        description: "Simple beige trousers",
      ),
      ImageItem(
        id: "avg_1",
        url:
            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500",
        style: "avant_garde",
        description: "Asymmetric dress",
      ),
      ImageItem(
        id: "ret_1",
        url: "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500",
        style: "retro",
        description: "Vintage denim jacket",
      ),
      ImageItem(
        id: "str_1",
        url:
            "https://images.unsplash.com/photo-1515347619252-60a6bf4fffce?w=500",
        style: "street",
        description: "Oversized graphic tee",
      ),
      ImageItem(
        id: "avg_2",
        url:
            "https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500",
        style: "avant_garde",
        description: "Metallic jacket",
      ),
      ImageItem(
        id: "ret_2",
        url:
            "https://images.unsplash.com/photo-1485230946086-1d99d529c7c4?w=500",
        style: "retro",
        description: "Polka dot dress",
      ),
      ImageItem(
        id: "min_3",
        url:
            "https://images.unsplash.com/photo-1574634534894-89d7576c8259?w=500",
        style: "minimalist",
        description: "Grey wool coat",
      ),
      ImageItem(
        id: "str_2",
        url: "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=500",
        style: "street",
        description: "Cargo pants",
      ),
    ];
  }
}
