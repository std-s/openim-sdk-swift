// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: error.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum ErrorCode: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int

  /// NoError is the zero value of ErrorCode.
  case noError // = 0

  /// Common error codes.
  case serverInternal // = 500
  case args // = 1001
  case noPermission // = 1002
  case duplicateKey // = 1003
  case recordNotFound // = 1004
  case tokenExpired // = 1501
  case tokenInvalid // = 1502
  case tokenMalformed // = 1503
  case tokenNotValidYet // = 1504
  case tokenUnknown // = 1505
  case tokenKicked // = 1506
  case tokenNotExist // = 1507
  case sdkNetwork // = 10000
  case sdkNetworkTimeout // = 10001
  case sdkArgs // = 10002
  case sdkCtxDeadlineExceeded // = 10003
  case sdkResourceLoadNotComplete // = 10004
  case sdkUnknownCode // = 10005
  case sdkInternal // = 10006
  case sdkFuncNotFound // = 10007
  case sdkNotInit // = 10008
  case sdkNotLogin // = 10009
  case sdkUserIdnotFound // = 10100
  case sdkLoginOut // = 10101
  case sdkLoginRepeat // = 10102
  case sdkFileNotFound // = 10200
  case sdkMsgDeCompression // = 10201
  case sdkMsgDecodeBinaryWs // = 10202
  case sdkMsgBinaryTypeNotSupport // = 10203
  case sdkMsgRepeat // = 10204
  case sdkMsgContentTypeNotSupport // = 10205
  case sdkMsgHasNoSeq // = 10206
  case sdkNotSupportOpt // = 10301
  case sdkNotSupportType // = 10302
  case sdkUnreadCount // = 10303
  case sdkGroupIdnotFound // = 10400
  case sdkGroupType // = 10401
  case srvUserIdnotFound // = 1101
  case srvRegisteredAlready // = 1102
  case srvGroupIdnotFound // = 1201
  case srvGroupIdexisted // = 1202
  case srvNotInGroupYet // = 1203
  case srvDismissedAlready // = 1204
  case srvGroupTypeNotSupport // = 1205
  case srvGroupRequestHandled // = 1206
  case srvCanNotAddYourself // = 1301
  case srvBlockedByPeer // = 1302
  case srvNotPeersFriend // = 1303
  case srvRelationshipAlready // = 1304
  case srvMessageHasReadDisable // = 1401
  case srvMutedInGroup // = 1402
  case srvMutedGroup // = 1403
  case srvMsgAlreadyRevoke // = 1404
  case srvConnOverMaxNumLimit // = 1601
  case srvConnArgs // = 1602
  case srvPushMsg // = 1603
  case srvIosbackgroundPush // = 1604
  case srvFileUploadedExpired // = 1701
  case srvDatabase // = 90002
  case srvNetwork // = 90004
  case srvData // = 90007
  case srvCallback // = 80000
  case UNRECOGNIZED(Int)

  public init() {
    self = .noError
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .noError
    case 500: self = .serverInternal
    case 1001: self = .args
    case 1002: self = .noPermission
    case 1003: self = .duplicateKey
    case 1004: self = .recordNotFound
    case 1101: self = .srvUserIdnotFound
    case 1102: self = .srvRegisteredAlready
    case 1201: self = .srvGroupIdnotFound
    case 1202: self = .srvGroupIdexisted
    case 1203: self = .srvNotInGroupYet
    case 1204: self = .srvDismissedAlready
    case 1205: self = .srvGroupTypeNotSupport
    case 1206: self = .srvGroupRequestHandled
    case 1301: self = .srvCanNotAddYourself
    case 1302: self = .srvBlockedByPeer
    case 1303: self = .srvNotPeersFriend
    case 1304: self = .srvRelationshipAlready
    case 1401: self = .srvMessageHasReadDisable
    case 1402: self = .srvMutedInGroup
    case 1403: self = .srvMutedGroup
    case 1404: self = .srvMsgAlreadyRevoke
    case 1501: self = .tokenExpired
    case 1502: self = .tokenInvalid
    case 1503: self = .tokenMalformed
    case 1504: self = .tokenNotValidYet
    case 1505: self = .tokenUnknown
    case 1506: self = .tokenKicked
    case 1507: self = .tokenNotExist
    case 1601: self = .srvConnOverMaxNumLimit
    case 1602: self = .srvConnArgs
    case 1603: self = .srvPushMsg
    case 1604: self = .srvIosbackgroundPush
    case 1701: self = .srvFileUploadedExpired
    case 10000: self = .sdkNetwork
    case 10001: self = .sdkNetworkTimeout
    case 10002: self = .sdkArgs
    case 10003: self = .sdkCtxDeadlineExceeded
    case 10004: self = .sdkResourceLoadNotComplete
    case 10005: self = .sdkUnknownCode
    case 10006: self = .sdkInternal
    case 10007: self = .sdkFuncNotFound
    case 10008: self = .sdkNotInit
    case 10009: self = .sdkNotLogin
    case 10100: self = .sdkUserIdnotFound
    case 10101: self = .sdkLoginOut
    case 10102: self = .sdkLoginRepeat
    case 10200: self = .sdkFileNotFound
    case 10201: self = .sdkMsgDeCompression
    case 10202: self = .sdkMsgDecodeBinaryWs
    case 10203: self = .sdkMsgBinaryTypeNotSupport
    case 10204: self = .sdkMsgRepeat
    case 10205: self = .sdkMsgContentTypeNotSupport
    case 10206: self = .sdkMsgHasNoSeq
    case 10301: self = .sdkNotSupportOpt
    case 10302: self = .sdkNotSupportType
    case 10303: self = .sdkUnreadCount
    case 10400: self = .sdkGroupIdnotFound
    case 10401: self = .sdkGroupType
    case 80000: self = .srvCallback
    case 90002: self = .srvDatabase
    case 90004: self = .srvNetwork
    case 90007: self = .srvData
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .noError: return 0
    case .serverInternal: return 500
    case .args: return 1001
    case .noPermission: return 1002
    case .duplicateKey: return 1003
    case .recordNotFound: return 1004
    case .srvUserIdnotFound: return 1101
    case .srvRegisteredAlready: return 1102
    case .srvGroupIdnotFound: return 1201
    case .srvGroupIdexisted: return 1202
    case .srvNotInGroupYet: return 1203
    case .srvDismissedAlready: return 1204
    case .srvGroupTypeNotSupport: return 1205
    case .srvGroupRequestHandled: return 1206
    case .srvCanNotAddYourself: return 1301
    case .srvBlockedByPeer: return 1302
    case .srvNotPeersFriend: return 1303
    case .srvRelationshipAlready: return 1304
    case .srvMessageHasReadDisable: return 1401
    case .srvMutedInGroup: return 1402
    case .srvMutedGroup: return 1403
    case .srvMsgAlreadyRevoke: return 1404
    case .tokenExpired: return 1501
    case .tokenInvalid: return 1502
    case .tokenMalformed: return 1503
    case .tokenNotValidYet: return 1504
    case .tokenUnknown: return 1505
    case .tokenKicked: return 1506
    case .tokenNotExist: return 1507
    case .srvConnOverMaxNumLimit: return 1601
    case .srvConnArgs: return 1602
    case .srvPushMsg: return 1603
    case .srvIosbackgroundPush: return 1604
    case .srvFileUploadedExpired: return 1701
    case .sdkNetwork: return 10000
    case .sdkNetworkTimeout: return 10001
    case .sdkArgs: return 10002
    case .sdkCtxDeadlineExceeded: return 10003
    case .sdkResourceLoadNotComplete: return 10004
    case .sdkUnknownCode: return 10005
    case .sdkInternal: return 10006
    case .sdkFuncNotFound: return 10007
    case .sdkNotInit: return 10008
    case .sdkNotLogin: return 10009
    case .sdkUserIdnotFound: return 10100
    case .sdkLoginOut: return 10101
    case .sdkLoginRepeat: return 10102
    case .sdkFileNotFound: return 10200
    case .sdkMsgDeCompression: return 10201
    case .sdkMsgDecodeBinaryWs: return 10202
    case .sdkMsgBinaryTypeNotSupport: return 10203
    case .sdkMsgRepeat: return 10204
    case .sdkMsgContentTypeNotSupport: return 10205
    case .sdkMsgHasNoSeq: return 10206
    case .sdkNotSupportOpt: return 10301
    case .sdkNotSupportType: return 10302
    case .sdkUnreadCount: return 10303
    case .sdkGroupIdnotFound: return 10400
    case .sdkGroupType: return 10401
    case .srvCallback: return 80000
    case .srvDatabase: return 90002
    case .srvNetwork: return 90004
    case .srvData: return 90007
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [ErrorCode] = [
    .noError,
    .serverInternal,
    .args,
    .noPermission,
    .duplicateKey,
    .recordNotFound,
    .tokenExpired,
    .tokenInvalid,
    .tokenMalformed,
    .tokenNotValidYet,
    .tokenUnknown,
    .tokenKicked,
    .tokenNotExist,
    .sdkNetwork,
    .sdkNetworkTimeout,
    .sdkArgs,
    .sdkCtxDeadlineExceeded,
    .sdkResourceLoadNotComplete,
    .sdkUnknownCode,
    .sdkInternal,
    .sdkFuncNotFound,
    .sdkNotInit,
    .sdkNotLogin,
    .sdkUserIdnotFound,
    .sdkLoginOut,
    .sdkLoginRepeat,
    .sdkFileNotFound,
    .sdkMsgDeCompression,
    .sdkMsgDecodeBinaryWs,
    .sdkMsgBinaryTypeNotSupport,
    .sdkMsgRepeat,
    .sdkMsgContentTypeNotSupport,
    .sdkMsgHasNoSeq,
    .sdkNotSupportOpt,
    .sdkNotSupportType,
    .sdkUnreadCount,
    .sdkGroupIdnotFound,
    .sdkGroupType,
    .srvUserIdnotFound,
    .srvRegisteredAlready,
    .srvGroupIdnotFound,
    .srvGroupIdexisted,
    .srvNotInGroupYet,
    .srvDismissedAlready,
    .srvGroupTypeNotSupport,
    .srvGroupRequestHandled,
    .srvCanNotAddYourself,
    .srvBlockedByPeer,
    .srvNotPeersFriend,
    .srvRelationshipAlready,
    .srvMessageHasReadDisable,
    .srvMutedInGroup,
    .srvMutedGroup,
    .srvMsgAlreadyRevoke,
    .srvConnOverMaxNumLimit,
    .srvConnArgs,
    .srvPushMsg,
    .srvIosbackgroundPush,
    .srvFileUploadedExpired,
    .srvDatabase,
    .srvNetwork,
    .srvData,
    .srvCallback,
  ]

}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ErrorCode: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NoError"),
    500: .same(proto: "ServerInternal"),
    1001: .same(proto: "Args"),
    1002: .same(proto: "NoPermission"),
    1003: .same(proto: "DuplicateKey"),
    1004: .same(proto: "RecordNotFound"),
    1101: .same(proto: "SrvUserIDNotFound"),
    1102: .same(proto: "SrvRegisteredAlready"),
    1201: .same(proto: "SrvGroupIDNotFound"),
    1202: .same(proto: "SrvGroupIDExisted"),
    1203: .same(proto: "SrvNotInGroupYet"),
    1204: .same(proto: "SrvDismissedAlready"),
    1205: .same(proto: "SrvGroupTypeNotSupport"),
    1206: .same(proto: "SrvGroupRequestHandled"),
    1301: .same(proto: "SrvCanNotAddYourself"),
    1302: .same(proto: "SrvBlockedByPeer"),
    1303: .same(proto: "SrvNotPeersFriend"),
    1304: .same(proto: "SrvRelationshipAlready"),
    1401: .same(proto: "SrvMessageHasReadDisable"),
    1402: .same(proto: "SrvMutedInGroup"),
    1403: .same(proto: "SrvMutedGroup"),
    1404: .same(proto: "SrvMsgAlreadyRevoke"),
    1501: .same(proto: "TokenExpired"),
    1502: .same(proto: "TokenInvalid"),
    1503: .same(proto: "TokenMalformed"),
    1504: .same(proto: "TokenNotValidYet"),
    1505: .same(proto: "TokenUnknown"),
    1506: .same(proto: "TokenKicked"),
    1507: .same(proto: "TokenNotExist"),
    1601: .same(proto: "SrvConnOverMaxNumLimit"),
    1602: .same(proto: "SrvConnArgs"),
    1603: .same(proto: "SrvPushMsg"),
    1604: .same(proto: "SrvIOSBackgroundPush"),
    1701: .same(proto: "SrvFileUploadedExpired"),
    10000: .same(proto: "SdkNetwork"),
    10001: .same(proto: "SdkNetworkTimeout"),
    10002: .same(proto: "SdkArgs"),
    10003: .same(proto: "SdkCtxDeadlineExceeded"),
    10004: .same(proto: "SdkResourceLoadNotComplete"),
    10005: .same(proto: "SdkUnknownCode"),
    10006: .same(proto: "SdkInternal"),
    10007: .same(proto: "SdkFuncNotFound"),
    10008: .same(proto: "SdkNotInit"),
    10009: .same(proto: "SdkNotLogin"),
    10100: .same(proto: "SdkUserIDNotFound"),
    10101: .same(proto: "SdkLoginOut"),
    10102: .same(proto: "SdkLoginRepeat"),
    10200: .same(proto: "SdkFileNotFound"),
    10201: .same(proto: "SdkMsgDeCompression"),
    10202: .same(proto: "SdkMsgDecodeBinaryWs"),
    10203: .same(proto: "SdkMsgBinaryTypeNotSupport"),
    10204: .same(proto: "SdkMsgRepeat"),
    10205: .same(proto: "SdkMsgContentTypeNotSupport"),
    10206: .same(proto: "SdkMsgHasNoSeq"),
    10301: .same(proto: "SdkNotSupportOpt"),
    10302: .same(proto: "SdkNotSupportType"),
    10303: .same(proto: "SdkUnreadCount"),
    10400: .same(proto: "SdkGroupIDNotFound"),
    10401: .same(proto: "SdkGroupType"),
    80000: .same(proto: "SrvCallback"),
    90002: .same(proto: "SrvDatabase"),
    90004: .same(proto: "SrvNetwork"),
    90007: .same(proto: "SrvData"),
  ]
}