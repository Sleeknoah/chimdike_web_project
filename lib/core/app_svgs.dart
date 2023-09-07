import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_project/core/app_colors.dart';

class AppSvgs {
  static Widget github() {
    return SvgPicture.asset(
      'assets/icons/github.svg',
      width: 25,
      height: 25,
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget twitter() {
    return SvgPicture.asset(
      'assets/icons/twitter.svg',
      width: 20,
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget android() {
    return SvgPicture.asset(
      'assets/icons/android.svg',
      width: 20,
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget code() {
    return SvgPicture.asset(
      'assets/icons/code.svg',
      width: 20,
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget light() {
    return SvgPicture.asset(
      'assets/icons/light.svg',
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget mobile() {
    return SvgPicture.asset(
      'assets/icons/mobile.svg',
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }

  static Widget dark() {
    return SvgPicture.asset(
      'assets/icons/moon.svg',
      width: 20,
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.activeColor,
        BlendMode.srcIn,
      ),
    );
  }
}
