import '../helpers/endpoints.dart';

class SelectOptionModel {
  String? text;
  String? subtitle;
  String? sales;

  SelectOptionModel({this.text, this.subtitle, this.sales});

  SelectOptionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    subtitle = json['subtitle'];
    sales = json['sales'];
  }
}

List<Map<String, String>> selectOptionData = [
  {
    "subtitle": Endpoints.weeklyTicketNoUrl,
    "text": "Weekly Tickets",
    "sales": Endpoints.weeklyTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.monthlyTicketNoUrl,
    "text": "Monthly Tickets",
    "sales": Endpoints.monthlyTicketSalesUrl,
  },
];
List<SelectOptionModel> formattedSelectOption =
    selectOptionData.map((x) => SelectOptionModel.fromJson(x)).toList();
