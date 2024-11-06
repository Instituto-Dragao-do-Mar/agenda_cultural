


import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> widgetProcessamento({String? mensagem}) async {
   if (mensagem == null) {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  } else {
    await EasyLoading.show(status: mensagem);
  } 
}
