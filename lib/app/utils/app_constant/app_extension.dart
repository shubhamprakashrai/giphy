// Localization extension on BuildContext
import 'package:flutter/material.dart';
import 'package:giphyapp/generated/l10n.dart';

extension XLocalize on BuildContext {
  S get L => S.of(this);
}

extension TextStyleX on TextStyle? {
  TextStyle? get s12 => this?.copyWith(fontSize: 12);
  TextStyle? get s14 => this?.copyWith(fontSize: 14);
  TextStyle? get s16 => this?.copyWith(fontSize: 16);
  TextStyle? get s18 => this?.copyWith(fontSize: 18);
  TextStyle? get s20 => this?.copyWith(fontSize: 20);
  TextStyle? get s22 => this?.copyWith(fontSize: 22);
  TextStyle? get s24 => this?.copyWith(fontSize: 24);
  TextStyle? get s26 => this?.copyWith(fontSize: 26);
  TextStyle? get s28 => this?.copyWith(fontSize: 28);
  TextStyle? get s30 => this?.copyWith(fontSize: 30);
  TextStyle? get s32 => this?.copyWith(fontSize: 32);

  TextStyle? get w2 => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? get w3 => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get w4 => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get w5 => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get w6 => this?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get w7 => this?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get white => this?.copyWith(color: Colors.white);
  TextStyle? get black => this?.copyWith(color: Colors.black);
  TextStyle? get red => this?.copyWith(color: Colors.red);
  TextStyle? get blue => this?.copyWith(color: Colors.blue);

  TextStyle? get italic => this?.copyWith(fontStyle: FontStyle.italic);

  TextStyle? get ellipsis => this?.copyWith(overflow: TextOverflow.ellipsis);
}

extension KBorderRadius on BorderRadius {
  // same radius for all corners
  static BorderRadius get kZero => BorderRadius.zero;
  static BorderRadius get kAll6 => BorderRadius.circular(6);
  static BorderRadius dynamic(double value) => BorderRadius.circular(value);
  static BorderRadius get kAll8 => BorderRadius.circular(8);
  static BorderRadius get kAll10 => BorderRadius.circular(10);
  static BorderRadius get kAll12 => BorderRadius.circular(12);
  static BorderRadius get kAll14 => BorderRadius.circular(14);
  static BorderRadius get kAll15 => BorderRadius.circular(15);
  static BorderRadius get kAll16 => BorderRadius.circular(16);
  static BorderRadius get kAll18 => BorderRadius.circular(18);
  static BorderRadius get kAll20 => BorderRadius.circular(20);
  static BorderRadius get kAll22 => BorderRadius.circular(22);
  static BorderRadius get kAll26 => BorderRadius.circular(26);
  static BorderRadius get kAll30 => BorderRadius.circular(30);
  static BorderRadius get kAll36 => BorderRadius.circular(36);
  static BorderRadius get kAll40 => BorderRadius.circular(40);
  static BorderRadius get kAll52 => BorderRadius.circular(52);
  static BorderRadius get kAll60 => BorderRadius.circular(60);
  static BorderRadius get kAll70 => BorderRadius.circular(70);
  static BorderRadius get kAll100 => BorderRadius.circular(100);
  static BorderRadius get kAll50 => BorderRadius.circular(50);
  static BorderRadius get kAll200 => BorderRadius.circular(200);
  // Different radius for different corners
  static BorderRadius get kTopLeft30TopRight30 => const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      );
  static BorderRadius get kTopLeft30BottomLeft30 => const BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      );
  static BorderRadius get kTopRight30BottomRight30 => const BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      );
  static BorderRadius get kTop20 => const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      );
  static BorderRadius get kBottom20 => const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      );
  static BorderRadius get kBottom16 => const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      );
  static BorderRadius get kBottom18 => const BorderRadius.only(
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
      );
  static BorderRadius get kTopLeft20TopRight20 => const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      );
}

extension KEdgeInsets on EdgeInsets {
  // zero
  static EdgeInsets get kZero => EdgeInsets.zero;
  static EdgeInsets k(double h, double v) =>
      EdgeInsets.symmetric(horizontal: h, vertical: v);
  // all sides same value
  static EdgeInsets get k1 => const EdgeInsets.all(1);
  static EdgeInsets get k2 => const EdgeInsets.all(2);
  static EdgeInsets get k4 => const EdgeInsets.all(4);
  static EdgeInsets get k6 => const EdgeInsets.all(6);
  static EdgeInsets get k8 => const EdgeInsets.all(8);
  static EdgeInsets get k10 => const EdgeInsets.all(10);
  static EdgeInsets get k11 => const EdgeInsets.all(11);
  static EdgeInsets get k12 => const EdgeInsets.all(12);
  static EdgeInsets get k14 => const EdgeInsets.all(14);
  static EdgeInsets get k16 => const EdgeInsets.all(16);
  static EdgeInsets get k18 => const EdgeInsets.all(18);
  static EdgeInsets get k20 => const EdgeInsets.all(20);
  static EdgeInsets get k31 => const EdgeInsets.all(31);

  // Horizontal Sides same
  static EdgeInsets get kHorizontal2 => const EdgeInsets.symmetric(horizontal: 2);
  static EdgeInsets get kHorizontal3 => const EdgeInsets.symmetric(horizontal: 3);
  static EdgeInsets get kHorizontal4 => const EdgeInsets.symmetric(horizontal: 4);
  static EdgeInsets get kHorizontal5 => const EdgeInsets.symmetric(horizontal: 5);
  static EdgeInsets get kHorizontal6 => const EdgeInsets.symmetric(horizontal: 6);
  static EdgeInsets get kHorizontal8 => const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets get kHorizontal10 => const EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets get kHorizontal11 => const EdgeInsets.symmetric(horizontal: 11);
  static EdgeInsets get kHorizontal12 => const EdgeInsets.symmetric(horizontal: 12);
  static EdgeInsets get kHorizontal13 => const EdgeInsets.symmetric(horizontal: 13);
  static EdgeInsets get kHorizontal14 => const EdgeInsets.symmetric(horizontal: 14);
  static EdgeInsets get kHorizontal15 => const EdgeInsets.symmetric(horizontal: 15);
  static EdgeInsets kHorizontal20 = const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets kHorizontal25 = const EdgeInsets.symmetric(horizontal: 25);
  static EdgeInsets get kHorizontal30 => const EdgeInsets.symmetric(horizontal: 30);
  static EdgeInsets get kHorizontal35 => const EdgeInsets.symmetric(horizontal: 35);
  static EdgeInsets get kHorizontal42 => const EdgeInsets.symmetric(horizontal: 42);
  static EdgeInsets get kHorizontal48 => const EdgeInsets.symmetric(horizontal: 48);
  static EdgeInsets get kHorizontal50 => const EdgeInsets.symmetric(horizontal: 50);

  // Vertical Sides same
  static EdgeInsets get kVertical3 => const EdgeInsets.symmetric(vertical: 3);
  static EdgeInsets get kVertical6 => const EdgeInsets.symmetric(vertical: 6);
  static EdgeInsets get kVertical10 => const EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets get kVertical12 => const EdgeInsets.symmetric(vertical: 12);
  static EdgeInsets get kVertical14 => const EdgeInsets.symmetric(vertical: 14);
  static EdgeInsets get kVertical17 => const EdgeInsets.symmetric(vertical: 17);
  static EdgeInsets get kVertical20 => const EdgeInsets.symmetric(vertical: 20);
  static EdgeInsets get kVertical26 => const EdgeInsets.symmetric(vertical: 26);
  static EdgeInsets get kVertical30 => const EdgeInsets.symmetric(vertical: 30);
  static EdgeInsets get kVertical16 => const EdgeInsets.symmetric(vertical: 16);

  // Only Left
  static EdgeInsets get kLeft2 => const EdgeInsets.only(left: 2);
  static EdgeInsets get kLeft3 => const EdgeInsets.only(left: 3);
  static EdgeInsets get kLeft5 => const EdgeInsets.only(left: 5);
  static EdgeInsets get kLeft10 => const EdgeInsets.only(left: 10);
  static EdgeInsets get kLeft12 => const EdgeInsets.only(left: 12);
  static EdgeInsets get kLeft20 => const EdgeInsets.only(left: 20);
  static EdgeInsets get kLeft30 => const EdgeInsets.only(left: 30);
  static EdgeInsets get kLeft50 => const EdgeInsets.only(left: 50);
  static EdgeInsets get kLeft70 => const EdgeInsets.only(left: 70);

  // Only Right

  static EdgeInsets get kRight4 => const EdgeInsets.only(right: 4);
  static EdgeInsets get kRight6 => const EdgeInsets.only(right: 6);
  static EdgeInsets get kRight8 => const EdgeInsets.only(right: 8);
  static EdgeInsets get kRight10 => const EdgeInsets.only(right: 10);
  static EdgeInsets get kRight12 => const EdgeInsets.only(right: 12);
  static EdgeInsets get kRight14 => const EdgeInsets.only(right: 14);
  static EdgeInsets get kRight20 => const EdgeInsets.only(right: 20);

  // Only Top
  static EdgeInsets get kTop1 => const EdgeInsets.only(top: 1);
  static EdgeInsets get kTop2 => const EdgeInsets.only(top: 2);
  static EdgeInsets get kTop3 => const EdgeInsets.only(top: 3);
  static EdgeInsets get kTop4 => const EdgeInsets.only(top: 4);
  static EdgeInsets get kTop6 => const EdgeInsets.only(top: 6);
  static EdgeInsets get kTop8 => const EdgeInsets.only(top: 8);
  static EdgeInsets get kTop10 => const EdgeInsets.only(top: 10);
  static EdgeInsets get kTop12 => const EdgeInsets.only(top: 12);
  static EdgeInsets get kTop20 => const EdgeInsets.only(top: 20);
  static EdgeInsets get kTop26 => const EdgeInsets.only(top: 26);
  static EdgeInsets get kTop32 => const EdgeInsets.only(top: 32);
  static EdgeInsets get kTop34 => const EdgeInsets.only(top: 34);
  static EdgeInsets get kTop35 => const EdgeInsets.only(top: 35);
  static EdgeInsets get kTop40 => const EdgeInsets.only(top: 40);

  // Only Bottom
  static const EdgeInsets kBottom6 = EdgeInsets.only(bottom: 6);
  static const EdgeInsets kBottom9 = EdgeInsets.only(bottom: 9);
  static const EdgeInsets kBottom10 = EdgeInsets.only(bottom: 10);
  static const EdgeInsets kBottom13 = EdgeInsets.only(bottom: 13);
  static const EdgeInsets kBottom14 = EdgeInsets.only(bottom: 14);
  static const EdgeInsets kBottom20 = EdgeInsets.only(bottom: 20);
  static const EdgeInsets kBottom26 = EdgeInsets.only(bottom: 26);
  static const EdgeInsets kbottom30 = EdgeInsets.only(bottom: 30);
  static const EdgeInsets kbottom32 = EdgeInsets.only(bottom: 32);
  static const EdgeInsets kbottom34 = EdgeInsets.only(bottom: 34);
  static const EdgeInsets kbottom42 = EdgeInsets.only(bottom: 42);
  static EdgeInsets get kBottom16 => const EdgeInsets.only(bottom: 16);
  static EdgeInsets get kBottom18 => const EdgeInsets.only(bottom: 18);
  static EdgeInsets get kbottom40 => const EdgeInsets.only(bottom: 40);

  // Only
  static EdgeInsets get kTop10Bottom28 => const EdgeInsets.only(top: 10, bottom: 28);
  static EdgeInsets get kLeft70top10 => const EdgeInsets.only(left: 70, top: 10);
  static EdgeInsets get kLeft10top7 => const EdgeInsets.only(left: 10, top: 7);
  static EdgeInsets get kLeft20Right15 => const EdgeInsets.only(left: 20, right: 15);
  static EdgeInsets get kTop2Left12 => const EdgeInsets.only(top: 2, left: 12);
  static EdgeInsets get kTop6Bottom17 => const EdgeInsets.only(top: 6, bottom: 17);
  static EdgeInsets get kHorizontal12Vertical20 =>
      const EdgeInsets.symmetric(horizontal: 12, vertical: 20);

  static EdgeInsets kHorizontal4Vertical10 =
      const EdgeInsets.symmetric(horizontal: 4, vertical: 10);

  static EdgeInsets get kHorizontal42Vertical10 =>
      const EdgeInsets.symmetric(horizontal: 42, vertical: 10);
  static EdgeInsets get kTop8Bottom22 => const EdgeInsets.only(top: 8, bottom: 22);

  static EdgeInsets get kTop8Right16 => const EdgeInsets.only(top: 8, right: 16);

  static EdgeInsets get kTop4Right4 => const EdgeInsets.only(top: 4, right: 4);

  static EdgeInsets get kLeft20Right20Top20 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      );
  static EdgeInsets get kAll11Right8 => const EdgeInsets.only(
        left: 11,
        right: 8,
        top: 11,
        bottom: 11,
      );
  static EdgeInsets get kTop10Left10Right16Bottom10 => const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 16,
        bottom: 10,
      );

  static EdgeInsets get kTop11Left20Right20Bottom13 => const EdgeInsets.only(
        top: 11,
        left: 20,
        right: 20,
        bottom: 13,
      );
  static EdgeInsets get kTop6Bottom8Left12Right12 => const EdgeInsets.only(
        top: 6,
        bottom: 8,
        left: 12,
        right: 12,
      );
  static EdgeInsets get kLeft20Right20Bottom34 => const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 34,
      );
  static EdgeInsets get kLeft10Right10Bottom18 => const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 18,
      );
  static EdgeInsets get kLeft8Right8Bottom14 => const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 14,
      );
  static EdgeInsets get kLeft8Right8Top8Bottom12 => const EdgeInsets.only(
        left: 8,
        // right: 8,
        // top: 8,
        bottom: 12,
      );
  static EdgeInsets get kLeft14Right14Top8Bottom12 =>
      const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 12);
  static EdgeInsets get kAll18Right10 => const EdgeInsets.only(
        left: 18,
        right: 10,
        top: 18,
        bottom: 18,
      );
  static EdgeInsets get kLeft11Right11Top17 => const EdgeInsets.only(
        left: 11,
        right: 11,
        top: 18,
      );
  static EdgeInsets get kAll15Right10 => const EdgeInsets.only(
        left: 15,
        right: 10,
        top: 15,
        bottom: 15,
      );

  static EdgeInsets get kHorizontal18Top12Bottom30 => const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 12,
        bottom: 30,
      );
  static EdgeInsets get kHorizontal17Vertical9 => const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 9,
      );
  static EdgeInsets get kTop18Left12Right10Bottom18 => const EdgeInsets.only(
        top: 18,
        left: 12,
        right: 10,
        bottom: 18,
      );
  static EdgeInsets get kTop11Left9Right11Bottom9 => const EdgeInsets.only(
        top: 11,
        left: 9,
        right: 11,
        bottom: 9,
      );
  static EdgeInsets get kTop11Left21Right10Bottom11 => const EdgeInsets.only(
        top: 11,
        left: 21,
        right: 10,
        bottom: 11,
      );
  static EdgeInsets get kTop20Bottom8 => const EdgeInsets.only(
        top: 20,
        bottom: 8,
      );
  static EdgeInsets get kTop12Left20Right20Bottom16 => const EdgeInsets.only(
        top: 12,
        left: 20,
        right: 20,
        bottom: 16,
      );
  static EdgeInsets get kTop20Left20Right20Bottom14 => const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 14,
      );
  static EdgeInsets get kTop8Left20Right20Bottom12 => const EdgeInsets.only(
        top: 8,
        left: 20,
        right: 20,
        bottom: 12,
      );
  static EdgeInsets get kLeft20Right20Bottom20 => const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 14,
      );
  static EdgeInsets get kHorizontal20Top20 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      );
  static EdgeInsets get kHorizontal20Top24 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
      );
  static EdgeInsets get kHorizontal20Bottom8 => const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 8,
      );

  static EdgeInsets get kHorizontal20Top40 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 40,
      );
  static EdgeInsets get kHorizontal20Top10 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      );
  static EdgeInsets get kHorizontal20Top26 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 26,
      );
  static EdgeInsets get kHorizontal20Top34 => const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 34,
      );
  static EdgeInsets get kHorizontal12Top20 => const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 20,
      );

  static EdgeInsets get kLeft20Rigth13Top12Bottom12 => const EdgeInsets.only(
        right: 13,
        left: 20,
        top: 12,
        bottom: 12,
      );
  static EdgeInsets get kLeft12Rigth7Top16Bottom16 =>
      const EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 7);

  static EdgeInsets get kTop16Bottom22 => const EdgeInsets.only(top: 16, bottom: 22);

  static EdgeInsets get kTop22Bottom16 => const EdgeInsets.only(top: 22, bottom: 16);

  static EdgeInsets get kRight8Top16Bottom16 => const EdgeInsets.only(
        top: 16,
        bottom: 16,
        right: 8,
      );

  static EdgeInsets get kLeft30Top13Bottom7 => const EdgeInsets.only(
        top: 13,
        bottom: 7,
        left: 30,
      );

  static EdgeInsets get kLeft20Bottom6 => const EdgeInsets.only(
        top: 20,
        bottom: 6,
      );

  static EdgeInsets get kRight70Top10 => const EdgeInsets.only(
        right: 70,
        top: 10,
      );

  static EdgeInsets get kLeft16Right16Bottom14 => const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 14,
      );

  // Symmetric - Horizontal and Vertical
  static EdgeInsets get kHorizontal8Vertical4 => const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      );

  static EdgeInsets get kHorizontal16Vertical12 => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      );

  // Symmetric - Horizontal and Vertical

  static EdgeInsets get kHorizontal12Vertical10 => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      );

  static EdgeInsets get kHorizontal11Vertical12 => const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 12,
      );

  static EdgeInsets get kHorizontal16Vertical10 => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      );
  static EdgeInsets get kHorizontal14Vertical18 => const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 18,
      );
  static EdgeInsets get kHorizontal20Vertical10 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      );
  static EdgeInsets get kHorizontal18Vertical12 => const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      );
  static EdgeInsets get kHorizontal12Vertical8 => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      );
  static EdgeInsets get kHorizontal10Vertical8 => const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      );

  static EdgeInsets get kHorizontal12Vertical16 => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      );

  static EdgeInsets get kHorizontal20Vertical6 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      );

  static EdgeInsets get kHorizontal20Vertical16 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      );

  static EdgeInsets get kHorizontal20Vertical18 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      );
  static EdgeInsets get kHorizontal20Vertical30 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      );

  static EdgeInsets get kHorizontal12Vertical5 => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      );

  static EdgeInsets get kHorizontal20Vertical20 => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      );

  static EdgeInsets get kHorizontal28Vertical10 => const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      );
  static EdgeInsets get kHorizontal14Vertical10 => const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      );
  static EdgeInsets get kHorizontal14Vertical8 => const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      );
  static EdgeInsets get kHorizontal6Vertical4 => const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      );
  static EdgeInsets get kHorizontal10Vertical6 => const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      );
  static EdgeInsets get kHorizontal15Vertical6 =>
      const EdgeInsets.symmetric(horizontal: 15, vertical: 6);

  static EdgeInsets get kTop6Bottom8 => const EdgeInsets.only(top: 6, bottom: 8);

  static EdgeInsets get kVertical16Horizontal20 =>
      const EdgeInsets.symmetric(vertical: 16, horizontal: 20);

  static EdgeInsets get kHorizontal20Vertical4 =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 4);

  static EdgeInsets get kHorizontal20Vertical60 =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 60);
}

extension KSpace on SizedBox {
  // Other
  static const SizedBox kShrink = SizedBox.shrink();
  static const SizedBox kExpand = SizedBox.expand();


  // Height
  static SizedBox get h2 => const SizedBox(height: 2);
  static SizedBox get h3 => const SizedBox(height: 3);
  static SizedBox get h4 => const SizedBox(height: 4);
  static SizedBox get h5 => const SizedBox(height: 5);
  static SizedBox get h6 => const SizedBox(height: 6);
  static SizedBox get h7 => const SizedBox(height: 7);
  static SizedBox get h8 => const SizedBox(height: 8);
  static SizedBox get w8 => const SizedBox(width: 8);
  static SizedBox get h9 => const SizedBox(height: 9);
  static SizedBox get h10 => const SizedBox(height: 10);
  static SizedBox get h12 => const SizedBox(height: 12);
  static SizedBox get h13 => const SizedBox(height: 13);
  static SizedBox get h14 => const SizedBox(height: 14);
  static SizedBox get h15 => const SizedBox(height: 15);
  static SizedBox get h16 => const SizedBox(height: 16);
  static SizedBox get h17 => const SizedBox(height: 17);
  static SizedBox get h18 => const SizedBox(height: 18);
  static SizedBox get h20 => const SizedBox(height: 20);
  static SizedBox get h22 => const SizedBox(height: 22);
  static SizedBox get h23 => const SizedBox(height: 23);
  static SizedBox get h24 => const SizedBox(height: 24);
  static SizedBox get h25 => const SizedBox(height: 25);
  static SizedBox get h26 => const SizedBox(height: 26);
  static SizedBox get w26 => const SizedBox(width: 26);
  static SizedBox get h28 => const SizedBox(height: 28);
  static SizedBox get h30 => const SizedBox(height: 30);
  static SizedBox get h36 => const SizedBox(height: 36);
  static SizedBox get w36 => const SizedBox(width: 36);
  static SizedBox get h40 => const SizedBox(height: 40);
  static SizedBox get h42 => const SizedBox(height: 42);
  static SizedBox get h44 => const SizedBox(height: 44);
  static SizedBox get h45 => const SizedBox(height: 44);
  static SizedBox get h46 => const SizedBox(height: 46);
  static SizedBox get h48 => const SizedBox(height: 48);
}


extension XString on String?{

  String firstUpper(){
    var name = this;
    if(name == null || name.isEmpty){
      return "Anonymous";
    }
    if(name.length == 1){
      return name.toUpperCase();
    }
    return name.substring(0,1).toUpperCase() + name.substring(1);
  }

  String get fCaps => firstUpper();
}