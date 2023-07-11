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
    "subtitle": Endpoints.uniFeeTicketNoUrl,
    "text": "UniFee Tickets",
    "sales": Endpoints.uniFeeTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.billAndTicketNoUrl,
    "text": "Chop & Chill Tickets",
    "sales": Endpoints.billsAndFoodTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.cashBackTicketNoUrl,
    "text": "CashBack Tickets",
    "sales": Endpoints.cashBackTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.teachersSupportTicketNoUrl,
    "text": "Teachers Support Tickets",
    "sales": Endpoints.teachersSupportTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.startUpFundTicketNoUrl,
    "text": "Start Up Fund Tickets",
    "sales": Endpoints.startUpFundTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.nyscSupportTicketNoUrl,
    "text": "NYSC Support Tickets",
    "sales": Endpoints.nyscSupportTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.festiveFortunesTicketNoUrl,
    "text": "Festive Fortunes Ticket",
    "sales": Endpoints.festiveFortunesTicketSalesUrl,
  },
  {
    "subtitle": Endpoints.jackpotTicketNoUrl,
    "text": "JackPot Tickets",
    "sales": Endpoints.jackpotTicketSalesUrl,
  },
  // {
  //   "subtitle":
  //       "Convert your recommendations and referrals into cash as you earn on the go through our bbforce affiliate program.",
  //   "text": "BBForce Member",
  // },
  // {
  //   "subtitle":
  //       "Signing up as a buyer into our platform allows you to get the best you need and also to get a reward for your patronage. ",
  //   "text": "Buyer",
  // },
  // {
  //   "subtitle":
  //       "Numerous buyers are already looking for your products and services, sign up to meet them here",
  //   "text": "Seller/Service Provider",
  // },
  // {
  //   "subtitle":
  //       "Convert your recommendations and referrals into cash as you earn on the go through our bbforce affiliate program.",
  //   "text": "BBForce Member",
  // },
  // {
  //   "subtitle":
  //       "Signing up as a buyer into our platform allows you to get the best you need and also to get a reward for your patronage. ",
  //   "text": "Buyer",
  // },
  // {
  //   "subtitle":
  //       "Numerous buyers are already looking for your products and services, sign up to meet them here",
  //   "text": "Seller/Service Provider",
  // },
  // {
  //   "subtitle":
  //       "Convert your recommendations and referrals into cash as you earn on the go through our bbforce affiliate program.",
  //   "text": "BBForce Member",
  // },
  // {
  //   "subtitle":
  //       "Signing up as a buyer into our platform allows you to get the best you need and also to get a reward for your patronage. ",
  //   "text": "Buyer",
  // },
  // {
  //   "subtitle":
  //       "Numerous buyers are already looking for your products and services, sign up to meet them here",
  //   "text": "Seller/Service Provider",
  // },
  // {
  //   "subtitle":
  //       "Convert your recommendations and referrals into cash as you earn on the go through our bbforce affiliate program.",
  //   "text": "BBForce Member",
  // },
];
List<SelectOptionModel> formattedSelectOption =
    selectOptionData.map((x) => SelectOptionModel.fromJson(x)).toList();
