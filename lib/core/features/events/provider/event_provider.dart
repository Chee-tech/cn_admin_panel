import '../../../core_pattern/utils/package_export.dart';
import '../../Events/model/event_model.dart';
import '../services/event_services.dart';

class EventProvider with ChangeNotifier {
  List<EventModel> _allEvent = [];
  List<EventModel> get allEvent => _allEvent;
  bool _haveAllEventData = false;
  bool get haveAllEventData => _haveAllEventData;

  List<EventModel> _randomEvent = [];
  List<EventModel> get randomEvent => _randomEvent;
  bool _haveRandomEventData = false;
  bool get haveRandomEventData => _haveRandomEventData;

  List<EventModel> _allCNEvent = [];
  List<EventModel> get allCNEvent => _allCNEvent;
  bool _haveCNEventData = false;
  bool get haveCNEventData => _haveCNEventData;

  List<EventModel> _userInterestedEvent = [];
  List<EventModel> get userInterestedEvent => _userInterestedEvent;
  bool _haveUserInterestedData = false;
  bool get haveUserInterestedData => _haveUserInterestedData;

  List<EventModel> _eventNearYou = [];
  List<EventModel> get eventNearYou => _eventNearYou;
  bool _haveEventNearYouData = false;
  bool get haveEventNearYouData => _haveEventNearYouData;

  List<EventModel> _allEventCategory = [];
  List<EventModel> get allEventCategory => _allEventCategory;
  bool _haveAllEventCategoryData = false;
  bool get haveAllEventCategoryData => _haveAllEventCategoryData;

  List<EventModel> _allEventStatus = [];
  List<EventModel> get allEventStatus => _allEventStatus;
  bool _haveAllEventStatusData = false;
  bool get haveAllEventStatusData => _haveAllEventStatusData;

  List<EventModel> _allHostEvent = [];
  List<EventModel> get allHostEvent => _allHostEvent;
  bool _haveAllHostEventData = false;
  bool get haveAllHostEventData => _haveAllHostEventData;

  EventModel _eventDetails = EventModel();
  EventModel get eventDetails => _eventDetails;
  bool _haveEventDetailsData = false;
  bool get haveEventDetailsData => _haveEventDetailsData;

  final EventsService _services = EventsService();

  getAllEventList(context) async {
    _haveAllEventData = true;
    // notifyListeners();
    _allEvent = await _services.getAllEventList();
    _haveAllEventData = false;
    notifyListeners();
  }

  getAllRandomEvent(context) async {
    _haveRandomEventData = true;
    //  notifyListeners();
    _randomEvent = await _services.getAllRandomEvent();
    _haveRandomEventData = false;
    notifyListeners();
  }

  getAllCNEvent(context) async {
    _haveCNEventData = true;
    // notifyListeners();
    _allCNEvent = await _services.getAllCNEvent();
    _haveCNEventData = false;
    notifyListeners();
  }

  getAllLoadedCNEvent(context) async {
    _allCNEvent = await _services.getAllCNEvent();
    notifyListeners();
  }

  getUserInterestedEvent(context) async {
    _haveUserInterestedData = true;
    // notifyListeners();
    _userInterestedEvent = await _services.getUserInterestedEvent();
    _haveUserInterestedData = false;
    notifyListeners();
  }

  getEventNearYou(
      context, String city, String longitude, String latitude) async {
    _haveEventNearYouData = true;
    // notifyListeners();
    _eventNearYou =
        await _services.getAllEventNearYou(city, longitude, latitude);
    _haveEventNearYouData = false;
    notifyListeners();
  }

  getAllEventCategory(context, String eventCategory) async {
    _haveAllEventCategoryData = true;
    // notifyListeners();
    _allEventCategory = await _services.getEventCategories(eventCategory);
    _haveAllEventCategoryData = false;
    notifyListeners();
  }

  getAllEventStatus(context, String eventStatus) async {
    _haveAllEventStatusData = true;
    // notifyListeners();
    _allEventStatus = await _services.getAllEventStatus(eventStatus);
    _haveAllEventStatusData = false;
    notifyListeners();
  }

  getAllHostEvent(context, String hostId) async {
    _haveAllHostEventData = true;
    // notifyListeners();
    _allHostEvent = await _services.getAllHostEvent(hostId);
    _haveAllHostEventData = false;
    notifyListeners();
  }

  getEventDetails(context, String eventId) async {
    _haveEventDetailsData = true;
    // notifyListeners();

    void getAllLoadedCNEvent(BuildContext context) {}
    _eventDetails = await _services.getEventDetails(eventId);
    _haveEventDetailsData = false;
    notifyListeners();
  }
}

final eventProvider = ChangeNotifierProvider<EventProvider>(
  (ref) => EventProvider(),
);
