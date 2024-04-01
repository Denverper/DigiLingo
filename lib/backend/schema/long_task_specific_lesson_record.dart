import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LongTaskSpecificLessonRecord extends FirestoreRecord {
  LongTaskSpecificLessonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TaskHeader" field.
  String? _taskHeader;
  String get taskHeader => _taskHeader ?? '';
  bool hasTaskHeader() => _taskHeader != null;

  // "TaskDescription" field.
  String? _taskDescription;
  String get taskDescription => _taskDescription ?? '';
  bool hasTaskDescription() => _taskDescription != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "longTaskLessonRef" field.
  DocumentReference? _longTaskLessonRef;
  DocumentReference? get longTaskLessonRef => _longTaskLessonRef;
  bool hasLongTaskLessonRef() => _longTaskLessonRef != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _taskHeader = snapshotData['TaskHeader'] as String?;
    _taskDescription = snapshotData['TaskDescription'] as String?;
    _image = snapshotData['image'] as String?;
    _longTaskLessonRef =
        snapshotData['longTaskLessonRef'] as DocumentReference?;
    _number = castToType<int>(snapshotData['number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LongTaskSpecificLesson');

  static Stream<LongTaskSpecificLessonRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => LongTaskSpecificLessonRecord.fromSnapshot(s));

  static Future<LongTaskSpecificLessonRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LongTaskSpecificLessonRecord.fromSnapshot(s));

  static LongTaskSpecificLessonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LongTaskSpecificLessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LongTaskSpecificLessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LongTaskSpecificLessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LongTaskSpecificLessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LongTaskSpecificLessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLongTaskSpecificLessonRecordData({
  String? taskHeader,
  String? taskDescription,
  String? image,
  DocumentReference? longTaskLessonRef,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TaskHeader': taskHeader,
      'TaskDescription': taskDescription,
      'image': image,
      'longTaskLessonRef': longTaskLessonRef,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class LongTaskSpecificLessonRecordDocumentEquality
    implements Equality<LongTaskSpecificLessonRecord> {
  const LongTaskSpecificLessonRecordDocumentEquality();

  @override
  bool equals(
      LongTaskSpecificLessonRecord? e1, LongTaskSpecificLessonRecord? e2) {
    return e1?.taskHeader == e2?.taskHeader &&
        e1?.taskDescription == e2?.taskDescription &&
        e1?.image == e2?.image &&
        e1?.longTaskLessonRef == e2?.longTaskLessonRef &&
        e1?.number == e2?.number;
  }

  @override
  int hash(LongTaskSpecificLessonRecord? e) => const ListEquality().hash([
        e?.taskHeader,
        e?.taskDescription,
        e?.image,
        e?.longTaskLessonRef,
        e?.number
      ]);

  @override
  bool isValidKey(Object? o) => o is LongTaskSpecificLessonRecord;
}
