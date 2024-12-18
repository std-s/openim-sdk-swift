// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: user.proto
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

public struct GetSelfUserInfoReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct GetSelfUserInfoResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userinfo
  public var user: IMUser {
    get {return _user ?? IMUser()}
    set {_user = newValue}
  }
  /// Returns true if `user` has been explicitly set.
  public var hasUser: Bool {return self._user != nil}
  /// Clears the value of `user`. Subsequent reads from it will return its default value.
  public mutating func clearUser() {self._user = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _user: IMUser? = nil
}

public struct SetSelfInfoReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// user id
  public var userID: String = String()

  /// user nickname
  public var nickname: String {
    get {return _nickname ?? String()}
    set {_nickname = newValue}
  }
  /// Returns true if `nickname` has been explicitly set.
  public var hasNickname: Bool {return self._nickname != nil}
  /// Clears the value of `nickname`. Subsequent reads from it will return its default value.
  public mutating func clearNickname() {self._nickname = nil}

  /// user face url
  public var faceURL: String {
    get {return _faceURL ?? String()}
    set {_faceURL = newValue}
  }
  /// Returns true if `faceURL` has been explicitly set.
  public var hasFaceURL: Bool {return self._faceURL != nil}
  /// Clears the value of `faceURL`. Subsequent reads from it will return its default value.
  public mutating func clearFaceURL() {self._faceURL = nil}

  /// user extension fields
  public var ex: String {
    get {return _ex ?? String()}
    set {_ex = newValue}
  }
  /// Returns true if `ex` has been explicitly set.
  public var hasEx: Bool {return self._ex != nil}
  /// Clears the value of `ex`. Subsequent reads from it will return its default value.
  public mutating func clearEx() {self._ex = nil}

  /// control global offline push.
  public var globalRecvMsgOpt: GlobalRecvMsgOpt {
    get {return _globalRecvMsgOpt ?? .normal}
    set {_globalRecvMsgOpt = newValue}
  }
  /// Returns true if `globalRecvMsgOpt` has been explicitly set.
  public var hasGlobalRecvMsgOpt: Bool {return self._globalRecvMsgOpt != nil}
  /// Clears the value of `globalRecvMsgOpt`. Subsequent reads from it will return its default value.
  public mutating func clearGlobalRecvMsgOpt() {self._globalRecvMsgOpt = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _nickname: String? = nil
  fileprivate var _faceURL: String? = nil
  fileprivate var _ex: String? = nil
  fileprivate var _globalRecvMsgOpt: GlobalRecvMsgOpt? = nil
}

public struct SetSelfInfoResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandAddReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userid
  public var userID: String = String()

  /// command type
  public var type: Int32 = 0

  /// command uuid
  public var uuid: String = String()

  /// command value
  public var value: String {
    get {return _value ?? String()}
    set {_value = newValue}
  }
  /// Returns true if `value` has been explicitly set.
  public var hasValue: Bool {return self._value != nil}
  /// Clears the value of `value`. Subsequent reads from it will return its default value.
  public mutating func clearValue() {self._value = nil}

  /// command extension fields
  public var ex: String {
    get {return _ex ?? String()}
    set {_ex = newValue}
  }
  /// Returns true if `ex` has been explicitly set.
  public var hasEx: Bool {return self._ex != nil}
  /// Clears the value of `ex`. Subsequent reads from it will return its default value.
  public mutating func clearEx() {self._ex = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _value: String? = nil
  fileprivate var _ex: String? = nil
}

public struct ProcessUserCommandAddResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandDeleteReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userid
  public var userID: String = String()

  /// command type
  public var type: Int32 = 0

  /// command uuid
  public var uuid: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandDeleteResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandUpdateReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userid
  public var userID: String = String()

  /// command type
  public var type: Int32 = 0

  /// command uuid
  public var uuid: String = String()

  /// command value
  public var value: String {
    get {return _value ?? String()}
    set {_value = newValue}
  }
  /// Returns true if `value` has been explicitly set.
  public var hasValue: Bool {return self._value != nil}
  /// Clears the value of `value`. Subsequent reads from it will return its default value.
  public mutating func clearValue() {self._value = nil}

  /// command extension fields
  public var ex: String {
    get {return _ex ?? String()}
    set {_ex = newValue}
  }
  /// Returns true if `ex` has been explicitly set.
  public var hasEx: Bool {return self._ex != nil}
  /// Clears the value of `ex`. Subsequent reads from it will return its default value.
  public mutating func clearEx() {self._ex = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _value: String? = nil
  fileprivate var _ex: String? = nil
}

public struct ProcessUserCommandUpdateResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandGetAllReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ProcessUserCommandGetAllResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// command info list
  public var commands: [CommandInfo] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct GetUsersInfoReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userid list
  public var userIds: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct GetUsersInfoResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// userinfo list
  public var users: [IMUser] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "openim.sdk.user"

extension GetSelfUserInfoReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetSelfUserInfoReq"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: GetSelfUserInfoReq, rhs: GetSelfUserInfoReq) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GetSelfUserInfoResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetSelfUserInfoResp"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._user) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._user {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: GetSelfUserInfoResp, rhs: GetSelfUserInfoResp) -> Bool {
    if lhs._user != rhs._user {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SetSelfInfoReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SetSelfInfoReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userID"),
    2: .same(proto: "nickname"),
    3: .same(proto: "faceURL"),
    4: .same(proto: "ex"),
    7: .same(proto: "globalRecvMsgOpt"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._nickname) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self._faceURL) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self._ex) }()
      case 7: try { try decoder.decodeSingularEnumField(value: &self._globalRecvMsgOpt) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    try { if let v = self._nickname {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._faceURL {
      try visitor.visitSingularStringField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._ex {
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._globalRecvMsgOpt {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 7)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: SetSelfInfoReq, rhs: SetSelfInfoReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs._nickname != rhs._nickname {return false}
    if lhs._faceURL != rhs._faceURL {return false}
    if lhs._ex != rhs._ex {return false}
    if lhs._globalRecvMsgOpt != rhs._globalRecvMsgOpt {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SetSelfInfoResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SetSelfInfoResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: SetSelfInfoResp, rhs: SetSelfInfoResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandAddReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandAddReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userID"),
    2: .same(proto: "type"),
    3: .same(proto: "uuid"),
    4: .same(proto: "value"),
    5: .same(proto: "ex"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.type) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.uuid) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self._value) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self._ex) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if self.type != 0 {
      try visitor.visitSingularInt32Field(value: self.type, fieldNumber: 2)
    }
    if !self.uuid.isEmpty {
      try visitor.visitSingularStringField(value: self.uuid, fieldNumber: 3)
    }
    try { if let v = self._value {
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._ex {
      try visitor.visitSingularStringField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandAddReq, rhs: ProcessUserCommandAddReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.type != rhs.type {return false}
    if lhs.uuid != rhs.uuid {return false}
    if lhs._value != rhs._value {return false}
    if lhs._ex != rhs._ex {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandAddResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandAddResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandAddResp, rhs: ProcessUserCommandAddResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandDeleteReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandDeleteReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userID"),
    2: .same(proto: "type"),
    3: .same(proto: "uuid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.type) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.uuid) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if self.type != 0 {
      try visitor.visitSingularInt32Field(value: self.type, fieldNumber: 2)
    }
    if !self.uuid.isEmpty {
      try visitor.visitSingularStringField(value: self.uuid, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandDeleteReq, rhs: ProcessUserCommandDeleteReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.type != rhs.type {return false}
    if lhs.uuid != rhs.uuid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandDeleteResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandDeleteResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandDeleteResp, rhs: ProcessUserCommandDeleteResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandUpdateReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandUpdateReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userID"),
    2: .same(proto: "type"),
    3: .same(proto: "uuid"),
    4: .same(proto: "value"),
    5: .same(proto: "ex"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.type) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.uuid) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self._value) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self._ex) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if self.type != 0 {
      try visitor.visitSingularInt32Field(value: self.type, fieldNumber: 2)
    }
    if !self.uuid.isEmpty {
      try visitor.visitSingularStringField(value: self.uuid, fieldNumber: 3)
    }
    try { if let v = self._value {
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._ex {
      try visitor.visitSingularStringField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandUpdateReq, rhs: ProcessUserCommandUpdateReq) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.type != rhs.type {return false}
    if lhs.uuid != rhs.uuid {return false}
    if lhs._value != rhs._value {return false}
    if lhs._ex != rhs._ex {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandUpdateResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandUpdateResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandUpdateResp, rhs: ProcessUserCommandUpdateResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandGetAllReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandGetAllReq"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandGetAllReq, rhs: ProcessUserCommandGetAllReq) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ProcessUserCommandGetAllResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProcessUserCommandGetAllResp"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "commands"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.commands) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.commands.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.commands, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ProcessUserCommandGetAllResp, rhs: ProcessUserCommandGetAllResp) -> Bool {
    if lhs.commands != rhs.commands {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GetUsersInfoReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetUsersInfoReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userIDs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.userIds) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.userIds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: GetUsersInfoReq, rhs: GetUsersInfoReq) -> Bool {
    if lhs.userIds != rhs.userIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GetUsersInfoResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetUsersInfoResp"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "users"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.users) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.users.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.users, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: GetUsersInfoResp, rhs: GetUsersInfoResp) -> Bool {
    if lhs.users != rhs.users {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
