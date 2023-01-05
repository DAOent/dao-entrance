// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/account.dart';
import 'models/fmsg.dart';
import 'models/org.dart';
import 'models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8998818641795649865),
      name: 'User',
      lastPropertyId: const IdUid(12, 8218551646268762643),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7089767889662367951),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9018264967334945608),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7466312491159837664),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5577137421425223846),
            name: 'domain',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4647591983057633800),
            name: 'status',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 1902768465209686694),
            name: 'avatar',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 8218551646268762643),
            name: 'accountId',
            type: 11,
            flags: 520,
            indexId: const IdUid(7, 3633191272347796458),
            relationTarget: 'Account')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 2191329446970265931),
      name: 'DirectMsg',
      lastPropertyId: const IdUid(7, 6790566893326347383),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6634386048270341765),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5184352953664999582),
            name: 'friendId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 300017509230691075),
            name: 'userId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5380428157723195952),
            name: 'body',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1819215715066860241),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5403963621122615254),
            name: 'fromId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 4173676352606177717),
            relationTarget: 'User')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 8090509990637549725),
      name: 'Account',
      lastPropertyId: const IdUid(7, 7493563345107609763),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7243532860004802737),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6363409579354943712),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8208312334747387641),
            name: 'domain',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8638785901036667110),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1508986811083213473),
            name: 'chainData',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1117510036676094852),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7493563345107609763),
            name: 'updatedAt',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'orgs', srcEntity: 'AccountOrg', srcField: 'account'),
        ModelBacklink(name: 'friends', srcEntity: 'User', srcField: 'account')
      ]),
  ModelEntity(
      id: const IdUid(9, 7587758870070808570),
      name: 'AccountOrg',
      lastPropertyId: const IdUid(11, 2874145491573938962),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8541507259978300686),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5806316912744686356),
            name: 'orgName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6057645412587478523),
            name: 'domain',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7718763468033720869),
            name: 'accountId',
            type: 11,
            flags: 520,
            indexId: const IdUid(14, 2038028947041398503),
            relationTarget: 'Account'),
        ModelProperty(
            id: const IdUid(5, 8278851514826536842),
            name: 'status',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5195532381679095247),
            name: 'withAddr',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5707758196070998214),
            name: 'orgHash',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 590516375270286716),
            name: 'orgAvater',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 4130900473033381690),
            name: 'orgColor',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 2874145491573938962),
            name: 'orgImg',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(10, 5693561153061033524),
      name: 'Org',
      lastPropertyId: const IdUid(12, 5283786044045942348),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7010042065683719858),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7085660355384884613),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1263369616342065133),
            name: 'desc',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4868067896047381000),
            name: 'domain',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7319804960872354187),
            name: 'avater',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4825467439625236766),
            name: 'chainType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4391794707449738337),
            name: 'chainMeta',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7928183939628471107),
            name: 'chainUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2075579183897281009),
            name: 'homeUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 8902389809042266938),
            name: 'hash',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 3198384296014846326),
            name: 'img',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 5283786044045942348),
            name: 'color',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(10, 5693561153061033524),
      lastIndexId: const IdUid(14, 2038028947041398503),
      lastRelationId: const IdUid(2, 2905611084694405217),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        1440567131778141039,
        3562406554805002264,
        8566792715005507831,
        6883470479607504359,
        836089974624769643
      ],
      retiredIndexUids: const [
        3359854440918862307,
        270712399465014663,
        392840119224990403,
        545706916589941377,
        7837817910685767364,
        6322404235103475963,
        4566725652771962955,
        3963532079225593657
      ],
      retiredPropertyUids: const [
        6096654477617520530,
        7149298808356785551,
        4983223609099280617,
        3375854283247687553,
        7470641014970050754,
        6847299406552876026,
        766767410326674459,
        7620162645172124481,
        4826598649826679607,
        7612131860367147207,
        2211604236897279258,
        6090377113980684200,
        6790566893326347383,
        1067758264031811941,
        8876463304864235347,
        5883234699727512250,
        4888732053794122554,
        655288350431238127,
        6234575423799158320,
        7250677497283525610,
        5012812470976781193,
        1442196695698165635,
        6079969891374419195,
        571335535129369333,
        7731865114926750429,
        7545750791605278318,
        1808392427952353674,
        5563959166026534194,
        8509862875951073429,
        3692407946629027727,
        239546115317078836
      ],
      retiredRelationUids: const [2546081555060384763, 2905611084694405217],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    User: EntityDefinition<User>(
        model: _entities[0],
        toOneRelations: (User object) => [object.account],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final addressOffset = fbb.writeString(object.address);
          final domainOffset = fbb.writeString(object.domain);
          final avatarOffset =
              object.avatar == null ? null : fbb.writeString(object.avatar!);
          fbb.startTable(13);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(3, addressOffset);
          fbb.addOffset(7, domainOffset);
          fbb.addInt64(8, object.status);
          fbb.addOffset(9, avatarOffset);
          fbb.addInt64(11, object.account.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..address = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 10, '')
            ..domain = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 18, '')
            ..status =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0)
            ..avatar = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 22);
          object.account.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 26, 0);
          object.account.attach(store);
          return object;
        }),
    DirectMsg: EntityDefinition<DirectMsg>(
        model: _entities[1],
        toOneRelations: (DirectMsg object) => [object.from],
        toManyRelations: (DirectMsg object) => {},
        getId: (DirectMsg object) => object.id,
        setId: (DirectMsg object, int id) {
          object.id = id;
        },
        objectToFB: (DirectMsg object, fb.Builder fbb) {
          final bodyOffset =
              object.body == null ? null : fbb.writeString(object.body!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.friendId);
          fbb.addInt64(2, object.userId);
          fbb.addOffset(3, bodyOffset);
          fbb.addInt64(4, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(5, object.from.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final object = DirectMsg()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..friendId =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)
            ..userId =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)
            ..body = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 10)
            ..createdAt = createdAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(createdAtValue);
          object.from.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.from.attach(store);
          return object;
        }),
    Account: EntityDefinition<Account>(
        model: _entities[2],
        toOneRelations: (Account object) => [],
        toManyRelations: (Account object) => {
              RelInfo<AccountOrg>.toOneBacklink(4, object.id,
                  (AccountOrg srcObject) => srcObject.account): object.orgs,
              RelInfo<User>.toOneBacklink(
                      12, object.id, (User srcObject) => srcObject.account):
                  object.friends
            },
        getId: (Account object) => object.id,
        setId: (Account object, int id) {
          object.id = id;
        },
        objectToFB: (Account object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final domainOffset = fbb.writeString(object.domain);
          final addressOffset = fbb.writeString(object.address);
          final chainDataOffset = fbb.writeString(object.chainData);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, domainOffset);
          fbb.addOffset(3, addressOffset);
          fbb.addOffset(4, chainDataOffset);
          fbb.addInt64(5, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(6, object.updatedAt?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final updatedAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final object = Account()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..domain = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 8, '')
            ..address = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 10, '')
            ..chainData = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 12, '')
            ..createdAt = createdAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(createdAtValue)
            ..updatedAt = updatedAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(updatedAtValue);
          InternalToManyAccess.setRelInfo(
              object.orgs,
              store,
              RelInfo<AccountOrg>.toOneBacklink(
                  4, object.id, (AccountOrg srcObject) => srcObject.account),
              store.box<Account>());
          InternalToManyAccess.setRelInfo(
              object.friends,
              store,
              RelInfo<User>.toOneBacklink(
                  12, object.id, (User srcObject) => srcObject.account),
              store.box<Account>());
          return object;
        }),
    AccountOrg: EntityDefinition<AccountOrg>(
        model: _entities[3],
        toOneRelations: (AccountOrg object) => [object.account],
        toManyRelations: (AccountOrg object) => {},
        getId: (AccountOrg object) => object.id,
        setId: (AccountOrg object, int id) {
          object.id = id;
        },
        objectToFB: (AccountOrg object, fb.Builder fbb) {
          final orgNameOffset =
              object.orgName == null ? null : fbb.writeString(object.orgName!);
          final domainOffset =
              object.domain == null ? null : fbb.writeString(object.domain!);
          final withAddrOffset = fbb.writeString(object.withAddr);
          final orgHashOffset = fbb.writeString(object.orgHash);
          final orgAvaterOffset = object.orgAvater == null
              ? null
              : fbb.writeString(object.orgAvater!);
          final orgColorOffset = object.orgColor == null
              ? null
              : fbb.writeString(object.orgColor!);
          final orgImgOffset =
              object.orgImg == null ? null : fbb.writeString(object.orgImg!);
          fbb.startTable(12);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, orgNameOffset);
          fbb.addOffset(2, domainOffset);
          fbb.addInt64(3, object.account.targetId);
          fbb.addInt64(4, object.status);
          fbb.addOffset(6, withAddrOffset);
          fbb.addOffset(7, orgHashOffset);
          fbb.addOffset(8, orgAvaterOffset);
          fbb.addOffset(9, orgColorOffset);
          fbb.addOffset(10, orgImgOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = AccountOrg(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..orgName = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..domain = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..status =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0)
            ..withAddr = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 16, '')
            ..orgAvater = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 20)
            ..orgColor = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 22)
            ..orgImg = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 24);
          object.account.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.account.attach(store);
          return object;
        }),
    Org: EntityDefinition<Org>(
        model: _entities[4],
        toOneRelations: (Org object) => [],
        toManyRelations: (Org object) => {},
        getId: (Org object) => object.id,
        setId: (Org object, int id) {
          object.id = id;
        },
        objectToFB: (Org object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final descOffset =
              object.desc == null ? null : fbb.writeString(object.desc!);
          final domainOffset =
              object.domain == null ? null : fbb.writeString(object.domain!);
          final avaterOffset =
              object.avater == null ? null : fbb.writeString(object.avater!);
          final chainTypeOffset = object.chainType == null
              ? null
              : fbb.writeString(object.chainType!);
          final chainMetaOffset = object.chainMeta == null
              ? null
              : fbb.writeString(object.chainMeta!);
          final chainUrlOffset = object.chainUrl == null
              ? null
              : fbb.writeString(object.chainUrl!);
          final homeUrlOffset =
              object.homeUrl == null ? null : fbb.writeString(object.homeUrl!);
          final hashOffset = fbb.writeString(object.hash);
          final imgOffset =
              object.img == null ? null : fbb.writeString(object.img!);
          final colorOffset =
              object.color == null ? null : fbb.writeString(object.color!);
          fbb.startTable(13);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, descOffset);
          fbb.addOffset(3, domainOffset);
          fbb.addOffset(4, avaterOffset);
          fbb.addOffset(5, chainTypeOffset);
          fbb.addOffset(6, chainMetaOffset);
          fbb.addOffset(7, chainUrlOffset);
          fbb.addOffset(8, homeUrlOffset);
          fbb.addOffset(9, hashOffset);
          fbb.addOffset(10, imgOffset);
          fbb.addOffset(11, colorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Org(const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 22, ''),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              desc: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              domain: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              avater: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              chainType: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              chainMeta: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              chainUrl: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              homeUrl: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              img: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 24),
              color: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[0].properties[0]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[0].properties[1]);

  /// see [User.address]
  static final address = QueryStringProperty<User>(_entities[0].properties[2]);

  /// see [User.domain]
  static final domain = QueryStringProperty<User>(_entities[0].properties[3]);

  /// see [User.status]
  static final status = QueryIntegerProperty<User>(_entities[0].properties[4]);

  /// see [User.avatar]
  static final avatar = QueryStringProperty<User>(_entities[0].properties[5]);

  /// see [User.account]
  static final account =
      QueryRelationToOne<User, Account>(_entities[0].properties[6]);
}

/// [DirectMsg] entity fields to define ObjectBox queries.
class DirectMsg_ {
  /// see [DirectMsg.id]
  static final id = QueryIntegerProperty<DirectMsg>(_entities[1].properties[0]);

  /// see [DirectMsg.friendId]
  static final friendId =
      QueryIntegerProperty<DirectMsg>(_entities[1].properties[1]);

  /// see [DirectMsg.userId]
  static final userId =
      QueryIntegerProperty<DirectMsg>(_entities[1].properties[2]);

  /// see [DirectMsg.body]
  static final body =
      QueryStringProperty<DirectMsg>(_entities[1].properties[3]);

  /// see [DirectMsg.createdAt]
  static final createdAt =
      QueryIntegerProperty<DirectMsg>(_entities[1].properties[4]);

  /// see [DirectMsg.from]
  static final from =
      QueryRelationToOne<DirectMsg, User>(_entities[1].properties[5]);
}

/// [Account] entity fields to define ObjectBox queries.
class Account_ {
  /// see [Account.id]
  static final id = QueryIntegerProperty<Account>(_entities[2].properties[0]);

  /// see [Account.name]
  static final name = QueryStringProperty<Account>(_entities[2].properties[1]);

  /// see [Account.domain]
  static final domain =
      QueryStringProperty<Account>(_entities[2].properties[2]);

  /// see [Account.address]
  static final address =
      QueryStringProperty<Account>(_entities[2].properties[3]);

  /// see [Account.chainData]
  static final chainData =
      QueryStringProperty<Account>(_entities[2].properties[4]);

  /// see [Account.createdAt]
  static final createdAt =
      QueryIntegerProperty<Account>(_entities[2].properties[5]);

  /// see [Account.updatedAt]
  static final updatedAt =
      QueryIntegerProperty<Account>(_entities[2].properties[6]);
}

/// [AccountOrg] entity fields to define ObjectBox queries.
class AccountOrg_ {
  /// see [AccountOrg.id]
  static final id =
      QueryIntegerProperty<AccountOrg>(_entities[3].properties[0]);

  /// see [AccountOrg.orgName]
  static final orgName =
      QueryStringProperty<AccountOrg>(_entities[3].properties[1]);

  /// see [AccountOrg.domain]
  static final domain =
      QueryStringProperty<AccountOrg>(_entities[3].properties[2]);

  /// see [AccountOrg.account]
  static final account =
      QueryRelationToOne<AccountOrg, Account>(_entities[3].properties[3]);

  /// see [AccountOrg.status]
  static final status =
      QueryIntegerProperty<AccountOrg>(_entities[3].properties[4]);

  /// see [AccountOrg.withAddr]
  static final withAddr =
      QueryStringProperty<AccountOrg>(_entities[3].properties[5]);

  /// see [AccountOrg.orgHash]
  static final orgHash =
      QueryStringProperty<AccountOrg>(_entities[3].properties[6]);

  /// see [AccountOrg.orgAvater]
  static final orgAvater =
      QueryStringProperty<AccountOrg>(_entities[3].properties[7]);

  /// see [AccountOrg.orgColor]
  static final orgColor =
      QueryStringProperty<AccountOrg>(_entities[3].properties[8]);

  /// see [AccountOrg.orgImg]
  static final orgImg =
      QueryStringProperty<AccountOrg>(_entities[3].properties[9]);
}

/// [Org] entity fields to define ObjectBox queries.
class Org_ {
  /// see [Org.id]
  static final id = QueryIntegerProperty<Org>(_entities[4].properties[0]);

  /// see [Org.name]
  static final name = QueryStringProperty<Org>(_entities[4].properties[1]);

  /// see [Org.desc]
  static final desc = QueryStringProperty<Org>(_entities[4].properties[2]);

  /// see [Org.domain]
  static final domain = QueryStringProperty<Org>(_entities[4].properties[3]);

  /// see [Org.avater]
  static final avater = QueryStringProperty<Org>(_entities[4].properties[4]);

  /// see [Org.chainType]
  static final chainType = QueryStringProperty<Org>(_entities[4].properties[5]);

  /// see [Org.chainMeta]
  static final chainMeta = QueryStringProperty<Org>(_entities[4].properties[6]);

  /// see [Org.chainUrl]
  static final chainUrl = QueryStringProperty<Org>(_entities[4].properties[7]);

  /// see [Org.homeUrl]
  static final homeUrl = QueryStringProperty<Org>(_entities[4].properties[8]);

  /// see [Org.hash]
  static final hash = QueryStringProperty<Org>(_entities[4].properties[9]);

  /// see [Org.img]
  static final img = QueryStringProperty<Org>(_entities[4].properties[10]);

  /// see [Org.color]
  static final color = QueryStringProperty<Org>(_entities[4].properties[11]);
}
