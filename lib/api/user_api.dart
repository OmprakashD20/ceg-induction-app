import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import 'package:induction_app/utils/typedefs.dart';

import '../utils/errors.dart';

class UserApi {
  final http.Client _httpClient;
  UserApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'induction-cms.krk.org.in/redfiles/json/';
  static const Map<String, String> _jsonLists = {
    'users': 'users.json',
    'schedule': 'schedule.json',
    'places': 'places.json',
    'faqs': 'faqs.json',
    'notifications': 'notifications.json',
    'events': 'programDetails.json',
  };

  //fetch user json data
  FutureEither<String> fetchUserJsonData() async {
    final userRequest = Uri.https(_baseUrl, _jsonLists['users']!);

    final userResponse = await _httpClient.get(userRequest);

    if (userResponse.statusCode != 200) {
      return const Left(
        Failure(message: 'Error fetching user data'),
      );
    }

    return Right(userResponse.body);
  }

  //fetch schedule json data
  FutureEither<String> fetchScheduleJsonData() async {
    final scheduleRequest = Uri.https(_baseUrl, _jsonLists['schedule']!);

    final scheduleResponse = await _httpClient.get(scheduleRequest);

    if (scheduleResponse.statusCode != 200) {
      return const Left(
        Failure(message: 'Error fetching schedule data'),
      );
    }

    return Right(scheduleResponse.body);
  }

  //fetch places json data
  FutureEither<String> fetchPlacesJsonData() async {
    final placesRequest = Uri.https(_baseUrl, _jsonLists['places']!);

    final placesResponse = await _httpClient.get(placesRequest);

    if (placesResponse.statusCode != 200) {
      return const Left(
        Failure(message: 'Error fetching places data'),
      );
    }

    return Right(placesResponse.body);
  }

  //fetch faqs json data
  FutureEither<String> fetchFaqsJsonData() async {
    final faqsRequest = Uri.https(_baseUrl, _jsonLists['faqs']!);

    final faqsResponse = await _httpClient.get(faqsRequest);

    if (faqsResponse.statusCode != 200) {
      throw Exception('Error fetching faqs data');
    }

    return Right(faqsResponse.body);
  }

  //fetch notifications json data
  FutureEither<String> fetchNotificationsJsonData() async {
    final notificationsRequest =
        Uri.https(_baseUrl, _jsonLists['notifications']!);

    final notificationsResponse = await _httpClient.get(notificationsRequest);

    if (notificationsResponse.statusCode != 200) {
      return const Left(
        Failure(message: 'Error fetching notifications data'),
      );
    }

    return Right(notificationsResponse.body);
  }

  //fetch events json data
  FutureEither<String> fetchEventsJsonData() async {
    final eventsRequest = Uri.https(_baseUrl, _jsonLists['events']!);

    final eventsResponse = await _httpClient.get(eventsRequest);

    if (eventsResponse.statusCode != 200) {
      return const Left(
        Failure(message: 'Error fetching events data'),
      );
    }

    return Right(eventsResponse.body);
  }
}
