// lib/services/itinerary_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/itinerary.dart';
import 'package:travel_app/model/itinerary_model.dart';

class ItineraryService {
  final CollectionReference _itineraryCollection =
      FirebaseFirestore.instance.collection('itineraries');

  // Add an itinerary to Firestore
  Future<void> addItinerary(Itinerary itinerary) async {
    try {
      await _itineraryCollection.doc(itinerary.id).set({
        'title': itinerary.title,
        'description': itinerary.description,
        'startDate': itinerary.startDate.toIso8601String(),
        'endDate': itinerary.endDate.toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to add itinerary: $e');
    }
  }

  // Get a list of all itineraries from Firestore
  Future<List<Itinerary>> getItineraries() async {
    try {
      QuerySnapshot querySnapshot = await _itineraryCollection.get();
      return querySnapshot.docs
          .map((doc) => Itinerary.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Failed to get itineraries: $e");
      return [];
    }
  }

  // Update an existing itinerary in Firestore
  Future<void> updateItinerary(Itinerary itinerary) async {
    try {
      await _itineraryCollection.doc(itinerary.id).update(itinerary.toMap());
      print("Itinerary updated successfully!");
    } catch (e) {
      print("Failed to update itinerary: $e");
    }
  }

  // Delete an itinerary from Firestore
  Future<void> deleteItinerary(String id) async {
    try {
      await _itineraryCollection.doc(id).delete();
      print("Itinerary deleted successfully!");
    } catch (e) {
      print("Failed to delete itinerary: $e");
    }
  }
}
