import 'dart:convert';

import '../api/user_api.dart';
import '../models/models.dart';
import '../utils/errors.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository({UserApi? userApi}) : _userApi = userApi ?? UserApi();

  Future<UserModel> fetchUser({
    required String rollNo,
  }) async {
    final response = await _userApi.fetchUserJsonData();

    return response.fold((l) {
      throw DataNotFoundException(message: l.message);
    }, (userJson) {
      final jsonData = json.decode(userJson) as Map<String, dynamic>;

      final users = List<UserModel>.from(
        (jsonData['users'] as List).map(
          (user) => UserModel.fromMap(user),
        ),
      );

      return users.firstWhere(
        (user) => user.rollNo == rollNo,
        orElse: () => UserModel.empty(),
      );
    });
  }

  Future<List<FAQModel>> fetchFAQs() async {
    final response = await _userApi.fetchFaqsJsonData();

    return response.fold((l) {
      throw DataNotFoundException(message: l.message);
    }, (faqsJson) {
      final jsonData = json.decode(faqsJson) as Map<String, dynamic>;

      return List<FAQModel>.from(
        (jsonData['faqs'] as List).map(
          (faq) => FAQModel.fromMap(faq),
        ),
      );
    });
  }

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await _userApi.fetchNotificationsJsonData();

    return response.fold((l) {
      throw DataNotFoundException(message: l.message);
    }, (notificationsJson) {
      final jsonData = json.decode(notificationsJson) as Map<String, dynamic>;

      return List<NotificationModel>.from(
        (jsonData['notifications'] as List).map(
          (notification) => NotificationModel.fromMap(notification),
        ),
      );
    });
  }

  Future<List<PlaceModel>> fetchPlaces() async {
    final response = await _userApi.fetchPlacesJsonData();

    return response.fold((l) {
      throw DataNotFoundException(message: l.message);
    }, (placesJson) {
      final jsonData = json.decode(placesJson) as Map<String, dynamic>;

      return List<PlaceModel>.from(
        (jsonData['places'] as List).map(
          (place) => PlaceModel.fromMap(place),
        ),
      );
    });
  }

  Future<ScheduleModel> fetchSchedule() async {
    final response = await _userApi.fetchScheduleJsonData();

    return response.fold((l) {
      throw DataNotFoundException(message: l.message);
    }, (scheduleJson) {
      final jsonData = json.decode(scheduleJson) as Map<String, dynamic>;

      return ScheduleModel.fromMap(jsonData);
    });
  }
}
