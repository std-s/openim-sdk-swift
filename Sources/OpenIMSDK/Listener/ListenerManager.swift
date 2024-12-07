import Foundation
import SwiftProtobuf
import OpenIMSDKCore

class ListenerManager {
    static var shared = ListenerManager()
    
    private init() {}
    
    func setProgressListener(handleID: UInt64, listener: OnProgressListener) {
        progressListeners[handleID] = Weak(listener)
    }
    
    func addListener<T: Listener>(_ listener: T) {
        if let listener = listener as? OnConnectListener {
            if !connectListeners.contains(where: { $0.value === listener }) {
                connectListeners.append(Weak(listener))
            }
        } else if let listener = listener as? OnUserListener {
            if !userListeners.contains(where: { $0.value === listener }) {
                userListeners.append(Weak(listener))
            }
        } else if let listener = listener as? OnConversationListener {
            if !conversationListeners.contains(where: { $0.value === listener }) {
                conversationListeners.append(Weak(listener))
            }
        } else if let listener = listener as? OnMessageListener {
            if !messageListeners.contains(where: { $0.value === listener }) {
                messageListeners.append(Weak(listener))
            }
        } else if let listener = listener as? OnFriendshipListener {
            if !friendshipListeners.contains(where: { $0.value === listener }) {
                friendshipListeners.append(Weak(listener))
            }
        } else if let listener = listener as? OnGroupListener {
            if !groupListeners.contains(where: { $0.value === listener }) {
                groupListeners.append(Weak(listener))
            }
        }
        
        cleanUpReleasedListeners()
    }
    
    func removeListener<T: Listener>(_ listener: T) {
        if let listener = listener as? OnConnectListener {
            connectListeners.removeAll { $0.value === listener }
        } else if let listener = listener as? OnUserListener {
            userListeners.removeAll { $0.value === listener }
        } else if let listener = listener as? OnConversationListener {
            conversationListeners.removeAll { $0.value === listener }
        } else if let listener = listener as? OnMessageListener {
            messageListeners.removeAll { $0.value === listener }
        } else if let listener = listener as? OnFriendshipListener {
            friendshipListeners.removeAll { $0.value === listener }
        } else if let listener = listener as? OnGroupListener {
            groupListeners.removeAll { $0.value === listener }
        }
        
        cleanUpReleasedListeners()
    }
    
    private func cleanUpReleasedListeners() {
        connectListeners.removeAll { $0.value == nil }
        userListeners.removeAll { $0.value == nil }
        conversationListeners.removeAll { $0.value == nil }
        messageListeners.removeAll { $0.value == nil }
        friendshipListeners.removeAll { $0.value == nil }
        groupListeners.removeAll { $0.value == nil }
    }
    
    private var connectListeners: [Weak<OnConnectListener>] = []
    private var userListeners: [Weak<OnUserListener>] = []
    private var conversationListeners: [Weak<OnConversationListener>] = []
    private var messageListeners: [Weak<OnMessageListener>] = []
    private var friendshipListeners: [Weak<OnFriendshipListener>] = []
    private var groupListeners: [Weak<OnGroupListener>] = []
    private var progressListeners: [UInt64: Weak<OnProgressListener>] = [:]
    
    private let connectModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnConnecting: { try? EventOnConnectingData(serializedBytes: $0) },
        .eventOnConnectSuccess: { try? EventOnConnectSuccessData(serializedBytes: $0) },
        .eventOnKickedOffline: { try? EventOnKickedOfflineData(serializedBytes: $0) },
        .eventOnConnectFailed: { try? EventOnConnectingData(serializedBytes: $0) },
        .eventOnUserTokenInvalid: { try? EventOnUserTokenInvalidData(serializedBytes: $0) }
    ]
    
    private let userModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnSelfInfoUpdated: { try? EventOnSelfInfoUpdatedData(serializedBytes: $0) },
        .eventOnUserStatusChanged: { try? EventOnUserStatusChangedData(serializedBytes: $0) }
    ]
    
    private let conversationModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnConversationChanged: { try? EventOnConversationChangedData(serializedBytes: $0) },
        .eventOnNewConversation: { try? EventOnNewConversationData(serializedBytes: $0) },
        .eventOnTotalUnreadMessageCountChanged: { try? EventOnTotalUnreadMessageCountChangedData(serializedBytes: $0) },
        .eventOnSyncServerStart: { try? EventOnSyncServerStartData(serializedBytes: $0) },
        .eventOnSyncServerProgress: { try? EventOnSyncServerProgressData(serializedBytes: $0) },
        .eventOnSyncServerFinish: { try? EventOnSyncServerFinishData(serializedBytes: $0) },
        .eventOnSyncServerFailed: { try? EventOnSyncServerFailedData(serializedBytes: $0) },
        .eventOnConversationUserInputStatusChanged: { try? EventOnConversationUserInputStatusChangedData(serializedBytes: $0) }
    ]
    
    private let messageModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnMessageDeleted: { try? EventOnMessageDeletedData(serializedBytes: $0) },
        .eventOnNewRecvMessageRevoked: { try? EventOnNewRecvMessageRevokedData(serializedBytes: $0) },
        .eventOnRecvC2CreadReceipt: { try? EventOnRecvC2CReadReceiptData(serializedBytes: $0) },
        .eventOnRecvNewMessage: { try? EventOnRecvNewMessageData(serializedBytes: $0) },
        .eventOnRecvOfflineNewMessage: { try? EventOnRecvOfflineNewMessageData(serializedBytes: $0) },
        .eventOnRecvOnlineOnlyMessage: { try? EventOnRecvOnlineOnlyMessageData(serializedBytes: $0) }
    ]
    
    private let friendshipModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnFriendApplicationAdded: { try? EventOnFriendApplicationAddedData(serializedBytes: $0) },
        .eventOnFriendApplicationDeleted: { try? EventOnFriendApplicationDeletedData(serializedBytes: $0) },
        .eventOnFriendApplicationAccepted: { try? EventOnFriendApplicationAcceptedData(serializedBytes: $0) },
        .eventOnFriendApplicationRejected: { try? EventOnFriendApplicationRejectedData(serializedBytes: $0) },
        .eventOnFriendAdded: { try? EventOnFriendAddedData(serializedBytes: $0) },
        .eventOnFriendDeleted: { try? EventOnFriendDeletedData(serializedBytes: $0) },
        .eventOnFriendInfoChanged: { try? EventOnFriendInfoChangedData(serializedBytes: $0) },
        .eventOnBlackAdded: { try? EventOnBlackAddedData(serializedBytes: $0) },
        .eventOnBlackDeleted: { try? EventOnBlackDeletedData(serializedBytes: $0) }
    ]
    
    private let groupModelMapper: [FuncRequestEventName: (Data) -> Any?] = [
        .eventOnJoinedGroupAdded: { try? EventOnJoinedGroupAddedData(serializedBytes: $0) },
        .eventOnJoinedGroupDeleted: { try? EventOnJoinedGroupDeletedData(serializedBytes: $0) },
        .eventOnGroupMemberAdded: { try? EventOnGroupMemberAddedData(serializedBytes: $0) },
        .eventOnGroupMemberDeleted: { try? EventOnGroupMemberDeletedData(serializedBytes: $0) },
        .eventOnGroupApplicationAdded: { try? EventOnGroupApplicationAddedData(serializedBytes: $0) },
        .eventOnGroupApplicationDeleted: { try? EventOnGroupApplicationDeletedData(serializedBytes: $0) },
        .eventOnGroupInfoChanged: { try? EventOnGroupInfoChangedData(serializedBytes: $0) },
        .eventOnGroupDismissed: { try? EventOnGroupDismissedData(serializedBytes: $0) },
        .eventOnGroupMemberInfoChanged: { try? EventOnGroupMemberInfoChangedData(serializedBytes: $0) },
        .eventOnGroupApplicationAccepted: { try? EventOnGroupApplicationAcceptedData(serializedBytes: $0) },
        .eventOnGroupApplicationRejected: { try? EventOnGroupApplicationRejectedData(serializedBytes: $0) }
    ]
    
    private let progressModelMapper: [FuncRequestEventName: (Data) -> Int?] = [
        .eventOnUploadFileProgress: { Int(try! EventOnUploadFileProgressData(serializedBytes: $0).progress) },
        .eventOnUploadLogsProgress: { Int(try! EventOnUploadLogsProgressData(serializedBytes: $0).progress) },
        .eventOnSendMsgProgress: { Int(try! EventOnSendMsgProgressData(serializedBytes: $0).progress) }
    ]
    
    func handleEvent(result: FfiResult) {
        let handleID = result.handleID
        let funcName = result.funcName
        let data = result.data
        
        switch result.funcName {
        case .eventOnConnecting,
                .eventOnConnectFailed,
                .eventOnConnectSuccess,
                .eventOnUserTokenExpired,
                .eventOnUserTokenInvalid:
            handleOnConnectListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnSelfInfoUpdated,
                .eventOnUserStatusChanged:
            handleOnUserListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnConversationChanged,
                .eventOnNewConversation,
                .eventOnTotalUnreadMessageCountChanged,
                .eventOnSyncServerStart,
                .eventOnSyncServerProgress,
                .eventOnSyncServerFinish,
                .eventOnSyncServerFailed,
                .eventOnConversationUserInputStatusChanged:
            handleOnConversationListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnRecvNewMessage,
                .eventOnRecvC2CreadReceipt,
                .eventOnNewRecvMessageRevoked,
                .eventOnRecvOfflineNewMessage,
                .eventOnMessageDeleted,
                .eventOnRecvOnlineOnlyMessage,
                .eventOnMessageEdited:
            handleOnMessageListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnFriendApplicationAdded,
                .eventOnFriendApplicationDeleted,
                .eventOnFriendApplicationAccepted,
                .eventOnFriendApplicationRejected,
                .eventOnFriendAdded,
                .eventOnFriendDeleted,
                .eventOnFriendInfoChanged,
                .eventOnBlackAdded,
                .eventOnBlackDeleted:
            handleOnFriendshipListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnJoinedGroupAdded,
                .eventOnJoinedGroupDeleted,
                .eventOnGroupMemberAdded,
                .eventOnGroupMemberDeleted,
                .eventOnGroupApplicationAdded,
                .eventOnGroupApplicationDeleted,
                .eventOnGroupInfoChanged,
                .eventOnGroupDismissed,
                .eventOnGroupMemberInfoChanged,
                .eventOnGroupApplicationAccepted,
                .eventOnGroupApplicationRejected:
            handleOnGroupListenerEvent(eventName: funcName, data: data)
            break
        case .eventOnUploadFileProgress,
                .eventOnUploadLogsProgress,
                .eventOnSendMsgProgress:
            handleOnUploadProgressListenerEvent(eventName: funcName, handleID: handleID, data: data)
            break
        default:
            break
        }
    }
    
    private func handleListenerEvent<T: Listener>(
        eventName: FuncRequestEventName,
        data: Data,
        listener: T,
        modelMapper: [FuncRequestEventName: (Data) -> Any?]
    ) {
        if let modelBuilder = modelMapper[eventName] {
            // Serialize the data and handle the event
            let model = modelBuilder(data)
            listener.handleListenerEvent(eventName: eventName, data: model)
        }
    }
    
    private func handleOnConnectListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnConnectListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: connectModelMapper)
        }
    }
    
    private func handleOnUserListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnUserListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: userModelMapper)
        }
    }
    
    private func handleOnConversationListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnConversationListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: conversationModelMapper)
        }
    }
    
    private func handleOnMessageListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnMessageListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: messageModelMapper)
        }
    }
    
    private func handleOnFriendshipListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnFriendshipListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: friendshipModelMapper)
        }
    }
    
    private func handleOnGroupListenerEvent(eventName: FuncRequestEventName, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        emit { (listener: OnGroupListener) in
            handleListenerEvent(eventName: eventName, data: data, listener: listener, modelMapper: groupModelMapper)
        }
    }
    
    private func handleOnUploadProgressListenerEvent(eventName: FuncRequestEventName, handleID: UInt64, data: Data) {
        print("\(#function): handle event: \(eventName)")
        
        if let modelBuilder = progressModelMapper[eventName], let listener = progressListeners[handleID]?.value {
            let model = modelBuilder(data)
            listener.handleListenerEvent(eventName: eventName, data: model)
        }
    }
    
    private func emit<T: Listener>(_ execute: ((_ listener: T) -> Void)) {
        switch T.self {
        case is OnConnectListener.Type:
            for weakListener in connectListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        case is OnUserListener.Type:
            for weakListener in userListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        case is OnConversationListener.Type:
            for weakListener in conversationListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        case is OnMessageListener.Type:
            for weakListener in messageListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        case is OnFriendshipListener.Type:
            for weakListener in friendshipListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        case is OnGroupListener.Type:
            for weakListener in groupListeners {
                if let listener = weakListener.value as? T {
                    execute(listener)
                }
            }
        default:
            break
        }
    }
}

private struct Weak<T: AnyObject> {
    var value: T?
    
    init(_ value: T) {
        self.value = value
    }
}
