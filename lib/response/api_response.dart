import 'package:fluttermvvm/Model/UserDataModel.dart';
import 'package:fluttermvvm/response/status.dart';

class ApiResponse<T>{

  Status? status ;
  T? data ;
  String? message ;

  ApiResponse(this.status , this.data, this.message);


  ApiResponse.loading() : status = Status.LOADING ;

  ApiResponse.completed(this.data) : status = Status.SUCCESS ;

  ApiResponse.error(this.message) : status = Status.FAILED ;


  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $data" ;
  }

}