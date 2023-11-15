import '../../../core_pattern/utils/package_export.dart';
import '../model/advert_model.dart';
import '../model/couser_applicant_model.dart';
import '../services/home_service.dart';

class HomeProvider with ChangeNotifier {
  bool haveAdvertData = false;
  List<AdvertBannerModel> advertData = [];

  List<CourseApplicantModel> _courseApplicantModel = [];
  List<CourseApplicantModel> get courseApplicantModel => _courseApplicantModel;
  bool _haveCourseApplicantModelData = false;
  bool get haveCourseApplicantModelData => _haveCourseApplicantModelData;

  final HomeService _services = HomeService();

  getAllAdvert(context) async {
    haveAdvertData = true;
    //  notifyListeners();
    advertData = await _services.getAllAdvert();
    haveAdvertData = false;
    notifyListeners();
  }

  getAllCourseApplicant(context) async {
    _haveCourseApplicantModelData = true;
    //  notifyListeners();
    _courseApplicantModel = await _services.getAllApplicants();
    _haveCourseApplicantModelData = false;
    notifyListeners();
  }
}

final homeProvider = ChangeNotifierProvider<HomeProvider>(
  (ref) => HomeProvider(),
);
