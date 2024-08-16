import 'dart:convert';

import 'package:equatable/equatable.dart';

class ScheduleModel extends Equatable {
  final SpecialAnnouncementModel specialAnnouncement;
  final List<BatchModel> batches;

  const ScheduleModel({
    required this.specialAnnouncement,
    required this.batches,
  });

  ScheduleModel copyWith({
    SpecialAnnouncementModel? specialAnnouncement,
    List<BatchModel>? batches,
  }) {
    return ScheduleModel(
      specialAnnouncement: specialAnnouncement ?? this.specialAnnouncement,
      batches: batches ?? this.batches,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'specialAnnouncement': specialAnnouncement.toMap(),
      'batches': batches.map((x) => x.toMap()).toList(),
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      specialAnnouncement:
          SpecialAnnouncementModel.fromMap(map['specialAnnouncement']),
      batches: List<BatchModel>.from(
        (map['batches']).map<BatchModel>(
          (x) => BatchModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) =>
      ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [specialAnnouncement, batches];
}

class SpecialAnnouncementModel extends Equatable {
  final bool available;
  final List<String> paths;

  const SpecialAnnouncementModel({
    required this.available,
    required this.paths,
  });

  SpecialAnnouncementModel copyWith({
    bool? available,
    List<String>? paths,
  }) {
    return SpecialAnnouncementModel(
      available: available ?? this.available,
      paths: paths ?? this.paths,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'paths': paths,
    };
  }

  factory SpecialAnnouncementModel.fromMap(Map<String, dynamic> map) {
    return SpecialAnnouncementModel(
      available: map['available'] as bool,
      paths: List<String>.from(
        (map['paths'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialAnnouncementModel.fromJson(String source) =>
      SpecialAnnouncementModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [available, paths];
}

class BatchModel extends Equatable {
  final String batchId;
  final List<DateModel> dates;

  const BatchModel({
    required this.batchId,
    required this.dates,
  });

  BatchModel copyWith({
    String? batchId,
    List<DateModel>? dates,
  }) {
    return BatchModel(
      batchId: batchId ?? this.batchId,
      dates: dates ?? this.dates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'batchId': batchId,
      'dates': dates.map((x) => x.toMap()).toList(),
    };
  }

  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      batchId: map['batchId'] as String,
      dates: List<DateModel>.from(
        (map['dates']).map<DateModel>(
          (x) => DateModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BatchModel.fromJson(String source) =>
      BatchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [batchId, dates];
}

class DateModel extends Equatable {
  final String date;
  final bool available;
  final bool holiday;
  final List<HourModel> hours;

  const DateModel({
    required this.date,
    required this.available,
    required this.holiday,
    required this.hours,
  });

  DateModel copyWith({
    String? date,
    bool? available,
    bool? holiday,
    List<HourModel>? hours,
  }) {
    return DateModel(
      date: date ?? this.date,
      available: available ?? this.available,
      holiday: holiday ?? this.holiday,
      hours: hours ?? this.hours,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'available': available,
      'holiday': holiday,
      'hours': hours.map((x) => x.toMap()).toList(),
    };
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      date: map['date'] as String,
      available: map['available'] as bool,
      holiday: map['holiday'] as bool,
      hours: List<HourModel>.from(
        (map['hours']).map<HourModel>(
          (x) => HourModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DateModel.fromJson(String source) =>
      DateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [date, available, holiday, hours];
}

class HourModel extends Equatable {
  final String startTime;
  final String endTime;
  final String programName;
  final String programDetails;

  const HourModel({
    required this.startTime,
    required this.endTime,
    required this.programName,
    required this.programDetails,
  });

  HourModel copyWith({
    String? startTime,
    String? endTime,
    String? programName,
    String? programDetails,
  }) {
    return HourModel(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      programName: programName ?? this.programName,
      programDetails: programDetails ?? this.programDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'programName': programName,
      'programDetails': programDetails,
    };
  }

  factory HourModel.fromMap(Map<String, dynamic> map) {
    return HourModel(
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      programName: map['programName'] as String,
      programDetails: map['programDetails'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourModel.fromJson(String source) =>
      HourModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [startTime, endTime, programName, programDetails];
}
