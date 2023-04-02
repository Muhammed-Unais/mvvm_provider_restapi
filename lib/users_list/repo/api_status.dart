class Success {
  final int? code;
  final Object response;

  Success({required this.response,
     this.code,
  });
}

class Failure{
  final int? code;
  final Object errorResponse;

  Failure({required this.errorResponse,
     this.code,
  });
}
