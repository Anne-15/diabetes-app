import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class CalendarClient {
  // For storing the CalendarApi object, this can be used
  // for performing all the operation
  static var calendar;
  // For creating a new calendar event
  Future<Map<String, String>> insert({
    required String title,
    required String description,
    required String location,
    required String attendeeEmailList,
    required bool hasConferenceSupport,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    Map<String, String> eventData = {};

    // If the account has multiple calendars, then select the "primary" one
    String calendarId = "primary";
    Event event = Event();
    var calendar =
        CalendarApi(await clientViaApplicationDefaultCredentials(scopes: []));

    event.summary = title;
    event.description = description;
    event.attendees = [EventAttendee(email: attendeeEmailList)];
    event.location = location;

    if (hasConferenceSupport) {
      ConferenceData conferenceData = ConferenceData();
      CreateConferenceRequest conferenceRequest = CreateConferenceRequest();
      conferenceRequest.requestId =
          "${startTime.millisecondsSinceEpoch}-${endTime.millisecondsSinceEpoch}";
      conferenceData.createRequest = conferenceRequest;

      event.conferenceData = conferenceData;
    }

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+05:30";
    event.start = start;

    EventDateTime end = EventDateTime();
    end.timeZone = "GMT+05:30";
    end.dateTime = endTime;
    event.end = end;

    try {
      Event value = await calendar.events.insert(
        event,
        calendarId,
        conferenceDataVersion: hasConferenceSupport ? 1 : 0,
      );

      print("Event Status: ${value.status}");
      if (value.status == "confirmed") {
        String joiningLink = ''; 
        String eventId;

        eventId = value.id!;

        if (hasConferenceSupport) {
          joiningLink =
              "https://meet.google.com/${value.conferenceData?.conferenceId}";
        }

        eventData = {'id': eventId, 'link': joiningLink};

        print('Event added to Google Calendar');
        print('eventData: $eventData');
      } else {
        print("Unable to add event to Google Calendar");
      }
    } catch (e) {
      print('Error creating event $e');
    }

    return eventData;
  }

  // For patching an already-created calendar event
  Future<Map<String, String>> modify({
    required String id,
    required String title,
    required String description,
    required String location,
    required String attendeeEmailList,
    required bool hasConferenceSupport,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    Map<String, String> eventData = {};

    String calendarId = "primary";
    Event event = Event();
    var calendar =
        CalendarApi(await clientViaApplicationDefaultCredentials(scopes: []));

    event.summary = title;
    event.description = description;
    event.attendees = [EventAttendee(email: attendeeEmailList)];
    event.location = location;

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+05:30";
    event.start = start;

    EventDateTime end = EventDateTime();
    end.timeZone = "GMT+05:30";
    end.dateTime = endTime;
    event.end = end;

    try {
      final response = await calendar.events.patch(
        event,
        calendarId,
        id,
        conferenceDataVersion: hasConferenceSupport ? 1 : 0,
      );

      if (response.status == "confirmed") {
        String joiningLink = '';
        String eventId;

        eventId = response.id!;

        if (hasConferenceSupport) {
          joiningLink =
              "https://meet.google.com/${response.conferenceData?.conferenceId}";
        }

        eventData = {'id': eventId, 'link': joiningLink};

        print('Event updated in Google Calendar');
      } else {
        print("Unable to update event in Google Calendar");
      }
    } catch (e) {
      print('Error updating event $e');
    }

    return eventData;
  }

  // For deleting a calendar event
  Future<void> delete(String eventId, bool shouldNotify) async {
    String calendarId = "primary";
    var calendar =
        CalendarApi(await clientViaApplicationDefaultCredentials(scopes: []));

    try {
      await calendar.events
          .delete(calendarId, eventId,
              sendUpdates: shouldNotify ? "all" : "none")
          .then((value) {
        print('Event deleted from Google Calendar');
      });
    } catch (e) {
      print('Error deleting event: $e');
    }
  }
}
