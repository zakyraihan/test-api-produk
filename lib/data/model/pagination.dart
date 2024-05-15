part of 'model.dart';

class Pagination {
  int total;
  int page;
  int pageSize;
  int totalPage;

  Pagination({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        page: json["page"],
        pageSize: json["pageSize"],
        totalPage: json["total_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "pageSize": pageSize,
        "total_page": totalPage,
      };
}
