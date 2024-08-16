import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String title;
  final String date;
  final String time;
  final bool image;
  final String? path;
  final String? url;

  const NotificationModel({
    required this.title,
    required this.date,
    required this.time,
    required this.image,
    required this.url,
    this.path,
  });

  NotificationModel copyWith({
    String? title,
    String? date,
    String? time,
    bool? image,
    String? path,
    String? url,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      image: image ?? this.image,
      path: path ?? this.path,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'time': time,
      'image': image,
      'path': path,
      'url': url,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      image: map['image'] as bool,
      path: map['path'] != "" ? map['path'] as String : null,
      url: map['url'] != "" ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [title, date, time, image, path];
}
