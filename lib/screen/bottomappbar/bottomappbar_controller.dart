import '../../base/base_controller.dart';
import '../mainpage/mainpage_view.dart';
import '../profile/profile_view.dart';

class BottomappbarController extends BaseController{
  int indexHalaman = 0;

  List screen = [
    const MainpageView(),
    const ProfileView()
  ];
}