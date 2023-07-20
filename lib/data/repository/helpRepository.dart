

import 'package:magdsoft_task/data/data_providers/remote/helpService.dart';
import 'package:magdsoft_task/data/models/helpResponse.dart';

class HelpRepository{
  HelpService helpService;
  HelpRepository(this.helpService);
  Future<HelpResponse> getHelp()async{
var response = await helpService.getHelp();
return HelpResponse.fromJson(response);

  }
}