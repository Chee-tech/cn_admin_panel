import '../model/onboarding_model.dart';

List<Map<String, String>> onboardingData = [
  {
    "pre": "A Trusted Platform ",
    "text": "Improving the quality of lives & reducing poverty in Africa",
    "image": "assets/images/mux.png"
  },
  {
    "pre": "Giving You Visibility",
    "text": "We are changing the narrative of the Lottery Business in Africa",
    "image": "assets/images/mux1.png"
  },
  {
    "pre": "Enabling You to Earn More",
    "text": "To help people monetize their Tickets for Events on our platform",
    "image": "assets/images/mux2.png"
  },
];
List<OnboardingModel> formattedOnboardingList =
    onboardingData.map((x) => OnboardingModel.fromJson(x)).toList();
