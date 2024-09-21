import 'dart:convert';

import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';

GiphyResponse giphyResponseFromJson(String str) => GiphyResponse.fromJson(json.decode(str));

String giphyResponseToJson(GiphyResponse data) => json.encode(data.toJson());

class GiphyResponse {
  final List<Datum>? data;
  final Meta? meta;
  final Pagination? pagination;

  GiphyResponse({
    this.data,
    this.meta,
    this.pagination,
  });

  GiphyResponse copyWith({
    List<Datum>? data,
    Meta? meta,
    Pagination? pagination,
  }) =>
      GiphyResponse(
        data: data ?? this.data,
        meta: meta ?? this.meta,
        pagination: pagination ?? this.pagination,
      );

  factory GiphyResponse.fromJson(Map<String, dynamic> json) => GiphyResponse(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
    "meta": meta?.toJson(),
    "pagination": pagination?.toJson(),
  };
}


class Analytics {
  final Onclick? onload;
  final Onclick? onclick;
  final Onclick? onsent;

  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  Analytics copyWith({
    Onclick? onload,
    Onclick? onclick,
    Onclick? onsent,
  }) =>
      Analytics(
        onload: onload ?? this.onload,
        onclick: onclick ?? this.onclick,
        onsent: onsent ?? this.onsent,
      );

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
    onload: json["onload"] == null ? null : Onclick.fromJson(json["onload"]),
    onclick: json["onclick"] == null ? null : Onclick.fromJson(json["onclick"]),
    onsent: json["onsent"] == null ? null : Onclick.fromJson(json["onsent"]),
  );

  Map<String, dynamic> toJson() => {
    "onload": onload?.toJson(),
    "onclick": onclick?.toJson(),
    "onsent": onsent?.toJson(),
  };
}

class Onclick {
  final String? url;

  Onclick({
    this.url,
  });

  Onclick copyWith({
    String? url,
  }) =>
      Onclick(
        url: url ?? this.url,
      );

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Images {
  final FixedHeight? original;
  final The480WStill? downsized;
  final The480WStill? downsizedLarge;
  final The480WStill? downsizedMedium;
  final The4K? downsizedSmall;
  final The480WStill? downsizedStill;
  final FixedHeight? fixedHeight;
  final FixedHeight? fixedHeightDownsampled;
  final FixedHeight? fixedHeightSmall;
  final The480WStill? fixedHeightSmallStill;
  final The480WStill? fixedHeightStill;
  final FixedHeight? fixedWidth;
  final FixedHeight? fixedWidthDownsampled;
  final FixedHeight? fixedWidthSmall;
  final The480WStill? fixedWidthSmallStill;
  final The480WStill? fixedWidthStill;
  final Looping? looping;
  final The480WStill? originalStill;
  final The4K? originalMp4;
  final The4K? preview;
  final The480WStill? previewGif;
  final The480WStill? previewWebp;
  final The4K? hd;
  final The480WStill? the480WStill;
  final The4K? the4K;

  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.hd,
    this.the480WStill,
    this.the4K,
  });

  Images copyWith({
    FixedHeight? original,
    The480WStill? downsized,
    The480WStill? downsizedLarge,
    The480WStill? downsizedMedium,
    The4K? downsizedSmall,
    The480WStill? downsizedStill,
    FixedHeight? fixedHeight,
    FixedHeight? fixedHeightDownsampled,
    FixedHeight? fixedHeightSmall,
    The480WStill? fixedHeightSmallStill,
    The480WStill? fixedHeightStill,
    FixedHeight? fixedWidth,
    FixedHeight? fixedWidthDownsampled,
    FixedHeight? fixedWidthSmall,
    The480WStill? fixedWidthSmallStill,
    The480WStill? fixedWidthStill,
    Looping? looping,
    The480WStill? originalStill,
    The4K? originalMp4,
    The4K? preview,
    The480WStill? previewGif,
    The480WStill? previewWebp,
    The4K? hd,
    The480WStill? the480WStill,
    The4K? the4K,
  }) =>
      Images(
        original: original ?? this.original,
        downsized: downsized ?? this.downsized,
        downsizedLarge: downsizedLarge ?? this.downsizedLarge,
        downsizedMedium: downsizedMedium ?? this.downsizedMedium,
        downsizedSmall: downsizedSmall ?? this.downsizedSmall,
        downsizedStill: downsizedStill ?? this.downsizedStill,
        fixedHeight: fixedHeight ?? this.fixedHeight,
        fixedHeightDownsampled: fixedHeightDownsampled ?? this.fixedHeightDownsampled,
        fixedHeightSmall: fixedHeightSmall ?? this.fixedHeightSmall,
        fixedHeightSmallStill: fixedHeightSmallStill ?? this.fixedHeightSmallStill,
        fixedHeightStill: fixedHeightStill ?? this.fixedHeightStill,
        fixedWidth: fixedWidth ?? this.fixedWidth,
        fixedWidthDownsampled: fixedWidthDownsampled ?? this.fixedWidthDownsampled,
        fixedWidthSmall: fixedWidthSmall ?? this.fixedWidthSmall,
        fixedWidthSmallStill: fixedWidthSmallStill ?? this.fixedWidthSmallStill,
        fixedWidthStill: fixedWidthStill ?? this.fixedWidthStill,
        looping: looping ?? this.looping,
        originalStill: originalStill ?? this.originalStill,
        originalMp4: originalMp4 ?? this.originalMp4,
        preview: preview ?? this.preview,
        previewGif: previewGif ?? this.previewGif,
        previewWebp: previewWebp ?? this.previewWebp,
        hd: hd ?? this.hd,
        the480WStill: the480WStill ?? this.the480WStill,
        the4K: the4K ?? this.the4K,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    original: json["original"] == null ? null : FixedHeight.fromJson(json["original"]),
    downsized: json["downsized"] == null ? null : The480WStill.fromJson(json["downsized"]),
    downsizedLarge: json["downsized_large"] == null ? null : The480WStill.fromJson(json["downsized_large"]),
    downsizedMedium: json["downsized_medium"] == null ? null : The480WStill.fromJson(json["downsized_medium"]),
    downsizedSmall: json["downsized_small"] == null ? null : The4K.fromJson(json["downsized_small"]),
    downsizedStill: json["downsized_still"] == null ? null : The480WStill.fromJson(json["downsized_still"]),
    fixedHeight: json["fixed_height"] == null ? null : FixedHeight.fromJson(json["fixed_height"]),
    fixedHeightDownsampled: json["fixed_height_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_height_downsampled"]),
    fixedHeightSmall: json["fixed_height_small"] == null ? null : FixedHeight.fromJson(json["fixed_height_small"]),
    fixedHeightSmallStill: json["fixed_height_small_still"] == null ? null : The480WStill.fromJson(json["fixed_height_small_still"]),
    fixedHeightStill: json["fixed_height_still"] == null ? null : The480WStill.fromJson(json["fixed_height_still"]),
    fixedWidth: json["fixed_width"] == null ? null : FixedHeight.fromJson(json["fixed_width"]),
    fixedWidthDownsampled: json["fixed_width_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_width_downsampled"]),
    fixedWidthSmall: json["fixed_width_small"] == null ? null : FixedHeight.fromJson(json["fixed_width_small"]),
    fixedWidthSmallStill: json["fixed_width_small_still"] == null ? null : The480WStill.fromJson(json["fixed_width_small_still"]),
    fixedWidthStill: json["fixed_width_still"] == null ? null : The480WStill.fromJson(json["fixed_width_still"]),
    looping: json["looping"] == null ? null : Looping.fromJson(json["looping"]),
    originalStill: json["original_still"] == null ? null : The480WStill.fromJson(json["original_still"]),
    originalMp4: json["original_mp4"] == null ? null : The4K.fromJson(json["original_mp4"]),
    preview: json["preview"] == null ? null : The4K.fromJson(json["preview"]),
    previewGif: json["preview_gif"] == null ? null : The480WStill.fromJson(json["preview_gif"]),
    previewWebp: json["preview_webp"] == null ? null : The480WStill.fromJson(json["preview_webp"]),
    hd: json["hd"] == null ? null : The4K.fromJson(json["hd"]),
    the480WStill: json["480w_still"] == null ? null : The480WStill.fromJson(json["480w_still"]),
    the4K: json["4k"] == null ? null : The4K.fromJson(json["4k"]),
  );

  Map<String, dynamic> toJson() => {
    "original": original?.toJson(),
    "downsized": downsized?.toJson(),
    "downsized_large": downsizedLarge?.toJson(),
    "downsized_medium": downsizedMedium?.toJson(),
    "downsized_small": downsizedSmall?.toJson(),
    "downsized_still": downsizedStill?.toJson(),
    "fixed_height": fixedHeight?.toJson(),
    "fixed_height_downsampled": fixedHeightDownsampled?.toJson(),
    "fixed_height_small": fixedHeightSmall?.toJson(),
    "fixed_height_small_still": fixedHeightSmallStill?.toJson(),
    "fixed_height_still": fixedHeightStill?.toJson(),
    "fixed_width": fixedWidth?.toJson(),
    "fixed_width_downsampled": fixedWidthDownsampled?.toJson(),
    "fixed_width_small": fixedWidthSmall?.toJson(),
    "fixed_width_small_still": fixedWidthSmallStill?.toJson(),
    "fixed_width_still": fixedWidthStill?.toJson(),
    "looping": looping?.toJson(),
    "original_still": originalStill?.toJson(),
    "original_mp4": originalMp4?.toJson(),
    "preview": preview?.toJson(),
    "preview_gif": previewGif?.toJson(),
    "preview_webp": previewWebp?.toJson(),
    "hd": hd?.toJson(),
    "480w_still": the480WStill?.toJson(),
    "4k": the4K?.toJson(),
  };
}

class The480WStill {
  final String? height;
  final String? width;
  final String? size;
  final String? url;

  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });

  The480WStill copyWith({
    String? height,
    String? width,
    String? size,
    String? url,
  }) =>
      The480WStill(
        height: height ?? this.height,
        width: width ?? this.width,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
  };
}

class The4K {
  final String? height;
  final String? width;
  final String? mp4Size;
  final String? mp4;

  The4K({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });

  The4K copyWith({
    String? height,
    String? width,
    String? mp4Size,
    String? mp4,
  }) =>
      The4K(
        height: height ?? this.height,
        width: width ?? this.width,
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
      );

  factory The4K.fromJson(Map<String, dynamic> json) => The4K(
    height: json["height"],
    width: json["width"],
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "mp4_size": mp4Size,
    "mp4": mp4,
  };
}

class FixedHeight {
  final String? height;
  final String? width;
  final String? size;
  final String? url;
  final String? mp4Size;
  final String? mp4;
  final String? webpSize;
  final String? webp;
  final String? frames;
  final String? hash;

  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  FixedHeight copyWith({
    String? height,
    String? width,
    String? size,
    String? url,
    String? mp4Size,
    String? mp4,
    String? webpSize,
    String? webp,
    String? frames,
    String? hash,
  }) =>
      FixedHeight(
        height: height ?? this.height,
        width: width ?? this.width,
        size: size ?? this.size,
        url: url ?? this.url,
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
        webpSize: webpSize ?? this.webpSize,
        webp: webp ?? this.webp,
        frames: frames ?? this.frames,
        hash: hash ?? this.hash,
      );

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
    webpSize: json["webp_size"],
    webp: json["webp"],
    frames: json["frames"],
    hash: json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
    "mp4_size": mp4Size,
    "mp4": mp4,
    "webp_size": webpSize,
    "webp": webp,
    "frames": frames,
    "hash": hash,
  };
}

class Looping {
  final String? mp4Size;
  final String? mp4;

  Looping({
    this.mp4Size,
    this.mp4,
  });

  Looping copyWith({
    String? mp4Size,
    String? mp4,
  }) =>
      Looping(
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
      );

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "mp4_size": mp4Size,
    "mp4": mp4,
  };
}

enum Rating {
  G;

  String getVal(){
    if(this == Rating.G){
      return "G";
    }
    return "N/A";
  }
}

final ratingValues = EnumValues({
  "g": Rating.G
});

enum Type {
  GIF
}

final typeValues = EnumValues({
  "gif": Type.GIF
});

class User {
  final String? avatarUrl;
  final String? bannerImage;
  final String? bannerUrl;
  final String? profileUrl;
  final String? username;
  final String? displayName;
  final String? description;
  final String? instagramUrl;
  final String? websiteUrl;
  final bool? isVerified;

  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });

  User copyWith({
    String? avatarUrl,
    String? bannerImage,
    String? bannerUrl,
    String? profileUrl,
    String? username,
    String? displayName,
    String? description,
    String? instagramUrl,
    String? websiteUrl,
    bool? isVerified,
  }) =>
      User(
        avatarUrl: avatarUrl ?? this.avatarUrl,
        bannerImage: bannerImage ?? this.bannerImage,
        bannerUrl: bannerUrl ?? this.bannerUrl,
        profileUrl: profileUrl ?? this.profileUrl,
        username: username ?? this.username,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        instagramUrl: instagramUrl ?? this.instagramUrl,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        isVerified: isVerified ?? this.isVerified,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatarUrl: json["avatar_url"],
    bannerImage: json["banner_image"],
    bannerUrl: json["banner_url"],
    profileUrl: json["profile_url"],
    username: json["username"],
    displayName: json["display_name"],
    description: json["description"],
    instagramUrl: json["instagram_url"],
    websiteUrl: json["website_url"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "banner_image": bannerImage,
    "banner_url": bannerUrl,
    "profile_url": profileUrl,
    "username": username,
    "display_name": displayName,
    "description": description,
    "instagram_url": instagramUrl,
    "website_url": websiteUrl,
    "is_verified": isVerified,
  };
}

class Meta {
  final int? status;
  final String? msg;
  final String? responseId;

  Meta({
    this.status,
    this.msg,
    this.responseId,
  });

  Meta copyWith({
    int? status,
    String? msg,
    String? responseId,
  }) =>
      Meta(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        responseId: responseId ?? this.responseId,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    status: json["status"],
    msg: json["msg"],
    responseId: json["response_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "response_id": responseId,
  };
}

class Pagination {
  final int? totalCount;
  final int? count;
  final int? offset;

  Pagination({
    this.totalCount,
    this.count,
    this.offset,
  });

  Pagination copyWith({
    int? totalCount,
    int? count,
    int? offset,
  }) =>
      Pagination(
        totalCount: totalCount ?? this.totalCount,
        count: count ?? this.count,
        offset: offset ?? this.offset,
      );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json["total_count"],
    count: json["count"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "count": count,
    "offset": offset,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
