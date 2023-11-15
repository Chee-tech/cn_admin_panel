class Endpoints {
  static String baseUrl = "https://api-code.cnticketstravels.com/";
  static String usersUrl = "Admin";
  static String usersLoginUrl = "Admin/login";
  static String emailVerificationUrl = "Admin/Email-Verification";
  static String phoneNoVerificationUrl = "Admin/PhoneNo-Verification";
  static String twoFactorEnabledUrl = "Admin/TwoFactor-Enabled";
  static String forgetPasswordUrl = "Admin/ForgotPassword-RequestToken";
  static String resetPasswordUrl = "Admin/Reset-Password";
  static String profileImageUrl = "Admin/ProfileImage";
  static String uploadUrl = "UploadFile/UploadImage";
  static String retailersUrl = "Retailers";
  static String resendEmailVerificationTokenUrl =
      "Admin/EmailVerification-RequestToken";
  static String contactUsUrl = "Info/ContactUs";
  static String retailersRequestUrl = "Info/RetailerRequest";

  static String weeklyTicketNoUrl = "WeeklyTicketNo";
  static String monthlyTicketNoUrl = "MonthlyTicketNos";

  static String usersTicketsUrl = "usersTickets";
  static String weeklyTicketSalesUrl = "WeeklyTicketDraw";
  static String monthlyTicketSalesUrl = "MonthlyTicketDraw";
  static String drawSchedule = "Admin/AllDrawShedule";
  static String eventUrl = "Event/all-events";
  static String eventDetailsUrl = "Event/single-event/";
  static String eventStatusUrl = "Event/events-status";
  static String eventCategoryUrl = "Event/events-categories";
  static String userInterestedEventUrl = "Event/user-interested-events";
  static String userAttendingEventUrl = "Event/user-attending-events";
  static String randomListEventUrl = "Event/random-event-list";
  static String cnEventUrl = "Event/cn-events-list";
  static String fiveEventStatusUrl = "Event/five-events-status";
  static String fiveRandomEventUrl = "Event/five-event-list";
  static String fiveEventNearYouUrl = "Event/five-events-near-you";
  static String interestedEvent = "Event/event-interested";
  static String attendingEvent = "Event/event-attending";
  static String eventsHost = "Event/host-events";
  static String shareEvent = "Event/event-shares";
  static String votingSystemUrl = "EventsShowCompetition";
  static String addACompetitorUrl = "EventsShowCompetition/event-competitors";
  static String addACompetitorVoteUrl =
      "EventsShowCompetition/competitors-voters-count";
  static String addACompetitionReviewUrl =
      "EventsShowCompetition/competition-review";
  static String courseUrl = "Course";
  static String courseBannerImageUrl = "Course/course-banner-image";
  static String courseTrainingUrl = "Course/trainings";
}
