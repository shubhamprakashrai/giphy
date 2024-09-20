class GiphyResponse {
  List<GifData> data;
  Meta meta;
  Pagination pagination;

  GiphyResponse({
    required this.data,
    required this.meta,
    required this.pagination,
  });

  factory GiphyResponse.fromJson(Map<String, dynamic> json) {
    return GiphyResponse(
      data: List<GifData>.from(json["data"].map((x) => GifData.fromJson(x))),
      meta: Meta.fromJson(json["meta"]),
      pagination: Pagination.fromJson(json["pagination"]),
    );
  }
}

class GifData {
  String id;
  String url;
  Images images;

  GifData({
    required this.id,
    required this.url,
    required this.images,
  });

  factory GifData.fromJson(Map<String, dynamic> json) {
    return GifData(
      id: json["id"],
      url: json["url"],
      images: Images.fromJson(json["images"]),
    );
  }
}

class Images {
  Original original;

  Images({
    required this.original,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      original: Original.fromJson(json["original"]),
    );
  }
}

class Original {
  String url;

  Original({
    required this.url,
  });

  factory Original.fromJson(Map<String, dynamic> json) {
    return Original(
      url: json["url"],
    );
  }
}

class Meta {
  int status;
  String msg;
  String responseId;

  Meta({
    required this.status,
    required this.msg,
    required this.responseId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      status: json["status"],
      msg: json["msg"],
      responseId: json["response_id"],
    );
  }
}

class Pagination {
  int totalCount;
  int count;
  int offset;

  Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalCount: json["total_count"],
      count: json["count"],
      offset: json["offset"],
    );
  }
}
