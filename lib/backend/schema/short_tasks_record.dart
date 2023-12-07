import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ShortTasksRecord extends FirestoreRecord {
  ShortTasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "buttonText" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  void _initializeFields() {
    _taskName = snapshotData['taskName'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _buttonText = snapshotData['buttonText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShortTasks');

  static Stream<ShortTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShortTasksRecord.fromSnapshot(s));

  static Future<ShortTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShortTasksRecord.fromSnapshot(s));

  static ShortTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShortTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShortTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShortTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShortTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShortTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShortTasksRecordData({
  String? taskName,
  String? image,
  String? description,
  String? buttonText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskName': taskName,
      'image': image,
      'description': description,
      'buttonText': buttonText,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShortTasksRecordDocumentEquality implements Equality<ShortTasksRecord> {
  const ShortTasksRecordDocumentEquality();

  @override
  bool equals(ShortTasksRecord? e1, ShortTasksRecord? e2) {
    return e1?.taskName == e2?.taskName &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.buttonText == e2?.buttonText;
  }

  @override
  int hash(ShortTasksRecord? e) => const ListEquality()
      .hash([e?.taskName, e?.image, e?.description, e?.buttonText]);

  @override
  bool isValidKey(Object? o) => o is ShortTasksRecord;
}
