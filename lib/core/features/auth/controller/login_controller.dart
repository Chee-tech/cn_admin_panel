// ignore_for_file: use_build_context_synchronously

import 'package:cn_admin_panel/core/core_pattern/services/auth_service.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';

import '../../../core_pattern/utils/package_export.dart';
import '../../home.dart';
import '../login/logins.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => LoginScreensController();
}

class LoginScreensController extends State<LoginScreens> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? email = "";
  String? password = "";
  bool saveButtonPressed = false;
  int currentIndex = 0;
  bool switchvalue = false;
  bool isLoading = false;
  // late Login login;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isChecked = false;
  urlString(String? url) async {
    final link = Uri.parse(url!);
    if (await canLaunchUrl(link)) {
      await launchUrl(link, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  onChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  obscureTextPassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  loginUser() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      final res = await AuthService.userLogin(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          cxt: context);

      if (res.statusCode == 200 || res.statusCode == 201) {
        setState(() {
          isLoading = false;
        });

        navigateAndRemoveUntilRoute(context, const MyHomePage());
      } else {
        setState(() {
          isLoading = false;
        });
        showInfoAlertWithAction(
            context, "Login Error", "User Does Not Exist", () {});
      }
      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreensView(this);
  }
}
