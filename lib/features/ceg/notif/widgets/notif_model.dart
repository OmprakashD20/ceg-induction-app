//Student ScreenItem model
import 'package:intl/intl.dart';

class MessageNotifModel {
  DateTime dateTime;
  String title;
  String content;
  String receiveStatus;
  bool receiveStatusFirst;
  // Constructor
  MessageNotifModel(
      {required this.dateTime,
      required this.title,
      required this.content,
      this.receiveStatus = "",
      this.receiveStatusFirst = false});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['dateTime'] = dateTime;
    return data;
  }

  //Convert json to Model
  factory MessageNotifModel.fromJson(Map<String, dynamic> data) {
    return MessageNotifModel(
      title: data["title"] ?? "",
      content: data["content"] ?? "",
      dateTime: data["dateTime"] ?? DateTime.now(),
      receiveStatus: data['receiveStatus'] ?? "",
      receiveStatusFirst: data['receiveStatusFirst'] ?? false,
    );
  }

  static List<Map<String, dynamic>> getUpdatedMessageList(
      {required List<dynamic> messageNotifList}) {
    List<Map<String, dynamic>> updatedMessageList = [];

    for (var element in messageNotifList) {
      updatedMessageList.add(element as Map<String, dynamic>);
    }
    updatedMessageList = updatedMessageList.map((element) => element).toList()
      ..sort((a, b) => b["dateTime"].compareTo(a["dateTime"]));
    for (var element in updatedMessageList) {
      String date = DateFormat('dd-MM-yyyy').format(element["dateTime"]);
      String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      String yesterdayDate = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().subtract(const Duration(days: 1)));
      if (date == todayDate) {
        element["receiveStatus"] = "Today";
      } else if (date == yesterdayDate) {
        element["receiveStatus"] = "Yesterday";
      } else {
        element["receiveStatus"] = "Old";
      }
    }
    for (int i = 0; i < updatedMessageList.length; i++) {
      if (i == 0) {
        updatedMessageList[i]["receiveStatusFirst"] = true;
      } else if (updatedMessageList[i]["receiveStatus"] !=
          updatedMessageList[i - 1]["receiveStatus"]) {
        updatedMessageList[i]["receiveStatusFirst"] = true;
      } else {
        updatedMessageList[i]["receiveStatusFirst"] = false;
      }
    }
    return updatedMessageList;
  }
}

class NotificationRepository {
  static List<MessageNotifModel> fetchCirculars() {
    // final response = await SHttpHelper.post("view_event", {});

    //List<dynamic> events = response['events'];
    List<MessageNotifModel> circularsModelList = [];
    List<dynamic> circulars = circularsList;
    List<Map<String, dynamic>> circularDummyList =
        MessageNotifModel.getUpdatedMessageList(messageNotifList: circulars);
    for (Map<String, dynamic> circular in circularDummyList) {
      MessageNotifModel calenderModel = MessageNotifModel.fromJson(circular);
      circularsModelList.add(calenderModel);
    }
    return circularsModelList;
  }
}

List<dynamic> circularsList = [
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 2, hours: 8, minutes: 35)),
    'title': "Exam Alert",
    'content':
        "Upcoming exams: [Date] to [Date]. Prepare well! Your success begins with focused preparation. Best of luck!",
  },
  {
    'dateTime': DateTime.now(),
    'title': "Sports Day Notice",
    'content':
        "Mark your calendars! Sports Day on [Date]. Join us for a day filled with fun, games, and excitement. See you there!",
  },
  {
    'dateTime': DateTime.now(),
    'title': "Exhibit Your Skills",
    'content':
        "Unleash your creativity at the Science Fair on [Date]. Showcase your talents and explore the wonders of science. Excitement awaits!",
  },
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 8)),
    'title': " Help Needed",
    'content':
        "Be a part of [Event]. Your support is invaluable. Volunteer now to make a difference! Together, we can create memorable experiences.!",
  },
  {
    'dateTime':
        DateTime.now().subtract(const Duration(days: 1, hours: 8, minutes: 35)),
    'title': "Exam Alert",
    'content':
        "Upcoming exams: [Date] to [Date]. Prepare well! Your success begins with focused preparation. Best of luck!",
  },
];
