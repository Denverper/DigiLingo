import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizzesRecord extends FirestoreRecord {
  QuizzesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "taskContentRef" field.
  DocumentReference? _taskContentRef;
  DocumentReference? get taskContentRef => _taskContentRef;
  bool hasTaskContentRef() => _taskContentRef != null;

  // "quizID" field.
  int? _quizID;
  int get quizID => _quizID ?? 0;
  bool hasQuizID() => _quizID != null;

  // "numQuestions" field.
  int? _numQuestions;
  int get numQuestions => _numQuestions ?? 0;
  bool hasNumQuestions() => _numQuestions != null;

  void _initializeFields() {
    _taskContentRef = snapshotData['taskContentRef'] as DocumentReference?;
    _quizID = castToType<int>(snapshotData['quizID']);
    _numQuestions = castToType<int>(snapshotData['numQuestions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizzes');

  static Stream<QuizzesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizzesRecord.fromSnapshot(s));

  static Future<QuizzesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizzesRecord.fromSnapshot(s));

  static QuizzesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizzesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizzesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizzesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizzesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizzesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizzesRecordData({
  DocumentReference? taskContentRef,
  int? quizID,
  int? numQuestions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskContentRef': taskContentRef,
      'quizID': quizID,
      'numQuestions': numQuestions,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizzesRecordDocumentEquality implements Equality<QuizzesRecord> {
  const QuizzesRecordDocumentEquality();

  @override
  bool equals(QuizzesRecord? e1, QuizzesRecord? e2) {
    return e1?.taskContentRef == e2?.taskContentRef &&
        e1?.quizID == e2?.quizID &&
        e1?.numQuestions == e2?.numQuestions;
  }

  @override
  int hash(QuizzesRecord? e) => const ListEquality()
      .hash([e?.taskContentRef, e?.quizID, e?.numQuestions]);

  @override
  bool isValidKey(Object? o) => o is QuizzesRecord;
}
