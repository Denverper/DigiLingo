import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortTasksContentRecord extends FirestoreRecord {
  ShortTasksContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "shortTaskRef" field.
  DocumentReference? _shortTaskRef;
  DocumentReference? get shortTaskRef => _shortTaskRef;
  bool hasShortTaskRef() => _shortTaskRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "sectionContent" field.
  String? _sectionContent;
  String get sectionContent => _sectionContent ?? '';
  bool hasSectionContent() => _sectionContent != null;

  // "supplementalVid" field.
  String? _supplementalVid;
  String get supplementalVid => _supplementalVid ?? '';
  bool hasSupplementalVid() => _supplementalVid != null;

  // "supplementalLinks" field.
  String? _supplementalLinks;
  String get supplementalLinks => _supplementalLinks ?? '';
  bool hasSupplementalLinks() => _supplementalLinks != null;

  // "supplementalIntro" field.
  String? _supplementalIntro;
  String get supplementalIntro => _supplementalIntro ?? '';
  bool hasSupplementalIntro() => _supplementalIntro != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "isQuiz" field.
  bool? _isQuiz;
  bool get isQuiz => _isQuiz ?? false;
  bool hasIsQuiz() => _isQuiz != null;

  // "quizRef" field.
  DocumentReference? _quizRef;
  DocumentReference? get quizRef => _quizRef;
  bool hasQuizRef() => _quizRef != null;

  void _initializeFields() {
    _shortTaskRef = snapshotData['shortTaskRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _sectionContent = snapshotData['sectionContent'] as String?;
    _supplementalVid = snapshotData['supplementalVid'] as String?;
    _supplementalLinks = snapshotData['supplementalLinks'] as String?;
    _supplementalIntro = snapshotData['supplementalIntro'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _isQuiz = snapshotData['isQuiz'] as bool?;
    _quizRef = snapshotData['quizRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShortTasksContent');

  static Stream<ShortTasksContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShortTasksContentRecord.fromSnapshot(s));

  static Future<ShortTasksContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ShortTasksContentRecord.fromSnapshot(s));

  static ShortTasksContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShortTasksContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShortTasksContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShortTasksContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShortTasksContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShortTasksContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShortTasksContentRecordData({
  DocumentReference? shortTaskRef,
  String? title,
  String? sectionContent,
  String? supplementalVid,
  String? supplementalLinks,
  String? supplementalIntro,
  int? index,
  bool? isQuiz,
  DocumentReference? quizRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shortTaskRef': shortTaskRef,
      'title': title,
      'sectionContent': sectionContent,
      'supplementalVid': supplementalVid,
      'supplementalLinks': supplementalLinks,
      'supplementalIntro': supplementalIntro,
      'index': index,
      'isQuiz': isQuiz,
      'quizRef': quizRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShortTasksContentRecordDocumentEquality
    implements Equality<ShortTasksContentRecord> {
  const ShortTasksContentRecordDocumentEquality();

  @override
  bool equals(ShortTasksContentRecord? e1, ShortTasksContentRecord? e2) {
    return e1?.shortTaskRef == e2?.shortTaskRef &&
        e1?.title == e2?.title &&
        e1?.sectionContent == e2?.sectionContent &&
        e1?.supplementalVid == e2?.supplementalVid &&
        e1?.supplementalLinks == e2?.supplementalLinks &&
        e1?.supplementalIntro == e2?.supplementalIntro &&
        e1?.index == e2?.index &&
        e1?.isQuiz == e2?.isQuiz &&
        e1?.quizRef == e2?.quizRef;
  }

  @override
  int hash(ShortTasksContentRecord? e) => const ListEquality().hash([
        e?.shortTaskRef,
        e?.title,
        e?.sectionContent,
        e?.supplementalVid,
        e?.supplementalLinks,
        e?.supplementalIntro,
        e?.index,
        e?.isQuiz,
        e?.quizRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ShortTasksContentRecord;
}
