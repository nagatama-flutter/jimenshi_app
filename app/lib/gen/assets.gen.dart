/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $GoogleFontsGen {
  const $GoogleFontsGen();

  /// File path: google_fonts/NotoSansJP-Black.ttf
  String get notoSansJPBlack => 'google_fonts/NotoSansJP-Black.ttf';

  /// File path: google_fonts/NotoSansJP-Bold.ttf
  String get notoSansJPBold => 'google_fonts/NotoSansJP-Bold.ttf';

  /// File path: google_fonts/NotoSansJP-ExtraBold.ttf
  String get notoSansJPExtraBold => 'google_fonts/NotoSansJP-ExtraBold.ttf';

  /// File path: google_fonts/NotoSansJP-ExtraLight.ttf
  String get notoSansJPExtraLight => 'google_fonts/NotoSansJP-ExtraLight.ttf';

  /// File path: google_fonts/NotoSansJP-Light.ttf
  String get notoSansJPLight => 'google_fonts/NotoSansJP-Light.ttf';

  /// File path: google_fonts/NotoSansJP-Medium.ttf
  String get notoSansJPMedium => 'google_fonts/NotoSansJP-Medium.ttf';

  /// File path: google_fonts/NotoSansJP-Regular.ttf
  String get notoSansJPRegular => 'google_fonts/NotoSansJP-Regular.ttf';

  /// File path: google_fonts/NotoSansJP-SemiBold.ttf
  String get notoSansJPSemiBold => 'google_fonts/NotoSansJP-SemiBold.ttf';

  /// File path: google_fonts/NotoSansJP-Thin.ttf
  String get notoSansJPThin => 'google_fonts/NotoSansJP-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        notoSansJPBlack,
        notoSansJPBold,
        notoSansJPExtraBold,
        notoSansJPExtraLight,
        notoSansJPLight,
        notoSansJPMedium,
        notoSansJPRegular,
        notoSansJPSemiBold,
        notoSansJPThin
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/correct.png
  AssetGenImage get correct => const AssetGenImage('assets/images/correct.png');

  /// File path: assets/images/failure.png
  AssetGenImage get failure => const AssetGenImage('assets/images/failure.png');

  /// File path: assets/images/halison.png
  AssetGenImage get halison => const AssetGenImage('assets/images/halison.png');

  /// File path: assets/images/simazaki.png
  AssetGenImage get simazaki =>
      const AssetGenImage('assets/images/simazaki.png');

  /// File path: assets/images/tower.jpg
  AssetGenImage get tower => const AssetGenImage('assets/images/tower.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [correct, failure, halison, simazaki, tower];
}

class $AssetsVideosGen {
  const $AssetsVideosGen();

  /// File path: assets/videos/background.mp4
  String get background => 'assets/videos/background.mp4';

  /// File path: assets/videos/cut_in.mp4
  String get cutIn => 'assets/videos/cut_in.mp4';

  /// File path: assets/videos/simazaki_juggling.mp4
  String get simazakiJuggling => 'assets/videos/simazaki_juggling.mp4';

  /// File path: assets/videos/simazaki_normal.mp4
  String get simazakiNormal => 'assets/videos/simazaki_normal.mp4';

  /// File path: assets/videos/simazaki_smile.mp4
  String get simazakiSmile => 'assets/videos/simazaki_smile.mp4';

  /// File path: assets/videos/simazaki_surprise.mp4
  String get simazakiSurprise => 'assets/videos/simazaki_surprise.mp4';

  /// List of all assets
  List<String> get values => [
        background,
        cutIn,
        simazakiJuggling,
        simazakiNormal,
        simazakiSmile,
        simazakiSurprise
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVideosGen videos = $AssetsVideosGen();
  static const $GoogleFontsGen googleFonts = $GoogleFontsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
