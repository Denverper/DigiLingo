import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LongTasksRecord extends FirestoreRecord {
  LongTasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "buttonText" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  void _initializeFields() {
    _taskName = snapshotData['taskName'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _buttonText = snapshotData['buttonText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LongTasks');

  static Stream<LongTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LongTasksRecord.fromSnapshot(s));

  static Future<LongTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LongTasksRecord.fromSnapshot(s));

  static LongTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LongTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LongTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LongTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LongTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LongTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLongTasksRecordData({
  String? taskName,
  String? description,
  String? image,
  String? buttonText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskName': taskName,
      'description': description,
      'image': image,
      'buttonText': buttonText,
    }.withoutNulls,
  );

  return firestoreData;
}

class LongTasksRecordDocumentEquality implements Equality<LongTasksRecord> {
  const LongTasksRecordDocumentEquality();

  @override
  bool equals(LongTasksRecord? e1, LongTasksRecord? e2) {
    return e1?.taskName == e2?.taskName &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.buttonText == e2?.buttonText;
  }

  @override
  int hash(LongTasksRecord? e) => const ListEquality()
      .hash([e?.taskName, e?.description, e?.image, e?.buttonText]);

  @override
  bool isValidKey(Object? o) => o is LongTasksRecord;
}
