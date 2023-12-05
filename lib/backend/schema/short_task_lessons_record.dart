import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortTaskLessonsRecord extends FirestoreRecord {
  ShortTaskLessonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "shortTaskRef" field.
  DocumentReference? _shortTaskRef;
  DocumentReference? get shortTaskRef => _shortTaskRef;
  bool hasShortTaskRef() => _shortTaskRef != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _name = snapshotData['name'] as String?;
    _shortTaskRef = snapshotData['shortTaskRef'] as DocumentReference?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShortTaskLessons');

  static Stream<ShortTaskLessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShortTaskLessonsRecord.fromSnapshot(s));

  static Future<ShortTaskLessonsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ShortTaskLessonsRecord.fromSnapshot(s));

  static ShortTaskLessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShortTaskLessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShortTaskLessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShortTaskLessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShortTaskLessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShortTaskLessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShortTaskLessonsRecordData({
  int? number,
  String? name,
  DocumentReference? shortTaskRef,
  bool? isCompleted,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'name': name,
      'shortTaskRef': shortTaskRef,
      'isCompleted': isCompleted,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShortTaskLessonsRecordDocumentEquality
    implements Equality<ShortTaskLessonsRecord> {
  const ShortTaskLessonsRecordDocumentEquality();

  @override
  bool equals(ShortTaskLessonsRecord? e1, ShortTaskLessonsRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.name == e2?.name &&
        e1?.shortTaskRef == e2?.shortTaskRef &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ShortTaskLessonsRecord? e) => const ListEquality()
      .hash([e?.number, e?.name, e?.shortTaskRef, e?.isCompleted, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ShortTaskLessonsRecord;
}
