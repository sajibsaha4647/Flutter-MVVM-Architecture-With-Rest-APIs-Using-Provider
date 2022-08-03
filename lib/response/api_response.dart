import 'package:fluttermvvm/response/status.dart';

class ApiResponse<T>{

  Status? status ;

  T? data ;

  String? message ;

  ApiResponse(this.status, this.data, this.message) ;

  ApiResponse.loading() : status = Status.LOADING ;
  ApiResponse.success(this.data) : status = Status.SUCCESS ;
  ApiResponse.failed(this.message) : status = Status.FAILED;


  String toString(){
    return 'status:  $status \n message: $message \n $data' ;
  }

}