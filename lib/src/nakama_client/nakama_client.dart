import 'package:flutter_nakama/api.dart';
import 'package:flutter_nakama/nakama.dart';
import 'package:flutter_nakama/src/session.dart' as model;

const _kDefaultAppKey = 'default';

/// This defines the interface to communicate with Nakama API. It is a little
/// tricky to support web (via REST) and io (via gRPC) with just one codebase
/// so please don't use this directly but get your fitting instance with
/// [getNakamaClient()].
abstract class NakamaBaseClient {
  NakamaBaseClient.init({
    String? host,
    String? serverKey,
    String key = _kDefaultAppKey,
    int httpPort = 7350,
    int grpcPort = 7349,
    bool ssl = false,
  });

  NakamaBaseClient();

  Future<model.Session> authenticateEmail({
    required String email,
    required String password,
    bool create = false,
    String? username,
    Map<String, String>? vars,
  });

  Future<model.Session> authenticateDevice({
    required String deviceId,
    bool create = false,
    String? username,
    Map<String, String>? vars,
  });

  Future<model.Session> authenticateFacebook({
    required String token,
    bool create = true,
    String? username,
    Map<String, String>? vars,
    bool import = false,
  });

  Future<model.Session> authenticateGoogle({
    required String token,
    bool create = true,
    String? username,
    Map<String, String>? vars,
  });

  Future<model.Session> authenticateGameCenter({
    required String playerId,
    required String bundleId,
    required int timestampSeconds,
    required String salt,
    required String signature,
    required String publicKeyUrl,
    bool create = true,
    String? username,
    Map<String, String>? vars,
  });

  Future<model.Session> authenticateSteam({
    required String token,
    bool create = true,
    String? username,
    Map<String, String>? vars,
  });

  Future<model.Session> authenticateCustom({
    required String id,
    bool create = true,
    String? username,
    Map<String, String>? vars,
  });

  Future<Account> getAccount(model.Session session);

  Future<void> updateAccount({
    required model.Session session,
    String? username,
    String? displayName,
    String? avatarUrl,
    String? langTag,
    String? location,
    String? timezone,
  });

  Future<Users> getUsers({
    required model.Session session,
    List<String>? facebookIds,
    List<String>? ids,
    List<String>? usernames,
  });

  Future<void> writeStorageObject({
    required model.Session session,
    String? collection,
    String? key,
    String? value,
    String? version,
    StorageWritePermission? writePermission,
    StorageReadPermission? readPermission,
  });

  Future<StorageObject> readStorageObject({
    required model.Session session,
    String? collection,
    String? key,
    String? userId,
  });

  Future<ChannelMessageList?> listChannelMessages({
    required model.Session session,
    required String channelId,
    int limit = 20,
    bool? forward,
    String? cursor,
  });

  Future<LeaderboardRecord> writeLeaderboardRecord({
    required model.Session session,
    required String leaderboardId,
    int? score,
    int? subscore,
    String? metadata,
  });

  Future<LeaderboardRecordList> listLeaderboardRecords({
    required model.Session session,
    required String leaderboardId,
    List<String>? ownerIds,
    int limit = 20,
    String? cursor,
    String? expiry,
  });

  Future<LeaderboardRecordList> listLeaderboardRecordsAroundOwner({
    required model.Session session,
    required String leaderboardId,
    String? ownerId,
    int limit = 20,
    String? expiry,
  });

  Future<Rpc> rpc({
    required model.Session session,
    required String id,
    String? payload,
    String? httpkey,
  });
}
