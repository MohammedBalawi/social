class GeneralResponseWithValue<T> {
  final T data;
  final String? status;

  GeneralResponseWithValue(this.data, {this.status });

  GeneralResponseWithValue.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    return {
      'data': data is Map || data is List || data is String ? data : data.toString(),
      'status': status,
    };
  }
}

