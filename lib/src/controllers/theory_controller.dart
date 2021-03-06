
import 'package:drumsapp2/src/models/Theory.dart';
import 'package:drumsapp2/src/pages/principal/modules/teory/sub_theory/list_subTheory.dart';
import 'package:drumsapp2/src/services/partiture_provider.dart';
import 'package:get/get.dart';

class TheoryController extends GetxController {
  List<Theory> _listResp = [];

  List<Theory> get listResp => _listResp;

  int _counter = 0;

  int get counter => _counter;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("same as inistState");
  }

  Future<void> loadResp() async {
    PartitureProvider consl = new PartitureProvider();
    _listResp = await consl.getTheory();
    update(['listTheory']);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady");
    this.loadResp();
  }

  void increment() {
    this._counter++;
    update(['text']);
  }

  showSubTheory(Theory resp, int listLength) {
    Get.to(SubTheory(name: resp.name, id: resp.id, listlength: listLength), arguments: resp);
  }
}
