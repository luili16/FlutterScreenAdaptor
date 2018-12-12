import 'dart:ui';

import 'package:flutter/widgets.dart';

enum Aspect {
  /// 宽适配
  aspectWidth,

  /// 高适配
  aspectHeight
}

class AutoSize {
  static AutoSize _instance;

  static AutoSize get covert => _instance;

  /// 设计稿的宽
  int _designWidth;

  /// 设计稿的高
  int _designHeight;

  /// 设计稿的像素密度
  double _designDevicePixelRatio;

  /// 适配方式
  Aspect _aspect;

  /// 物理设备的宽
  double _physicalWidth;

  /// 物理设备的高
  double _physicalHeight;

  /// 物理设备的像素密度
  double _devicePixelRatio;

  /// 宽适配时候的比例
  double _ratioW;

  /// 高适配时候的比例
  double _ratioH;

  AutoSize(BuildContext context,
      {int designWidth,
      int designHeight,
      double designDevicePixelRatio,
      Aspect aspect}) {
    _designWidth = designWidth;
    _designHeight = designHeight;
    _designDevicePixelRatio = designDevicePixelRatio;
    _aspect = aspect;
    _devicePixelRatio = window.devicePixelRatio;
    _physicalWidth = window.physicalSize.width;
    _physicalHeight = window.physicalSize.height;
    _ratioW = _physicalWidth / _designWidth;
    _ratioH = _physicalHeight / _designHeight;
    print(
        "_devicePixelRatio:$_devicePixelRatio _physicalWidth:$_physicalWidth _physicalHeight:$_physicalHeight");
    print(
        "_designWidth : $_designWidth _desginHeight : $designHeight __designDevicePixelRatio : $designDevicePixelRatio");
    print("_ratioW : $_ratioW _rationH : $_ratioH");
  }

  ///
  ///
  ///
  ///
  static void init(
      {@required BuildContext context,
      @required int designWidth,
      @required int designHeight,
      @required double designDevicePixelRatio,
      @required Aspect aspect}) {
    if (_instance == null) {
      _instance = new AutoSize(context,
          designWidth: designWidth,
          designHeight: designHeight,
          designDevicePixelRatio: designDevicePixelRatio,
          aspect: aspect);
    }
  }

  /// 将设计稿的px转换为dp
  double pxToDp(int px) {
    if (_aspect == Aspect.aspectWidth) {
      return px * _ratioW / _devicePixelRatio;
    } else {
      return px * _ratioH / _devicePixelRatio;
    }
  }

  /// 将如果设计稿是dp的话，那么就直接传dp，但前提要设置对像素密度
  double dpToDp(double dp) {
    if (_aspect == Aspect.aspectWidth) {
      return (dp * _designDevicePixelRatio) * _ratioW / _devicePixelRatio;
    } else {
      return (dp * _designDevicePixelRatio) * _ratioH / _devicePixelRatio;
    }
  }
}
