import 'package:fluttermvvm/response/status.dart';

class ApiResponse<T>{

  Status? status ;

  T? data ;

  String? message ;

  ApiResponse(this.status, this.data, this.message) ;

  ApiResponse.loading() : status = Status.LOADING ;
  ApiResponse.success() : status = Status.SUCCESS ;
  ApiResponse.failed() : status = Status.FAILED;


  String toString(){
    return 'status:  $status \n message: $message \n $data' ;
  }

}