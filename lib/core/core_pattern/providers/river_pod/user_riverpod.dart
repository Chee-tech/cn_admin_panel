import 'package:cn_admin_panel/core/core_pattern/model/register_response_model.dart';
import 'package:cn_admin_panel/core/core_pattern/services/user_services.dart';
import '../../../features/home/model/advert_model.dart';
import '../../utils/package_export.dart';

class UserProvider with ChangeNotifier {
  RegisterResponseModel userData = RegisterResponseModel();
  bool haveData = false;
  bool haveAdvertData = false;
  bool haveDrawSheduleData = false;
  List<AdvertBannerModel> advertData = [];

  bool loading = false;
  final UserService _services = UserService();

  getPostData(context) async {
    loading = true;
    // notifyListeners();
    userData = await _services.getData();
    loading = false;
    notifyListeners();
  }

  advertInit(context) async {
    haveAdvertData = true;
    notifyListeners();
    advertData = await _services.getAllAdvert();
    haveAdvertData = false;
    notifyListeners();
  }

  drawSheduleInit(context) async {
    haveDrawSheduleData = true;
    notifyListeners();
    haveDrawSheduleData = false;
    notifyListeners();
  }

  updateProfilePics({
    required String imagePath,
    required String userId,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateProfilePics(
      imagePath: imagePath,
      userId: userId,
    );
    loading = false;
    notifyListeners();
  }

  updateProfileInfo({
    required String userId,
    required String firstName,
    required String surName,
    required String phoneNo,
    required String address,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateProfileInfo(
      userId: userId,
      firstName: firstName,
      surName: surName,
      phoneNo: phoneNo,
      address: address,
    );
    loading = false;
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider<UserProvider>(
  (ref) => UserProvider(),
);
