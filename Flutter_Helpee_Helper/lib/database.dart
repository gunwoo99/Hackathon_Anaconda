import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class crud {
  var db;
  var coll;
  crud(String coll) {
    this.db = FirebaseFirestore.instance;
    this.coll = coll;
  }

  void create(String id, double N, double E) {
    var geo = new GeoPoint(N, E);
    int sector =
        ((35.9 - N) * 100).toInt() * 15 + ((E - 128.5) * 100 + 1).toInt();
    db.collection(coll).doc(id).set({
      'id': id,
      'geopoint': geo,
      'sector': sector,
      'activation': 'activate',
      'matching': 'ready',
    });
  }

  Future<List> matching(double N, double E, int t) async {
    var data = await db.collection(coll).where("sector", isEqualTo: t).get();
    // data.then((value) => print(value.docs.map((doc) => doc.data()).toList()));

    final alldata = await data.docs.map((doc) => doc.data()).toList();
    // for (final datum in alldata) {
    //   print(datum['geopoint'].latitude);
    //   print(datum['geopoint'].longitude);
    // }
    print(t);
    return alldata;
  }

  void update(String id, double N, double E) async {
    var geo = new GeoPoint(N, E);
    var doc = db.collection(coll).doc(id);
    int sector =
        ((35.9 - N) * 100).toInt() * 15 + ((E - 128.5) * 100 + 1).toInt();
    doc.update({
      'geopoint': geo,
      'sector': sector,
    });
  }

  void delete(String id) {
    db.collection(coll).doc(id).delete();
  }
}
