import 'package:fpdart/fpdart.dart';
import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:induction_app/models/models.dart';
import 'package:induction_app/utils/errors.dart';
import 'package:induction_app/utils/typedefs.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class IHelpers {
  static Future<void> launch(
    Uri url,
    String name,
  ) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ISnackBar.customToast(
        type: SnackBarType.error,
        title: "Oops! $name Redirect Failed.",
        subTitle:
            "We couldn't make a redirect to your ${name.toLowerCase()} right now",
      );

      throw 'Could not launch $url';
    }
  }

  static Future<void> phoneCall({required String phoneNo}) async {
    final Uri url = Uri(scheme: "tel", path: phoneNo);
    launch(url, "Phone Call");
  }

  static Future<void> whatsappMessage({required String phoneNo}) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNo?text=Hi");
    launch(url, "Whatsapp");
  }

  static Future<void> socials({required String link}) async {
    final Uri url = Uri.parse(link);
    launch(url, "Socials");
  }

  static Future<void> sendEmail(
      {required String email, String subject = "", String body = ""}) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    launch(url, "GMail");
  }

  static Future<void> openMap(String mapUrl) async {
    final Uri url = Uri.parse(mapUrl);
    launch(url, "Google Maps");
  }

  static BatchModel getStudentBatch(List<BatchModel> batches, String batchId) {
    return batches.firstWhere((batch) => batch.batchId == batchId);
  }

  static DateModel getSelectedDate(
      BatchModel batch, int selectedDayIndex, int weekIndex) {
    return batch.dates[weekIndex * 7 + selectedDayIndex];
  }

  static DateModel getCurrentDaySchedule(BatchModel batch) {
    final currentDate =
        DateTime.now().toLocal().toIso8601String().split('T').first;

    final dates = batch.dates;

    return dates.firstWhere((date) => date.date == currentDate);
  }

  static String formatDate(String dateStr) {
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    final DateTime date = inputFormat.parse(dateStr);

    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      final DateFormat outputFormat = DateFormat('MMM d, yyyy');
      return outputFormat.format(date);
    }
  }

  static String formatTimeRange(String startTime, String endTime) {
    final DateFormat inputFormat = DateFormat('HH:mm');
    final DateFormat outputFormat = DateFormat('h:mma');

    final DateTime startDateTime = inputFormat.parse(startTime);
    final DateTime endDateTime = inputFormat.parse(endTime);

    final String formattedStartTime =
        outputFormat.format(startDateTime).toLowerCase();
    final String formattedEndTime =
        outputFormat.format(endDateTime).toLowerCase();

    return '$formattedStartTime to $formattedEndTime';
  }

  static bool isProgramOngoing(
      String startTimeStr, String endTimeStr, String dateStr) {
    final DateFormat timeFormat = DateFormat('HH:mm');
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    final DateTime now = DateTime.now();
    final DateTime date = dateFormat.parse(dateStr);

    final DateTime startTime = timeFormat.parse(startTimeStr);
    final DateTime endTime = timeFormat.parse(endTimeStr);

    final DateTime programStart = DateTime(
        date.year, date.month, date.day, startTime.hour, startTime.minute);
    final DateTime programEnd =
        DateTime(date.year, date.month, date.day, endTime.hour, endTime.minute);

    return now.isAfter(programStart) && now.isBefore(programEnd);
  }

  static List<HourModel> getSortedHours(List<HourModel> hours) {
    final DateTime now = DateTime.now();

    final List<HourModel> upcomingHours = hours.where((hour) {
      final DateTime startTime = _createDateTimeFromTime(hour.startTime);
      return now.isBefore(startTime);
    }).toList();

    final List<HourModel> currentHours = hours.where((hour) {
      final DateTime startTime = _createDateTimeFromTime(hour.startTime);
      final DateTime endTime = _createDateTimeFromTime(hour.endTime);
      return now.isAfter(startTime) && now.isBefore(endTime);
    }).toList();

    final List<HourModel> pastHours = hours.where((hour) {
      final DateTime endTime = _createDateTimeFromTime(hour.endTime);
      return now.isAfter(endTime);
    }).toList();

    upcomingHours.sort((a, b) {
      final DateTime aStart = _createDateTimeFromTime(a.startTime);
      final DateTime bStart = _createDateTimeFromTime(b.startTime);
      return aStart.compareTo(bStart);
    });

    currentHours.sort((a, b) {
      final DateTime aStart = _createDateTimeFromTime(a.startTime);
      final DateTime bStart = _createDateTimeFromTime(b.startTime);
      return aStart.compareTo(bStart);
    });

    pastHours.sort((a, b) {
      final DateTime aStart = _createDateTimeFromTime(a.startTime);
      final DateTime bStart = _createDateTimeFromTime(b.startTime);
      return aStart.compareTo(bStart);
    });

    return upcomingHours + currentHours + pastHours;
  }

  static bool isProgramEnded(String dateStr, String endTimeStr) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateTime now = DateTime.now();

    final DateTime programDate = dateFormat.parse(dateStr);
    final DateTime programEndTime =
        _createDateTimeFromTime(endTimeStr, date: programDate);

    final bool isToday = programDate.year == now.year &&
        programDate.month == now.month &&
        programDate.day == now.day;

    if (isToday) {
      return now.isAfter(programEndTime);
    } else {
      return now.isAfter(programEndTime);
    }
  }

  static DateTime _createDateTimeFromTime(String timeStr, {DateTime? date}) {
    date = date ?? DateTime.now();
    final DateFormat timeFormat = DateFormat('HH:mm');
    final DateTime time = timeFormat.parse(timeStr);
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static T? extractRightFromEither<T>(Either<Failure, T?> either) {
    return either.fold((left) {
      if (T == bool) return false as T;
      if (T == String) return "" as T;
      if (T == int) return 0 as T;
      if (T == double) return 0.0 as T;
      return null;
    }, (right) => right);
  }

  static Future<T?> extractRightFromFutureEither<T>(
      FutureEither<T> futureEither) async {
    final either = await futureEither;
    return either.fold((left) {
      if (T == bool) return false as T;
      if (T == String) return "" as T;
      if (T == int) return 0 as T;
      if (T == double) return 0.0 as T;
      return null;
    }, (right) => right);
  }

  static String padHourWithZero(String dateTimeString) {
    if (dateTimeString.contains(' ') &&
        !dateTimeString.split(' ')[1].startsWith('0')) {
      DateTime dateTime = DateFormat('yyyy-MM-dd H:mm').parse(dateTimeString);
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    } else {
      return dateTimeString;
    }
  }
}
