import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LongTaskLessonsRecord extends FirestoreRecord {
  LongTaskLessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "longTaskRef" field.
  DocumentReference? _longTaskRef;
  DocumentReference? get longTaskRef => _longTaskRef;
  bool hasLongTaskRef() => _longTaskRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  bool hasLength() => _length != null;

  // "isIntro" field.
  bool? _isIntro;
  bool get isIntro => _isIntro ?? false;
  bool hasIsIntro() => _isIntro != null;

  // "studentsCompleted" field.
  List<DocumentReference>? _studentsCompleted;
  List<DocumentReference> get studentsCompleted =>
      _studentsCompleted ?? const [];
  bool hasStudentsCompleted() => _studentsCompleted != null;

  // "numPartsMinusOne" field.
  int? _numPartsMinusOne;
  int get numPartsMinusOne => _numPartsMinusOne ?? 0;
  bool hasNumPartsMinusOne() => _numPartsMinusOne != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _longTaskRef = snapshotData['longTaskRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _length = castToType<int>(snapshotData['length']);
    _isIntro = snapshotData['isIntro'] as bool?;
    _studentsCompleted = getDataList(snapshotData['studentsCompleted']);
    _numPartsMinusOne = castToType<int>(snapshotData['numPartsMinusOne']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LongTaskLessons');

  static Stream<LongTaskLessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LongTaskLessonsRecord.fromSnapshot(s));

  static Future<LongTaskLessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LongTaskLessonsRecord.fromSnapshot(s));

  static LongTaskLessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LongTaskLessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LongTaskLessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LongTaskLessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LongTaskLessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LongTaskLessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLongTaskLessonsRecordData({
  int? number,
  DocumentReference? longTaskRef,
  String? name,
  int? length,
  bool? isIntro,
  int? numPartsMinusOne,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'longTaskRef': longTaskRef,
      'name': name,
      'length': length,
      'isIntro': isIntro,
      'numPartsMinusOne': numPartsMinusOne,
    }.withoutNulls,
  );

  return firestoreData;
}

class LongTaskLessonsRecordDocumentEquality
    implements Equality<LongTaskLessonsRecord> {
  const LongTaskLessonsRecordDocumentEquality();

  @override
  bool equals(LongTaskLessonsRecord? e1, LongTaskLessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.number == e2?.number &&
        e1?.longTaskRef == e2?.longTaskRef &&
        e1?.name == e2?.name &&
        e1?.length == e2?.length &&
        e1?.isIntro == e2?.isIntro &&
        listEquality.equals(e1?.studentsCompleted, e2?.studentsCompleted) &&
        e1?.numPartsMinusOne == e2?.numPartsMinusOne;
  }

  @override
  int hash(LongTaskLessonsRecord? e) => const ListEquality().hash([
        e?.number,
        e?.longTaskRef,
        e?.name,
        e?.length,
        e?.isIntro,
        e?.studentsCompleted,
        e?.numPartsMinusOne
      ]);

  @override
  bool isValidKey(Object? o) => o is LongTaskLessonsRecord;
}
