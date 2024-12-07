// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: common.proto
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

public enum SessionType: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case sessionType_ // = 0

  /// Single represents a single chat session type.
  case single // = 1

  /// WriteGroup represents a write-diffusion group chat session type (not currently enabled, can be ignored).
  case writeGroup // = 2

  /// ReadGroup represents a read-diffusion group chat session type, used for all current group chats in OpenIM.
  case readGroup // = 3

  /// Notification represents a notification session type, generated by the client when the server sends a notification.
  case notification // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .sessionType_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .sessionType_
    case 1: self = .single
    case 2: self = .writeGroup
    case 3: self = .readGroup
    case 4: self = .notification
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .sessionType_: return 0
    case .single: return 1
    case .writeGroup: return 2
    case .readGroup: return 3
    case .notification: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [SessionType] = [
    .sessionType_,
    .single,
    .writeGroup,
    .readGroup,
    .notification,
  ]

}

public enum MsgFrom: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case msgFrom_ // = 0

  /// User represents a message type originating from a user.
  case user // = 100

  /// System represents a system message type, typically generated by the system.
  case system // = 200
  case UNRECOGNIZED(Int)

  public init() {
    self = .msgFrom_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .msgFrom_
    case 100: self = .user
    case 200: self = .system
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .msgFrom_: return 0
    case .user: return 100
    case .system: return 200
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [MsgFrom] = [
    .msgFrom_,
    .user,
    .system,
  ]

}

public enum Platform: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case platform_ // = 0

  /// iOS represents the Apple iOS platform.
  case iOs // = 1

  /// Android represents the Android platform.
  case android // = 2

  /// Windows represents the Microsoft Windows platform.
  case windows // = 3

  /// macOS represents the Apple macOS platform.
  case macOs // = 4

  /// Web represents the web browser platform.
  case web // = 5

  /// MiniWeb represents the mini-program or mini-web platform.
  case miniWeb // = 6

  /// Linux represents the Linux platform.
  case linux // = 7

  /// AndroidPad represents the Android tablet platform.
  case androidPad // = 8

  /// iPad represents the Apple iPad platform.
  case iPad // = 9

  /// Admin represents the admin panel or management platform, typically used for backend administrators.
  /// This platform is specifically for administrative filling and can generally be ignored.
  case admin // = 10

  /// HarmonyOS represents the Huawei HarmonyOS platform.
  case harmonyOs // = 11
  case UNRECOGNIZED(Int)

  public init() {
    self = .platform_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .platform_
    case 1: self = .iOs
    case 2: self = .android
    case 3: self = .windows
    case 4: self = .macOs
    case 5: self = .web
    case 6: self = .miniWeb
    case 7: self = .linux
    case 8: self = .androidPad
    case 9: self = .iPad
    case 10: self = .admin
    case 11: self = .harmonyOs
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .platform_: return 0
    case .iOs: return 1
    case .android: return 2
    case .windows: return 3
    case .macOs: return 4
    case .web: return 5
    case .miniWeb: return 6
    case .linux: return 7
    case .androidPad: return 8
    case .iPad: return 9
    case .admin: return 10
    case .harmonyOs: return 11
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [Platform] = [
    .platform_,
    .iOs,
    .android,
    .windows,
    .macOs,
    .web,
    .miniWeb,
    .linux,
    .androidPad,
    .iPad,
    .admin,
    .harmonyOs,
  ]

}

public enum AppFramework: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case appFramework_ // = 0
  case native // = 1
  case flutter // = 2
  case reactNative // = 3
  case electron // = 4
  case unity // = 5
  case unrealEngine // = 6
  case qt // = 7
  case dotNet // = 8
  case dotNetMaui // = 9
  case avalonia // = 10
  case cordova // = 11
  case uniApp // = 12
  case UNRECOGNIZED(Int)

  public init() {
    self = .appFramework_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .appFramework_
    case 1: self = .native
    case 2: self = .flutter
    case 3: self = .reactNative
    case 4: self = .electron
    case 5: self = .unity
    case 6: self = .unrealEngine
    case 7: self = .qt
    case 8: self = .dotNet
    case 9: self = .dotNetMaui
    case 10: self = .avalonia
    case 11: self = .cordova
    case 12: self = .uniApp
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .appFramework_: return 0
    case .native: return 1
    case .flutter: return 2
    case .reactNative: return 3
    case .electron: return 4
    case .unity: return 5
    case .unrealEngine: return 6
    case .qt: return 7
    case .dotNet: return 8
    case .dotNetMaui: return 9
    case .avalonia: return 10
    case .cordova: return 11
    case .uniApp: return 12
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [AppFramework] = [
    .appFramework_,
    .native,
    .flutter,
    .reactNative,
    .electron,
    .unity,
    .unrealEngine,
    .qt,
    .dotNet,
    .dotNetMaui,
    .avalonia,
    .cordova,
    .uniApp,
  ]

}

public enum MsgStatus: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case msgStatus_ // = 0
  case sending // = 1
  case sendSuccess // = 2
  case sendFailed // = 3
  case hasDeleted // = 4
  case filtered // = 5
  case UNRECOGNIZED(Int)

  public init() {
    self = .msgStatus_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .msgStatus_
    case 1: self = .sending
    case 2: self = .sendSuccess
    case 3: self = .sendFailed
    case 4: self = .hasDeleted
    case 5: self = .filtered
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .msgStatus_: return 0
    case .sending: return 1
    case .sendSuccess: return 2
    case .sendFailed: return 3
    case .hasDeleted: return 4
    case .filtered: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [MsgStatus] = [
    .msgStatus_,
    .sending,
    .sendSuccess,
    .sendFailed,
    .hasDeleted,
    .filtered,
  ]

}

public enum ContentType: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case contentType_ // = 0
  case text // = 101
  case picture // = 102
  case sound // = 103
  case video // = 104
  case file // = 105
  case atText // = 106
  case merge // = 107
  case card // = 108
  case location // = 109
  case custom // = 110
  case typing // = 113
  case quote // = 114
  case face // = 115
  case stream // = 116
  case advancedText // = 117
  case customMsgNotTriggerConversation // = 119
  case customMsgOnlineOnly // = 120

  ///  FriendApplicationRejectedNotification = 1202;
  ///  FriendApplicationNotification = 1203;
  ///  FriendAddedNotification = 1204;
  ///  FriendDeletedNotification = 1205;
  ///  FriendRemarkSetNotification = 1206;
  case friendApplicationApprovedNotification // = 1201

  ///  BlackAddedNotification = 1207;
  ///  BlackDeletedNotification = 1208;
  ///  FriendInfoUpdatedNotification = 1209;
  ///  FriendsInfoUpdateNotification = 1210;
  ///  ConversationChangeNotification = 1300;
  ///  UserInfoUpdatedNotification = 1303;
  ///  UserStatusChangeNotification = 1304;
  ///  UserCommandAddNotification = 1305;
  ///  UserCommandDeleteNotification = 1306;
  ///  UserCommandUpdateNotification = 1307;
  case groupCreatedNotification // = 1501

  ///  GroupInfoSetNotification = 1502;
  ///  JoinGroupApplicationNotification = 1503;
  case memberQuitNotification // = 1504

  ///  GroupApplicationAcceptedNotification = 1505;
  ///  GroupApplicationRejectedNotification = 1506;
  case groupOwnerTransferredNotification // = 1507
  case memberKickedNotification // = 1508
  case memberInvitedNotification // = 1509
  case memberEnterNotification // = 1510
  case groupDismissedNotification // = 1511
  case groupMemberMutedNotification // = 1512
  case groupMemberCancelMutedNotification // = 1513
  case groupMutedNotification // = 1514

  ///  GroupMemberInfoSetNotification = 1516;
  ///  GroupMemberSetToAdminNotification = 1517;
  ///  GroupMemberSetToOrdinaryUserNotification = 1518;
  ///  GroupInfoSetAnnouncementNotification = 1519;
  ///  GroupInfoSetNameNotification = 1520;
  ///  GroupNotificationEnd                     = 1599;
  case groupCancelMutedNotification // = 1515

  ///  ClearConversationNotification = 1703;
  case conversationPrivateChatNotification // = 1701
  case businessNotification // = 2001
  case revokedNotification // = 2101
  case UNRECOGNIZED(Int)

  public init() {
    self = .contentType_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .contentType_
    case 101: self = .text
    case 102: self = .picture
    case 103: self = .sound
    case 104: self = .video
    case 105: self = .file
    case 106: self = .atText
    case 107: self = .merge
    case 108: self = .card
    case 109: self = .location
    case 110: self = .custom
    case 113: self = .typing
    case 114: self = .quote
    case 115: self = .face
    case 116: self = .stream
    case 117: self = .advancedText
    case 119: self = .customMsgNotTriggerConversation
    case 120: self = .customMsgOnlineOnly
    case 1201: self = .friendApplicationApprovedNotification
    case 1501: self = .groupCreatedNotification
    case 1504: self = .memberQuitNotification
    case 1507: self = .groupOwnerTransferredNotification
    case 1508: self = .memberKickedNotification
    case 1509: self = .memberInvitedNotification
    case 1510: self = .memberEnterNotification
    case 1511: self = .groupDismissedNotification
    case 1512: self = .groupMemberMutedNotification
    case 1513: self = .groupMemberCancelMutedNotification
    case 1514: self = .groupMutedNotification
    case 1515: self = .groupCancelMutedNotification
    case 1701: self = .conversationPrivateChatNotification
    case 2001: self = .businessNotification
    case 2101: self = .revokedNotification
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .contentType_: return 0
    case .text: return 101
    case .picture: return 102
    case .sound: return 103
    case .video: return 104
    case .file: return 105
    case .atText: return 106
    case .merge: return 107
    case .card: return 108
    case .location: return 109
    case .custom: return 110
    case .typing: return 113
    case .quote: return 114
    case .face: return 115
    case .stream: return 116
    case .advancedText: return 117
    case .customMsgNotTriggerConversation: return 119
    case .customMsgOnlineOnly: return 120
    case .friendApplicationApprovedNotification: return 1201
    case .groupCreatedNotification: return 1501
    case .memberQuitNotification: return 1504
    case .groupOwnerTransferredNotification: return 1507
    case .memberKickedNotification: return 1508
    case .memberInvitedNotification: return 1509
    case .memberEnterNotification: return 1510
    case .groupDismissedNotification: return 1511
    case .groupMemberMutedNotification: return 1512
    case .groupMemberCancelMutedNotification: return 1513
    case .groupMutedNotification: return 1514
    case .groupCancelMutedNotification: return 1515
    case .conversationPrivateChatNotification: return 1701
    case .businessNotification: return 2001
    case .revokedNotification: return 2101
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [ContentType] = [
    .contentType_,
    .text,
    .picture,
    .sound,
    .video,
    .file,
    .atText,
    .merge,
    .card,
    .location,
    .custom,
    .typing,
    .quote,
    .face,
    .stream,
    .advancedText,
    .customMsgNotTriggerConversation,
    .customMsgOnlineOnly,
    .friendApplicationApprovedNotification,
    .groupCreatedNotification,
    .memberQuitNotification,
    .groupOwnerTransferredNotification,
    .memberKickedNotification,
    .memberInvitedNotification,
    .memberEnterNotification,
    .groupDismissedNotification,
    .groupMemberMutedNotification,
    .groupMemberCancelMutedNotification,
    .groupMutedNotification,
    .groupCancelMutedNotification,
    .conversationPrivateChatNotification,
    .businessNotification,
    .revokedNotification,
  ]

}

public enum ApprovalStatus: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case `default` // = 0
  case approved // = 1
  case rejected // = -1
  case UNRECOGNIZED(Int)

  public init() {
    self = .default
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case -1: self = .rejected
    case 0: self = .default
    case 1: self = .approved
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .rejected: return -1
    case .default: return 0
    case .approved: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [ApprovalStatus] = [
    .default,
    .approved,
    .rejected,
  ]

}

public enum ConvRecvMsgOpt: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case receiveMessage // = 0
  case notReceiveMessage // = 1
  case receiveNotNotifyMessage // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .receiveMessage
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .receiveMessage
    case 1: self = .notReceiveMessage
    case 2: self = .receiveNotNotifyMessage
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .receiveMessage: return 0
    case .notReceiveMessage: return 1
    case .receiveNotNotifyMessage: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [ConvRecvMsgOpt] = [
    .receiveMessage,
    .notReceiveMessage,
    .receiveNotNotifyMessage,
  ]

}

public enum ConvGroupAtType: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int
  case atNormal // = 0
  case atMe // = 1
  case atAll // = 2
  case atAllAtMe // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .atNormal
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .atNormal
    case 1: self = .atMe
    case 2: self = .atAll
    case 3: self = .atAllAtMe
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .atNormal: return 0
    case .atMe: return 1
    case .atAll: return 2
    case .atAllAtMe: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [ConvGroupAtType] = [
    .atNormal,
    .atMe,
    .atAll,
    .atAllAtMe,
  ]

}

/// GlobalRecvMsgOpt represents the global message receive option.
///
/// In the globalRecvMsgOpt of UserInfo, globally control whether to receive offline push notifications.
///
/// In the recvMsgOpt of a ConversationInfo, in addition to controlling whether to receive offline push notifications for that session,
/// it also controls whether the unread count of that session is included in the total unread count.
public enum GlobalRecvMsgOpt: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int

  /// Normally receive messages
  case normal // = 0

  /// Reserved field
  case notReceive // = 1

  /// Receive messages, but no offline push. When in conversation, this conversation's unread count is not included in the total unread count
  case notNotify // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .normal
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .normal
    case 1: self = .notReceive
    case 2: self = .notNotify
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .normal: return 0
    case .notReceive: return 1
    case .notNotify: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [GlobalRecvMsgOpt] = [
    .normal,
    .notReceive,
    .notNotify,
  ]

}

/// LogLevel represents the log level. debug -> info -> warn -> error -> fatal.
/// Default log level is LevelWarn or LevelDebug.
public enum LogLevel: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int

  /// only print fatal log
  case levelFatal // = 0

  /// print panic and fatal log
  case levelPanic // = 1

  /// print error, panic and fatal log
  case levelError // = 2

  /// print warn, error, panic and fatal log
  case levelWarn // = 3

  /// print info, warn, error, panic and fatal log
  case levelInfo // = 4

  /// print all level log
  case levelDebug // = 5

  /// print all level log and sql log
  case levelDebugWithSql // = 6
  case UNRECOGNIZED(Int)

  public init() {
    self = .levelFatal
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .levelFatal
    case 1: self = .levelPanic
    case 2: self = .levelError
    case 3: self = .levelWarn
    case 4: self = .levelInfo
    case 5: self = .levelDebug
    case 6: self = .levelDebugWithSql
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .levelFatal: return 0
    case .levelPanic: return 1
    case .levelError: return 2
    case .levelWarn: return 3
    case .levelInfo: return 4
    case .levelDebug: return 5
    case .levelDebugWithSql: return 6
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [LogLevel] = [
    .levelFatal,
    .levelPanic,
    .levelError,
    .levelWarn,
    .levelInfo,
    .levelDebug,
    .levelDebugWithSql,
  ]

}

/// UploadSDKDataMode represents the mode of upload sdk data.
/// If multiple modes are needed, their values should be ModeA | ModeB
/// e.g. UploadLogsAndDB = UploadLogs | UploadDB
public enum UploadSDKDataMode: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int

  /// invalid mode. Because the first enum value must be 0 in proto3, this field is required.
  case uploadSdkdataMode_ // = 0

  /// only upload logs
  case uploadLogs // = 1

  /// only upload db
  case uploadDb // = 2

  /// upload db and logs
  case uploadLogsAndDb // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .uploadSdkdataMode_
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .uploadSdkdataMode_
    case 1: self = .uploadLogs
    case 2: self = .uploadDb
    case 3: self = .uploadLogsAndDb
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .uploadSdkdataMode_: return 0
    case .uploadLogs: return 1
    case .uploadDb: return 2
    case .uploadLogsAndDb: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [UploadSDKDataMode] = [
    .uploadSdkdataMode_,
    .uploadLogs,
    .uploadDb,
    .uploadLogsAndDb,
  ]

}

public struct OfflinePushInfo: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var title: String = String()

  public var desc: String = String()

  public var ex: String = String()

  public var iOspushSound: String = String()

  public var iOsbadgeCount: Bool = false

  public var signalInfo: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct RequestPagination: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var pageNumber: Int32 = 0

  public var showNumber: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "openim.sdk.common"

extension SessionType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SessionType_"),
    1: .same(proto: "Single"),
    2: .same(proto: "WriteGroup"),
    3: .same(proto: "ReadGroup"),
    4: .same(proto: "Notification"),
  ]
}

extension MsgFrom: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "MsgFrom_"),
    100: .same(proto: "User"),
    200: .same(proto: "System"),
  ]
}

extension Platform: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Platform_"),
    1: .same(proto: "iOS"),
    2: .same(proto: "Android"),
    3: .same(proto: "Windows"),
    4: .same(proto: "macOS"),
    5: .same(proto: "Web"),
    6: .same(proto: "MiniWeb"),
    7: .same(proto: "Linux"),
    8: .same(proto: "AndroidPad"),
    9: .same(proto: "iPad"),
    10: .same(proto: "Admin"),
    11: .same(proto: "HarmonyOS"),
  ]
}

extension AppFramework: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "AppFramework_"),
    1: .same(proto: "Native"),
    2: .same(proto: "Flutter"),
    3: .same(proto: "ReactNative"),
    4: .same(proto: "Electron"),
    5: .same(proto: "Unity"),
    6: .same(proto: "UnrealEngine"),
    7: .same(proto: "Qt"),
    8: .same(proto: "DotNet"),
    9: .same(proto: "DotNetMAUI"),
    10: .same(proto: "Avalonia"),
    11: .same(proto: "Cordova"),
    12: .same(proto: "UniApp"),
  ]
}

extension MsgStatus: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "MsgStatus_"),
    1: .same(proto: "Sending"),
    2: .same(proto: "SendSuccess"),
    3: .same(proto: "SendFailed"),
    4: .same(proto: "HasDeleted"),
    5: .same(proto: "Filtered"),
  ]
}

extension ContentType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ContentType_"),
    101: .same(proto: "Text"),
    102: .same(proto: "Picture"),
    103: .same(proto: "Sound"),
    104: .same(proto: "Video"),
    105: .same(proto: "File"),
    106: .same(proto: "AtText"),
    107: .same(proto: "Merge"),
    108: .same(proto: "Card"),
    109: .same(proto: "Location"),
    110: .same(proto: "Custom"),
    113: .same(proto: "Typing"),
    114: .same(proto: "Quote"),
    115: .same(proto: "Face"),
    116: .same(proto: "Stream"),
    117: .same(proto: "AdvancedText"),
    119: .same(proto: "CustomMsgNotTriggerConversation"),
    120: .same(proto: "CustomMsgOnlineOnly"),
    1201: .same(proto: "FriendApplicationApprovedNotification"),
    1501: .same(proto: "GroupCreatedNotification"),
    1504: .same(proto: "MemberQuitNotification"),
    1507: .same(proto: "GroupOwnerTransferredNotification"),
    1508: .same(proto: "MemberKickedNotification"),
    1509: .same(proto: "MemberInvitedNotification"),
    1510: .same(proto: "MemberEnterNotification"),
    1511: .same(proto: "GroupDismissedNotification"),
    1512: .same(proto: "GroupMemberMutedNotification"),
    1513: .same(proto: "GroupMemberCancelMutedNotification"),
    1514: .same(proto: "GroupMutedNotification"),
    1515: .same(proto: "GroupCancelMutedNotification"),
    1701: .same(proto: "ConversationPrivateChatNotification"),
    2001: .same(proto: "BusinessNotification"),
    2101: .same(proto: "RevokedNotification"),
  ]
}

extension ApprovalStatus: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    -1: .same(proto: "Rejected"),
    0: .same(proto: "Default"),
    1: .same(proto: "Approved"),
  ]
}

extension ConvRecvMsgOpt: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ReceiveMessage"),
    1: .same(proto: "NotReceiveMessage"),
    2: .same(proto: "ReceiveNotNotifyMessage"),
  ]
}

extension ConvGroupAtType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "AtNormal"),
    1: .same(proto: "AtMe"),
    2: .same(proto: "AtAll"),
    3: .same(proto: "AtAllAtMe"),
  ]
}

extension GlobalRecvMsgOpt: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Normal"),
    1: .same(proto: "NotReceive"),
    2: .same(proto: "NotNotify"),
  ]
}

extension LogLevel: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "LevelFatal"),
    1: .same(proto: "LevelPanic"),
    2: .same(proto: "LevelError"),
    3: .same(proto: "LevelWarn"),
    4: .same(proto: "LevelInfo"),
    5: .same(proto: "LevelDebug"),
    6: .same(proto: "LevelDebugWithSQL"),
  ]
}

extension UploadSDKDataMode: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UploadSDKDataMode_"),
    1: .same(proto: "UploadLogs"),
    2: .same(proto: "UploadDB"),
    3: .same(proto: "UploadLogsAndDB"),
  ]
}

extension OfflinePushInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OfflinePushInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "desc"),
    3: .same(proto: "ex"),
    4: .same(proto: "iOSPushSound"),
    5: .same(proto: "iOSBadgeCount"),
    6: .same(proto: "signalInfo"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.desc) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.ex) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.iOspushSound) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.iOsbadgeCount) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.signalInfo) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.desc.isEmpty {
      try visitor.visitSingularStringField(value: self.desc, fieldNumber: 2)
    }
    if !self.ex.isEmpty {
      try visitor.visitSingularStringField(value: self.ex, fieldNumber: 3)
    }
    if !self.iOspushSound.isEmpty {
      try visitor.visitSingularStringField(value: self.iOspushSound, fieldNumber: 4)
    }
    if self.iOsbadgeCount != false {
      try visitor.visitSingularBoolField(value: self.iOsbadgeCount, fieldNumber: 5)
    }
    if !self.signalInfo.isEmpty {
      try visitor.visitSingularStringField(value: self.signalInfo, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: OfflinePushInfo, rhs: OfflinePushInfo) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.desc != rhs.desc {return false}
    if lhs.ex != rhs.ex {return false}
    if lhs.iOspushSound != rhs.iOspushSound {return false}
    if lhs.iOsbadgeCount != rhs.iOsbadgeCount {return false}
    if lhs.signalInfo != rhs.signalInfo {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension RequestPagination: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RequestPagination"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pageNumber"),
    2: .same(proto: "showNumber"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.pageNumber) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.showNumber) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.pageNumber != 0 {
      try visitor.visitSingularInt32Field(value: self.pageNumber, fieldNumber: 1)
    }
    if self.showNumber != 0 {
      try visitor.visitSingularInt32Field(value: self.showNumber, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: RequestPagination, rhs: RequestPagination) -> Bool {
    if lhs.pageNumber != rhs.pageNumber {return false}
    if lhs.showNumber != rhs.showNumber {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}