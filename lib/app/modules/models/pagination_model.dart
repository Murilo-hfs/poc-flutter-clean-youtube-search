import 'package:flutter/material.dart';

class PaginationModel<T> {
  bool hasMore;
  int totalCount;
  int limit;
  int offset;
  List<T> data;
  PaginationModel({
    this.hasMore = false,
    this.totalCount = 0,
    this.limit = 10,
    this.offset = 0,
    @required this.data,
  });

  factory PaginationModel.fromResponse(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) itemFromMap,
  ) {
    List<T> itens = [];
    for (var item in map['data']) {
      itens.add(itemFromMap(item));
    }
    return PaginationModel<T>(
      hasMore: map['hasMore'],
      totalCount: map['totalCount'],
      limit: map['limit'],
      offset: map['offset'],
      data: itens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'offset': offset,
    };
  }

  void updateData(PaginationModel<T> oldPagination) {
    var oldData = oldPagination.data;
    oldData.addAll(this.data);
    this.data = oldData;
  }
}
