import 'package:mvvm/Data/Response/status.dart';

class Apiresponse<T> {
  Status? status;
  T? data;
  String? message;
  Apiresponse(this.status,this.data,this.message);

  Apiresponse.loading(): status =Status.LOADING;
  Apiresponse.completed(this.data): status =Status.COMPLETE;
  Apiresponse.error(this.message): status =Status.ERROR;

  @override
  String toString(){
    return 'status :$status \n Message: $message \n Data:$data';
  }
}