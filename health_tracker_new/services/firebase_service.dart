import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/health_data.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? '';

  // Sleep methods
  Future<void> addSleepData(SleepData sleepData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('sleep')
        .add(sleepData.toMap());
  }

  Stream<List<SleepData>> getSleepData() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('sleep')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => SleepData.fromMap(doc.id, doc.data()))
            .toList());
  }

  Future<void> deleteSleepData(String id) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('sleep')
        .doc(id)
        .delete();
  }

  // Exercise methods
  Future<void> addExerciseData(ExerciseData exerciseData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('exercise')
        .add(exerciseData.toMap());
  }

  Stream<List<ExerciseData>> getExerciseData() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('exercise')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ExerciseData.fromMap(doc.id, doc.data()))
            .toList());
  }

  Future<void> deleteExerciseData(String id) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('exercise')
        .doc(id)
        .delete();
  }

  // Water methods
  Future<void> addWaterData(WaterData waterData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('water')
        .add(waterData.toMap());
  }

  Stream<List<WaterData>> getWaterData() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('water')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => WaterData.fromMap(doc.id, doc.data()))
            .toList());
  }

  Future<void> deleteWaterData(String id) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('water')
        .doc(id)
        .delete();
  }

  // Get today's data
  Future<Map<String, dynamic>> getTodayData() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final sleepQuery = await _firestore
        .collection('users')
        .doc(userId)
        .collection('sleep')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThan: Timestamp.fromDate(endOfDay))
        .get();

    final exerciseQuery = await _firestore
        .collection('users')
        .doc(userId)
        .collection('exercise')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThan: Timestamp.fromDate(endOfDay))
        .get();

    final waterQuery = await _firestore
        .collection('users')
        .doc(userId)
        .collection('water')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThan: Timestamp.fromDate(endOfDay))
        .get();

    int totalSleepHours = 0;
    int totalSleepMinutes = 0;
    int totalExerciseMinutes = 0;
    int totalWaterAmount = 0;

    for (var doc in sleepQuery.docs) {
      final data = doc.data();
      totalSleepHours += (data['hours'] as int?) ?? 0;
      totalSleepMinutes += (data['minutes'] as int?) ?? 0;
    }

    for (var doc in exerciseQuery.docs) {
      final data = doc.data();
      totalExerciseMinutes += (data['duration'] as int?) ?? 0;
    }

    for (var doc in waterQuery.docs) {
      final data = doc.data();
      totalWaterAmount += (data['amount'] as int?) ?? 0;
    }

    return {
      'sleepHours': totalSleepHours + (totalSleepMinutes ~/ 60),
      'sleepMinutes': totalSleepMinutes % 60,
      'exerciseMinutes': totalExerciseMinutes,
      'waterAmount': totalWaterAmount,
    };
  }
} 