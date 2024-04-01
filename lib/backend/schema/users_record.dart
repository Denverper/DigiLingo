import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "streak" field.
  int? _streak;
  int get streak => _streak ?? 0;
  bool hasStreak() => _streak != null;

  // "schoolRef" field.
  DocumentReference? _schoolRef;
  DocumentReference? get schoolRef => _schoolRef;
  bool hasSchoolRef() => _schoolRef != null;

  // "schoolName" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  bool hasSchoolName() => _schoolName != null;

  // "oldSchoolRef" field.
  DocumentReference? _oldSchoolRef;
  DocumentReference? get oldSchoolRef => _oldSchoolRef;
  bool hasOldSchoolRef() => _oldSchoolRef != null;

  // "oldSchoolName" field.
  String? _oldSchoolName;
  String get oldSchoolName => _oldSchoolName ?? '';
  bool hasOldSchoolName() => _oldSchoolName != null;

  // "lastExcersice" field.
  DateTime? _lastExcersice;
  DateTime? get lastExcersice => _lastExcersice;
  bool hasLastExcersice() => _lastExcersice != null;

  // "daysSinceLastExcersise" field.
  int? _daysSinceLastExcersise;
  int get daysSinceLastExcersise => _daysSinceLastExcersise ?? 0;
  bool hasDaysSinceLastExcersise() => _daysSinceLastExcersise != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _streak = castToType<int>(snapshotData['streak']);
    _schoolRef = snapshotData['schoolRef'] as DocumentReference?;
    _schoolName = snapshotData['schoolName'] as String?;
    _oldSchoolRef = snapshotData['oldSchoolRef'] as DocumentReference?;
    _oldSchoolName = snapshotData['oldSchoolName'] as String?;
    _lastExcersice = snapshotData['lastExcersice'] as DateTime?;
    _daysSinceLastExcersise =
        castToType<int>(snapshotData['daysSinceLastExcersise']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  int? streak,
  DocumentReference? schoolRef,
  String? schoolName,
  DocumentReference? oldSchoolRef,
  String? oldSchoolName,
  DateTime? lastExcersice,
  int? daysSinceLastExcersise,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'streak': streak,
      'schoolRef': schoolRef,
      'schoolName': schoolName,
      'oldSchoolRef': oldSchoolRef,
      'oldSchoolName': oldSchoolName,
      'lastExcersice': lastExcersice,
      'daysSinceLastExcersise': daysSinceLastExcersise,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.streak == e2?.streak &&
        e1?.schoolRef == e2?.schoolRef &&
        e1?.schoolName == e2?.schoolName &&
        e1?.oldSchoolRef == e2?.oldSchoolRef &&
        e1?.oldSchoolName == e2?.oldSchoolName &&
        e1?.lastExcersice == e2?.lastExcersice &&
        e1?.daysSinceLastExcersise == e2?.daysSinceLastExcersise;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.streak,
        e?.schoolRef,
        e?.schoolName,
        e?.oldSchoolRef,
        e?.oldSchoolName,
        e?.lastExcersice,
        e?.daysSinceLastExcersise
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
