import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "buttonColor" field.
  Color? _buttonColor;
  Color? get buttonColor => _buttonColor;
  bool hasButtonColor() => _buttonColor != null;

  // "buttonImage" field.
  String? _buttonImage;
  String get buttonImage => _buttonImage ?? '';
  bool hasButtonImage() => _buttonImage != null;

  void _initializeFields() {
    _categoryName = snapshotData['categoryName'] as String?;
    _buttonColor = getSchemaColor(snapshotData['buttonColor']);
    _buttonImage = snapshotData['buttonImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  Color? buttonColor,
  String? buttonImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryName': categoryName,
      'buttonColor': buttonColor,
      'buttonImage': buttonImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.buttonColor == e2?.buttonColor &&
        e1?.buttonImage == e2?.buttonImage;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryName, e?.buttonColor, e?.buttonImage]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
