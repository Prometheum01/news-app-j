import 'package:news_app_for_job/core/extensions/string_extension.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  static Future<void> customLaunchUrl(String url) async {
    final Uri uri = Uri.https(
      url.divideAuthority.toString(),
      url.divideParams.toString(),
    );

    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw StringConst.cantLaunchUrl;
    }
  }
}
