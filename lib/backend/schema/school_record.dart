import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolRecord extends FirestoreRecord {
  SchoolRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "students" field.
  List<String>? _students;
  List<String> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  // "alphaIndex" field.
  int? _alphaIndex;
  int get alphaIndex => _alphaIndex ?? 0;
  bool hasAlphaIndex() => _alphaIndex != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _students = getDataList(snapshotData['students']);
    _alphaIndex = castToType<int>(snapshotData['alphaIndex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('School');

  static Stream<SchoolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolRecord.fromSnapshot(s));

  static Future<SchoolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolRecord.fromSnapshot(s));

  static SchoolRecord fromSnapshot(DocumentSnapshot snapshot) => SchoolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolRecordData({
  String? name,
  int? alphaIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'alphaIndex': alphaIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolRecordDocumentEquality implements Equality<SchoolRecord> {
  const SchoolRecordDocumentEquality();

  @override
  bool equals(SchoolRecord? e1, SchoolRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.students, e2?.students) &&
        e1?.alphaIndex == e2?.alphaIndex;
  }

  @override
  int hash(SchoolRecord? e) =>
      const ListEquality().hash([e?.name, e?.students, e?.alphaIndex]);

  @override
  bool isValidKey(Object? o) => o is SchoolRecord;
}
