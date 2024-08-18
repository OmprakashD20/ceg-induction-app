import 'dart:convert';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:induction_app/utils/typedefs.dart';
import 'package:intl/intl.dart';

class NotificationModel extends Equatable {
  final String title;
  final DateTime dateTime;
  final bool image;
  final String? path;
  final String? url;
  final String? content;
  final RecencyLabel? recencyLabel;
  final bool? isFirstInGroup;

  const NotificationModel({
    required this.title,
    required this.dateTime,
    required this.image,
    this.path,
    this.url,
    this.content,
    this.recencyLabel,
    this.isFirstInGroup,
  });

  NotificationModel copyWith({
    String? title,
    DateTime? dateTime,
    bool? image,
    String? path,
    String? url,
    String? content,
    RecencyLabel? recencyLabel,
    bool? isFirstInGroup,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      image: image ?? this.image,
      path: path ?? this.path,
      url: url ?? this.url,
      content: content ?? this.content,
      recencyLabel: recencyLabel ?? this.recencyLabel,
      isFirstInGroup: isFirstInGroup ?? this.isFirstInGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'image': image,
      'path': path,
      'url': url,
      'content': content,
      'recencyLabel': recencyLabel,
      'isFirstInGroup': isFirstInGroup,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    String generateRandom24HourTime() {
      // Create a random number generator
      Random random = Random();

      // Generate random hour (0-23)
      int hour = random.nextInt(24);

      // Generate random minute (0-59)
      int minute = random.nextInt(60);

      // Format the hour and minute to ensure two digits
      String formattedHour = hour.toString().padLeft(2, '0');
      String formattedMinute = minute.toString().padLeft(2, '0');

      // Combine the hour and minute to form the 24-hour time
      return '$formattedHour:$formattedMinute';
    }

    return NotificationModel(
      title: map['title'] as String,
      dateTime: DateTime.parse('${map['date']} ${generateRandom24HourTime()}'),
      image: map['image'] as bool,
      path: map['path'] != null ? map['path'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      recencyLabel: map['recencyLabel'] != null
          ? RecencyLabel.values.firstWhere(
              (element) => element.toString() == map['recencyLabel'],
            )
          : null,
      isFirstInGroup: map['isFirstInGroup'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<NotificationModel> processNotifications(
      List<NotificationModel> notifications) {
    notifications.sort(
      (a, b) => b.dateTime.compareTo(a.dateTime),
    );

    List<NotificationModel> processedNotifications = [];

    for (int i = 0; i < notifications.length; i++) {
      final element = notifications[i];
      final dateTime = element.dateTime;

      RecencyLabel recencyLabel;
      String date = DateFormat('dd-MM-yyyy').format(dateTime);
      String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      String yesterdayDate = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().subtract(const Duration(days: 1)));

      if (date == todayDate) {
        recencyLabel = RecencyLabel.Today;
      } else if (date == yesterdayDate) {
        recencyLabel = RecencyLabel.Yesterday;
      } else {
        recencyLabel = RecencyLabel.Old;
      }

      bool isFirstInGroup =
          i == 0 || recencyLabel != processedNotifications[i - 1].recencyLabel;

      processedNotifications.add(element.copyWith(
        recencyLabel: recencyLabel,
        isFirstInGroup: isFirstInGroup,
      ));
    }
    return processedNotifications;
  }

  @override
  List<Object?> get props => [
        title,
        dateTime,
        image,
        path,
        url,
        content,
        recencyLabel,
        isFirstInGroup
      ];
}
