import 'dart:convert';

class ResponseGetListArticles {
    final bool ? error;
    final int  ?status;
    final String  ?message;
    final BanneronArticles ? banner;
    final List<Datum> ? data;
    final int  ?total;
    final int ? rows;
    final int  ?from;
    final int  ?to;
    final int  ?pages;
    final int  ?pageSelected;

    ResponseGetListArticles({
         this.error,
         this.status,
         this.message,
         this.banner,
         this.data,
         this.total,
         this.rows,
         this.from,
         this.to,
         this.pages,
         this.pageSelected,
    });

    ResponseGetListArticles copyWith({
        bool? error,
        int? status,
        String? message,
        BanneronArticles? banner,
        List<Datum>? data,
        int? total,
        int? rows,
        int? from,
        int? to,
        int? pages,
        int? pageSelected,
    }) => 
        ResponseGetListArticles(
            error: error ?? this.error,
            status: status ?? this.status,
            message: message ?? this.message,
            banner: banner ?? this.banner,
            data: data ?? this.data,
            total: total ?? this.total,
            rows: rows ?? this.rows,
            from: from ?? this.from,
            to: to ?? this.to,
            pages: pages ?? this.pages,
            pageSelected: pageSelected ?? this.pageSelected,
        );

    factory ResponseGetListArticles.fromRawJson(String str) => ResponseGetListArticles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseGetListArticles.fromJson(Map<String, dynamic> json) => ResponseGetListArticles(
        error: json["error"],
        status: json["status"],
        message: json["message"],
        banner: BanneronArticles.fromJson(json["banner"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
        rows: json["rows"],
        from: json["from"],
        to: json["to"],
        pages: json["pages"],
        pageSelected: json["pageSelected"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message,
        "banner": banner?.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
        "rows": rows,
        "from": from,
        "to": to,
        "pages": pages,
        "pageSelected": pageSelected,
    };
}

class BanneronArticles {
    final String title;
    final String shortDescription;
    final String urlImage;
    final String slug;
    final String createdAt;
    final int v;

    BanneronArticles({
        required this.title,
        required this.shortDescription,
        required this.urlImage,
        required this.slug,
        required this.createdAt,
        required this.v,
    });

    BanneronArticles copyWith({
        String? title,
        String? shortDescription,
        String? urlImage,
        String? slug,
        String? createdAt,
        int? v,
    }) => 
        BanneronArticles(
            title: title ?? this.title,
            shortDescription: shortDescription ?? this.shortDescription,
            urlImage: urlImage ?? this.urlImage,
            slug: slug ?? this.slug,
            createdAt: createdAt ?? this.createdAt,
            v: v ?? this.v,
        );

    factory BanneronArticles.fromRawJson(String str) => BanneronArticles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BanneronArticles.fromJson(Map<String, dynamic> json) => BanneronArticles(
        title: json["title"],
        shortDescription: json["short_description"],
        urlImage: json["url_image"],
        slug: json["slug"],
        createdAt: json["created_at"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "short_description": shortDescription,
        "url_image": urlImage,
        "slug": slug,
        "created_at": createdAt,
        "__v": v,
    };
}

class Datum {
    final bool typeChange;
    final String title;
    final String shortDescription;
    final bool status;
    final String urlImage;
    final String slug;
    final DateTime createdAt;

    Datum({
        required this.typeChange,
        required this.title,
        required this.shortDescription,
        required this.status,
        required this.urlImage,
        required this.slug,
        required this.createdAt,
    });

    Datum copyWith({
        bool? typeChange,
        String? title,
        String? shortDescription,
        bool? status,
        String? urlImage,
        String? slug,
        DateTime? createdAt,
    }) => 
        Datum(
            typeChange: typeChange ?? this.typeChange,
            title: title ?? this.title,
            shortDescription: shortDescription ?? this.shortDescription,
            status: status ?? this.status,
            urlImage: urlImage ?? this.urlImage,
            slug: slug ?? this.slug,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        typeChange: json["type_change"],
        title: json["title"],
        shortDescription: json["short_description"],
        status: json["status"],
        urlImage: json["url_image"],
        slug: json["slug"],
        createdAt:DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "type_change": typeChange,
        "title": title,
        "short_description": shortDescription,
        "status": status,
        "url_image": urlImage,
        "slug": slug,
        "created_at": createdAt.toIso8601String()
    };
}
