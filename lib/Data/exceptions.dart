// ignore_for_file: annotate_overrides, prefer_typing_uninitialized_variables

class Appxcaptions implements Exception {
  final _message;
  final _prefix;
  Appxcaptions(this._message,this._prefix);
  String toString(){
    return '$_prefix''$_message';
  }
}
class FetchDataExceptions extends Appxcaptions {

  FetchDataExceptions([String? message]):super (message,'Error During Communication'); 
}
class BadrequestException extends Appxcaptions {

  BadrequestException([String? message]):super (message,'Invalid Request'); 
}
class UnauthorizedExceptions extends Appxcaptions {

  UnauthorizedExceptions([String? message]):super (message,'Unauthorized Request'); 
}
class Invalidinput extends Appxcaptions {

  Invalidinput([String? message]):super (message,'Invalid Input'); 
}