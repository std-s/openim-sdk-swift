// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: third.proto
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

public struct UpdateFcmTokenReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// fcm token
  public var fcmToken: String = String()

  /// expire time
  public var expireTime: Int64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct UpdateFcmTokenResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct SetAppBadgeReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// app unread count
  public var appUnreadCount: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct SetAppBadgeResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct UploadFileReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// file path
  public var filepath: String = String()

  /// file name
  public var name: String = String()

  /// http mime type
  public var mimeType: String = String()

  /// file category
  public var fileCategory: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct UploadFileResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// file url
  public var url: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct UploadSDKDataReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// upload line
  public var line: Int32 = 0

  /// upload extension fields
  public var ex: String = String()

  /// upload mode
  public var mode: UploadSDKDataMode = .uploadSdkdataMode_

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct UploadSDKDataResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct LogKv: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// key
  public var key: String = String()

  /// value
  public var value: Google_Protobuf_Any {
    get {return _value ?? Google_Protobuf_Any()}
    set {_value = newValue}
  }
  /// Returns true if `value` has been explicitly set.
  public var hasValue: Bool {return self._value != nil}
  /// Clears the value of `value`. Subsequent reads from it will return its default value.
  public mutating func clearValue() {self._value = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _value: Google_Protobuf_Any? = nil
}

public struct LogReq: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// log level
  public var logLevel: LogLevel = .levelFatal

  /// log file path
  public var file: String = String()

  /// log line
  public var line: Int32 = 0

  /// log message
  public var msg: String = String()

  /// log error message
  public var err: String = String()

  /// log key-value pairs
  public var kvs: [LogKv] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct LogResp: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "openim.sdk.third"

extension UpdateFcmTokenReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UpdateFcmTokenReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fcmToken"),
    2: .same(proto: "expireTime"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fcmToken) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.expireTime) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fcmToken.isEmpty {
      try visitor.visitSingularStringField(value: self.fcmToken, fieldNumber: 1)
    }
    if self.expireTime != 0 {
      try visitor.visitSingularInt64Field(value: self.expireTime, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UpdateFcmTokenReq, rhs: UpdateFcmTokenReq) -> Bool {
    if lhs.fcmToken != rhs.fcmToken {return false}
    if lhs.expireTime != rhs.expireTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UpdateFcmTokenResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UpdateFcmTokenResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UpdateFcmTokenResp, rhs: UpdateFcmTokenResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SetAppBadgeReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SetAppBadgeReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "appUnreadCount"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.appUnreadCount) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.appUnreadCount != 0 {
      try visitor.visitSingularInt32Field(value: self.appUnreadCount, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: SetAppBadgeReq, rhs: SetAppBadgeReq) -> Bool {
    if lhs.appUnreadCount != rhs.appUnreadCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SetAppBadgeResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SetAppBadgeResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: SetAppBadgeResp, rhs: SetAppBadgeResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UploadFileReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UploadFileReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "filepath"),
    2: .same(proto: "name"),
    3: .same(proto: "mimeType"),
    4: .same(proto: "fileCategory"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.filepath) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.mimeType) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.fileCategory) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.filepath.isEmpty {
      try visitor.visitSingularStringField(value: self.filepath, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.mimeType.isEmpty {
      try visitor.visitSingularStringField(value: self.mimeType, fieldNumber: 3)
    }
    if !self.fileCategory.isEmpty {
      try visitor.visitSingularStringField(value: self.fileCategory, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UploadFileReq, rhs: UploadFileReq) -> Bool {
    if lhs.filepath != rhs.filepath {return false}
    if lhs.name != rhs.name {return false}
    if lhs.mimeType != rhs.mimeType {return false}
    if lhs.fileCategory != rhs.fileCategory {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UploadFileResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UploadFileResp"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "url"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.url) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.url.isEmpty {
      try visitor.visitSingularStringField(value: self.url, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UploadFileResp, rhs: UploadFileResp) -> Bool {
    if lhs.url != rhs.url {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UploadSDKDataReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UploadSDKDataReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "line"),
    2: .same(proto: "ex"),
    3: .same(proto: "mode"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.line) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.ex) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.mode) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.line != 0 {
      try visitor.visitSingularInt32Field(value: self.line, fieldNumber: 1)
    }
    if !self.ex.isEmpty {
      try visitor.visitSingularStringField(value: self.ex, fieldNumber: 2)
    }
    if self.mode != .uploadSdkdataMode_ {
      try visitor.visitSingularEnumField(value: self.mode, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UploadSDKDataReq, rhs: UploadSDKDataReq) -> Bool {
    if lhs.line != rhs.line {return false}
    if lhs.ex != rhs.ex {return false}
    if lhs.mode != rhs.mode {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension UploadSDKDataResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UploadSDKDataResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UploadSDKDataResp, rhs: UploadSDKDataResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LogKv: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LogKv"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.key) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.key.isEmpty {
      try visitor.visitSingularStringField(value: self.key, fieldNumber: 1)
    }
    try { if let v = self._value {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LogKv, rhs: LogKv) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs._value != rhs._value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LogReq: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LogReq"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "logLevel"),
    2: .same(proto: "file"),
    3: .same(proto: "line"),
    4: .same(proto: "msg"),
    5: .same(proto: "err"),
    6: .same(proto: "kvs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.logLevel) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.file) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.line) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.msg) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.err) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.kvs) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.logLevel != .levelFatal {
      try visitor.visitSingularEnumField(value: self.logLevel, fieldNumber: 1)
    }
    if !self.file.isEmpty {
      try visitor.visitSingularStringField(value: self.file, fieldNumber: 2)
    }
    if self.line != 0 {
      try visitor.visitSingularInt32Field(value: self.line, fieldNumber: 3)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularStringField(value: self.msg, fieldNumber: 4)
    }
    if !self.err.isEmpty {
      try visitor.visitSingularStringField(value: self.err, fieldNumber: 5)
    }
    if !self.kvs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.kvs, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LogReq, rhs: LogReq) -> Bool {
    if lhs.logLevel != rhs.logLevel {return false}
    if lhs.file != rhs.file {return false}
    if lhs.line != rhs.line {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.err != rhs.err {return false}
    if lhs.kvs != rhs.kvs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LogResp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LogResp"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LogResp, rhs: LogResp) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
