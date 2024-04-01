import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizResultRecord extends FirestoreRecord {
  QuizResultRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "currentQuestion" field.
  int? _currentQuestion;
  int get currentQuestion => _currentQuestion ?? 0;
  bool hasCurrentQuestion() => _currentQuestion != null;

  // "quizRef" field.
  DocumentReference? _quizRef;
  DocumentReference? get quizRef => _quizRef;
  bool hasQuizRef() => _quizRef != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _currentQuestion = castToType<int>(snapshotData['currentQuestion']);
    _quizRef = snapshotData['quizRef'] as DocumentReference?;
    _answers = getDataList(snapshotData['answers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizResult');

  static Stream<QuizResultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizResultRecord.fromSnapshot(s));

  static Future<QuizResultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizResultRecord.fromSnapshot(s));

  static QuizResultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizResultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizResultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizResultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizResultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizResultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizResultRecordData({
  DocumentReference? userRef,
  int? currentQuestion,
  DocumentReference? quizRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'currentQuestion': currentQuestion,
      'quizRef': quizRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizResultRecordDocumentEquality implements Equality<QuizResultRecord> {
  const QuizResultRecordDocumentEquality();

  @override
  bool equals(QuizResultRecord? e1, QuizResultRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.currentQuestion == e2?.currentQuestion &&
        e1?.quizRef == e2?.quizRef &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(QuizResultRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.currentQuestion, e?.quizRef, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is QuizResultRecord;
}
