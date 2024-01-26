import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortLessonsSectionsRecord extends FirestoreRecord {
  ShortLessonsSectionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sectionTitle" field.
  String? _sectionTitle;
  String get sectionTitle => _sectionTitle ?? '';
  bool hasSectionTitle() => _sectionTitle != null;

  // "sectionVideo" field.
  String? _sectionVideo;
  String get sectionVideo => _sectionVideo ?? '';
  bool hasSectionVideo() => _sectionVideo != null;

  // "sectionImage" field.
  String? _sectionImage;
  String get sectionImage => _sectionImage ?? '';
  bool hasSectionImage() => _sectionImage != null;

  // "sectionLesson" field.
  String? _sectionLesson;
  String get sectionLesson => _sectionLesson ?? '';
  bool hasSectionLesson() => _sectionLesson != null;

  // "shortLessonRef" field.
  DocumentReference? _shortLessonRef;
  DocumentReference? get shortLessonRef => _shortLessonRef;
  bool hasShortLessonRef() => _shortLessonRef != null;

  // "sectionNum" field.
  int? _sectionNum;
  int get sectionNum => _sectionNum ?? 0;
  bool hasSectionNum() => _sectionNum != null;

  void _initializeFields() {
    _sectionTitle = snapshotData['sectionTitle'] as String?;
    _sectionVideo = snapshotData['sectionVideo'] as String?;
    _sectionImage = snapshotData['sectionImage'] as String?;
    _sectionLesson = snapshotData['sectionLesson'] as String?;
    _shortLessonRef = snapshotData['shortLessonRef'] as DocumentReference?;
    _sectionNum = castToType<int>(snapshotData['sectionNum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShortLessonsSections');

  static Stream<ShortLessonsSectionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ShortLessonsSectionsRecord.fromSnapshot(s));

  static Future<ShortLessonsSectionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ShortLessonsSectionsRecord.fromSnapshot(s));

  static ShortLessonsSectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShortLessonsSectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShortLessonsSectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShortLessonsSectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShortLessonsSectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShortLessonsSectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShortLessonsSectionsRecordData({
  String? sectionTitle,
  String? sectionVideo,
  String? sectionImage,
  String? sectionLesson,
  DocumentReference? shortLessonRef,
  int? sectionNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sectionTitle': sectionTitle,
      'sectionVideo': sectionVideo,
      'sectionImage': sectionImage,
      'sectionLesson': sectionLesson,
      'shortLessonRef': shortLessonRef,
      'sectionNum': sectionNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShortLessonsSectionsRecordDocumentEquality
    implements Equality<ShortLessonsSectionsRecord> {
  const ShortLessonsSectionsRecordDocumentEquality();

  @override
  bool equals(ShortLessonsSectionsRecord? e1, ShortLessonsSectionsRecord? e2) {
    return e1?.sectionTitle == e2?.sectionTitle &&
        e1?.sectionVideo == e2?.sectionVideo &&
        e1?.sectionImage == e2?.sectionImage &&
        e1?.sectionLesson == e2?.sectionLesson &&
        e1?.shortLessonRef == e2?.shortLessonRef &&
        e1?.sectionNum == e2?.sectionNum;
  }

  @override
  int hash(ShortLessonsSectionsRecord? e) => const ListEquality().hash([
        e?.sectionTitle,
        e?.sectionVideo,
        e?.sectionImage,
        e?.sectionLesson,
        e?.shortLessonRef,
        e?.sectionNum
      ]);

  @override
  bool isValidKey(Object? o) => o is ShortLessonsSectionsRecord;
}
