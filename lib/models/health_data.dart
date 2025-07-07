import 'package:cloud_firestore/cloud_firestore.dart';

class SleepData {
  final String id;
  final DateTime date;
  final int hours;
  final int minutes;
  final String? notes;
  final DateTime createdAt;

  SleepData({
    required this.id,
    required this.date,
    required this.hours,
    required this.minutes,
    this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': Timestamp.fromDate(date),
      'hours': hours,
      'minutes': minutes,
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory SleepData.fromMap(String id, Map<String, dynamic> map) {
    return SleepData(
      id: id,
      date: (map['date'] as Timestamp).toDate(),
      hours: map['hours'] ?? 0,
      minutes: map['minutes'] ?? 0,
      notes: map['notes'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}

class ExerciseData {
  final String id;
  final DateTime date;
  final String type;
  final int duration; // in minutes
  final int? calories;
  final String? notes;
  final DateTime createdAt;

  ExerciseData({
    required this.id,
    required this.date,
    required this.type,
    required this.duration,
    this.calories,
    this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': Timestamp.fromDate(date),
      'type': type,
      'duration': duration,
      'calories': calories,
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ExerciseData.fromMap(String id, Map<String, dynamic> map) {
    return ExerciseData(
      id: id,
      date: (map['date'] as Timestamp).toDate(),
      type: map['type'] ?? '',
      duration: map['duration'] ?? 0,
      calories: map['calories'],
      notes: map['notes'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}

class WaterData {
  final String id;
  final DateTime date;
  final int amount; // in ml
  final DateTime createdAt;

  WaterData({
    required this.id,
    required this.date,
    required this.amount,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': Timestamp.fromDate(date),
      'amount': amount,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory WaterData.fromMap(String id, Map<String, dynamic> map) {
    return WaterData(
      id: id,
      date: (map['date'] as Timestamp).toDate(),
      amount: map['amount'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
} 