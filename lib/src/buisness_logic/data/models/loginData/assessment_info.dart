import 'dart:convert';

class AssessmentInfo {
  final String aId;
  final String aName;
  final double duration;
  final int totalQuestions;
  final int totalMarks;
  AssessmentInfo({
    required this.aId,
    required this.aName,
    required this.duration,
    required this.totalQuestions,
    required this.totalMarks,
  });

  AssessmentInfo copyWith({
    String? aId,
    String? aName,
    double? duration,
    int? totalQuestions,
    int? totalMarks,
  }) {
    return AssessmentInfo(
      aId: aId ?? this.aId,
      aName: aName ?? this.aName,
      duration: duration ?? this.duration,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aId': aId,
      'aName': aName,
      'duration': duration,
      'totalQuestions': totalQuestions,
      'totalMarks': totalMarks,
    };
  }

  factory AssessmentInfo.fromMap(Map<String, dynamic> map) {
    return AssessmentInfo(
      aId: map['aId'] ?? '',
      aName: map['aName'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
      totalQuestions: map['totalQuestions']?.toInt() ?? 0,
      totalMarks: map['totalMarks']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AssessmentInfo.fromJson(String source) => AssessmentInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssessmentInfo(aId: $aId, aName: $aName, duration: $duration, totalQuestions: $totalQuestions, totalMarks: $totalMarks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AssessmentInfo &&
      other.aId == aId &&
      other.aName == aName &&
      other.duration == duration &&
      other.totalQuestions == totalQuestions &&
      other.totalMarks == totalMarks;
  }

  @override
  int get hashCode {
    return aId.hashCode ^
      aName.hashCode ^
      duration.hashCode ^
      totalQuestions.hashCode ^
      totalMarks.hashCode;
  }
}