Feature: Google Calendar

  Scenario: Changing the time format
    Given User is able to access the Google Calendar
    When User changes the Time Zone
    Then User should be able to change the time zone

  Scenario: Changing the start day of the week
    Given User is able to access the Google Calendar
    When User changes the view for Start of the Week in the setting options
    Then User should be able to change the starting day of the week to what he wants

  Scenario: Enabling Speedy meetings
    Given User is able to access the Google Calendar
    When User changes the event settings and enable speedy meetings
    Then User should be able to end the meeting earlier than scheduled time

  Scenario: Changing the meeting length
    Given User is able to access the Google Calendar
    When User changes the meeting length
    Then User should get notified of the new meeting timings





