import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "correctOption" field.
  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  bool hasCorrectOption() => _correctOption != null;

  // "questionQuizID" field.
  int? _questionQuizID;
  int get questionQuizID => _questionQuizID ?? 0;
  bool hasQuestionQuizID() => _questionQuizID != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _description = snapshotData['description'] as String?;
    _options = getStructList(
      snapshotData['options'],
      OptionsStruct.fromMap,
    );
    _index = castToType<int>(snapshotData['index']);
    _correctOption = snapshotData['correctOption'] as String?;
    _questionQuizID = castToType<int>(snapshotData['questionQuizID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? question,
  String? description,
  int? index,
  String? correctOption,
  int? questionQuizID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'description': description,
      'index': index,
      'correctOption': correctOption,
      'questionQuizID': questionQuizID,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.index == e2?.index &&
        e1?.correctOption == e2?.correctOption &&
        e1?.questionQuizID == e2?.questionQuizID;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash([
        e?.question,
        e?.description,
        e?.options,
        e?.index,
        e?.correctOption,
        e?.questionQuizID
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
