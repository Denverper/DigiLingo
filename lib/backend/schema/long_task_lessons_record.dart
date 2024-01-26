import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  bool hasLength() => _length != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _longTaskRef = snapshotData['longTaskRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _length = castToType<int>(snapshotData['length']);
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
  bool? isCompleted,
  String? image,
  String? description,
  int? length,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'longTaskRef': longTaskRef,
      'name': name,
      'isCompleted': isCompleted,
      'image': image,
      'description': description,
      'length': length,
    }.withoutNulls,
  );

  return firestoreData;
}

class LongTaskLessonsRecordDocumentEquality
    implements Equality<LongTaskLessonsRecord> {
  const LongTaskLessonsRecordDocumentEquality();

  @override
  bool equals(LongTaskLessonsRecord? e1, LongTaskLessonsRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.longTaskRef == e2?.longTaskRef &&
        e1?.name == e2?.name &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.length == e2?.length;
  }

  @override
  int hash(LongTaskLessonsRecord? e) => const ListEquality().hash([
        e?.number,
        e?.longTaskRef,
        e?.name,
        e?.isCompleted,
        e?.image,
        e?.description,
        e?.length
      ]);

  @override
  bool isValidKey(Object? o) => o is LongTaskLessonsRecord;
}
