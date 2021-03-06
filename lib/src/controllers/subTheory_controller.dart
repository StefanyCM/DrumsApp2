
// import 'package:drumsapp2/src/controllers/rhythms_controller.dart';

import 'package:drumsapp2/src/models/RespSub.dart';
import 'package:drumsapp2/src/models/Theory.dart';
// import 'package:drumsapp2/src/pages/principal/modules/Matriz/view_rhythms.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SubTheoryController extends GetxController {
  List<RespSub> _listResp = [];

  List<RespSub> get listResp => _listResp;

  Theory _theory;

  Theory get theory1 => _theory;
  bool _loadind = true;
  bool get loading => _loadind;

  String _name = "";

  List<Subtheory> _subtheorys = [];

  List<Subtheory> get subtheorys => _subtheorys;

  String get name => _name;

  @override
  void onInit() {
    // TODO: implement onInit
    
    super.onInit();

    print("same as inistState SubTheoryController");
    print("get ${Get.arguments}");
    this._theory = Get.arguments as Theory;
    this._name = this._theory.name;
    print("object " + _loadind.toString());
    print("get ${this._theory}");
    _loadind = true;
    this.loadResp(this._theory.id);
    // update(["theoryT"]);
  }

  Future<void> loadResp(int id) async {
    PartitureProvider consl = new PartitureProvider();
    _listResp = await consl.getSubTheory(id);
    _subtheorys = _listResp[0].subtheorys;
    
    update(["listsubTheory"]);
    
    _loadind = false;
    print("object " + _loadind.toString());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
    //this.loadResp(this._theory.id);
  }

  /*showSubTheory(Subtheory resp) {
    Get.to(ViewSubTeory(), arguments: resp);
  }*/
}
