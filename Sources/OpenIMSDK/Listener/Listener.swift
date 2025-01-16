import Foundation

public typealias VoidCallback = (() -> Void)
public typealias DataCallBack<T> = ((_ data: T) -> Void)

protocol Listener: AnyObject {
    func handleListenerEvent(eventName: FuncRequestEventName, data: Any?)
}

public class OnConnectListener: Listener {
    let onConnectFailed: ((_ errCode: Int32, _ errMsg: String) -> Void)
    let onConnectSuccess: (VoidCallback)?
    let onConnecting: (VoidCallback)?
    let onKickedOffline: (VoidCallback)
    let onUserTokenExpired: (VoidCallback)
    let onUserTokenInvalid: (DataCallBack<String>)
    
    public init(
        onConnectFailed: @escaping ((_ errCode: Int32, _ errMsg: String) -> Void),
        onConnectSuccess: (VoidCallback)? = nil,
        onConnecting: (VoidCallback)? = nil,
        onKickedOffline: @escaping VoidCallback,
        onUserTokenExpired: @escaping VoidCallback,
        onUserTokenInvalid: @escaping DataCallBack<String>
    ) {
        self.onConnectFailed = onConnectFailed
        self.onConnectSuccess = onConnectSuccess
        self.onConnecting = onConnecting
        self.onKickedOffline = onKickedOffline
        self.onUserTokenExpired = onUserTokenExpired
        self.onUserTokenInvalid = onUserTokenInvalid
    }
    
    func handleListenerEvent(eventName: FuncRequestEventName, data: Any? = nil) {
        switch eventName {
        case .eventOnConnectSuccess:
            guard data is EventOnConnectSuccessData else { return }
            
            onConnectSuccess?()
        case .eventOnConnectFailed:
            guard let data = data as? EventOnConnectFailedData else { return }
            
            onConnectFailed(data.errCode, data.errMsg)
        case .eventOnConnecting:
            guard data is EventOnConnectingData else { return }
            
            onConnecting?()
        case .eventOnKickedOffline:
            guard data is EventOnKickedOfflineData else { return }
            
            onKickedOffline()
        case .eventOnUserTokenExpired:
            guard data is EventOnUserTokenExpiredData else { return }
            
            onUserTokenExpired()
        case .eventOnUserTokenInvalid:
            guard let data = data as? EventOnUserTokenInvalidData else { return }
            
            onUserTokenInvalid(data.errMsg)
        default:
            break
        }
    }
}

public class OnUserListener: Listener {
    let onSelfInfoUpdated: (DataCallBack<IMUser>)?
    let onUserStatusChanged: (DataCallBack<EventOnUserOnlineStatusChangedData>)?

    public init(
        onSelfInfoUpdated: (DataCallBack<IMUser>)? = nil,
        onUserStatusChanged: (DataCallBack<EventOnUserOnlineStatusChangedData>)? = nil
    ) {
        self.onSelfInfoUpdated = onSelfInfoUpdated
        self.onUserStatusChanged = onUserStatusChanged
    }

    func handleListenerEvent(eventName: FuncRequestEventName, data: Any?) {
        switch eventName {
        case .eventOnSelfInfoUpdated:
            guard let data = data as? EventOnSelfInfoUpdatedData else { return }
            
            onSelfInfoUpdated?(data.user)
        case .eventOnUserOnlineStatusChanged:
            guard let data = data as? EventOnUserOnlineStatusChangedData else { return }
            
            onUserStatusChanged?(data)
        default:
            break
        }
    }
}

public class OnConversationListener: Listener {
    let onConversationChanged: (DataCallBack<[IMConversation]>)
    let onNewConversation: (DataCallBack<[IMConversation]>)
    let onTotalUnreadMessageCountChanged: (DataCallBack<Int>)
    let onSyncServerStart: (DataCallBack<Bool>)?
    let onSyncServerProgress: (DataCallBack<Int>)?
    let onSyncServerFinish: (DataCallBack<Bool>)?
    let onSyncServerFailed: (DataCallBack<Bool>)?
    let onInputStatusChanged: (DataCallBack<EventOnConversationUserInputStatusChangedData>)?

    public init(
        onConversationChanged: @escaping (DataCallBack<[IMConversation]>),
        onNewConversation: @escaping (DataCallBack<[IMConversation]>),
        onTotalUnreadMessageCountChanged: @escaping (DataCallBack<Int>),
        onSyncServerStart: (DataCallBack<Bool>)? = nil,
        onSyncServerProgress: (DataCallBack<Int>)? = nil,
        onSyncServerFinish: (DataCallBack<Bool>)? = nil,
        onSyncServerFailed: (DataCallBack<Bool>)? = nil,
        onInputStatusChanged: (DataCallBack<EventOnConversationUserInputStatusChangedData>)? = nil
    ) {
        self.onConversationChanged = onConversationChanged
        self.onNewConversation = onNewConversation
        self.onTotalUnreadMessageCountChanged = onTotalUnreadMessageCountChanged
        self.onSyncServerStart = onSyncServerStart
        self.onSyncServerProgress = onSyncServerProgress
        self.onSyncServerFinish = onSyncServerFinish
        self.onSyncServerFailed = onSyncServerFailed
        self.onInputStatusChanged = onInputStatusChanged
    }

    func handleListenerEvent(eventName: FuncRequestEventName, data: Any?) {
        switch eventName {
        case .eventOnConversationChanged:
            guard let data = data as? EventOnConversationChangedData else { return }
            
            onConversationChanged(data.conversationList)
        case .eventOnNewConversation:
            guard let data = data as? EventOnNewConversationData else { return }
            
            onNewConversation(data.conversationList)
        case .eventOnTotalUnreadMessageCountChanged:
            guard let data = data as? EventOnTotalUnreadMessageCountChangedData else { return }
            
            onTotalUnreadMessageCountChanged(Int(data.totalUnreadCount))
        case .eventOnSyncServerStart:
            guard let data = data as? EventOnSyncServerStartData else { return }
            
            onSyncServerStart?(data.reinstalled)
        case .eventOnSyncServerProgress:
            guard let data = data as? EventOnSyncServerProgressData else { return }
            
            onSyncServerProgress?(Int(data.progress))
        case .eventOnSyncServerFinish:
            guard let data = data as? EventOnSyncServerFinishData else { return }
            
            onSyncServerFinish?(data.reinstalled)
        case .eventOnSyncServerFailed:
            guard let data = data as? EventOnSyncServerFailedData else { return }
            
            onSyncServerFailed?(data.reinstalled)
        case .eventOnConversationUserInputStatusChanged:
            guard let data = data as? EventOnConversationUserInputStatusChangedData else { return }
            
            onInputStatusChanged?(data)
        default:
            break
        }
    }
}

public class OnMessageListener: Listener {
    let onMessageDeleted: (DataCallBack<IMMessage>)?
    let onNewRecvMessageRevoked: (DataCallBack<RevokedTips>)?
    let onRecvC2CReadReceipt: (DataCallBack<[MessageReceipt]>)?
    let onRecvNewMessage: DataCallBack<IMMessage>
    let onRecvOfflineNewMessage: (DataCallBack<IMMessage>)?
    let onRecvOnlineOnlyMessage: (DataCallBack<IMMessage>)?
        
    public init(
        onRecvNewMessage: @escaping DataCallBack<IMMessage>,
        onMessageDeleted: (DataCallBack<IMMessage>)? = nil,
        onNewRecvMessageRevoked: (DataCallBack<RevokedTips>)? = nil,
        onRecvC2CReadReceipt: (DataCallBack<[MessageReceipt]>)? = nil,
        onRecvOfflineNewMessage: (DataCallBack<IMMessage>)? = nil,
        onRecvOnlineOnlyMessage: (DataCallBack<IMMessage>)? = nil
    ) {
        self.onRecvNewMessage = onRecvNewMessage
        self.onMessageDeleted = onMessageDeleted
        self.onNewRecvMessageRevoked = onNewRecvMessageRevoked
        self.onRecvC2CReadReceipt = onRecvC2CReadReceipt
        self.onRecvOfflineNewMessage = onRecvOfflineNewMessage
        self.onRecvOnlineOnlyMessage = onRecvOnlineOnlyMessage
    }
    
    func handleListenerEvent(eventName: FuncRequestEventName, data: Any? = nil) {
        switch eventName {
        case .eventOnMessageDeleted:
            guard let data = data as? EventOnMessageDeletedData else { return }
            
            onMessageDeleted?(data.message)
        case .eventOnNewRecvMessageRevoked:
            guard let data = data as? EventOnNewRecvMessageRevokedData else { return }
            
            onNewRecvMessageRevoked?(data.revoked)
        case .eventOnRecvC2CreadReceipt:
            guard let data = data as? EventOnRecvC2CReadReceiptData else { return }
            
            onRecvC2CReadReceipt?(data.msgReceiptList)
        case .eventOnRecvNewMessage:
            guard let data = data as? EventOnRecvNewMessageData else { return }
            
            onRecvNewMessage(data.message)
        case .eventOnRecvOfflineNewMessage:
            guard let data = data as? EventOnRecvOfflineNewMessageData else { return }
            
            onRecvOfflineNewMessage?(data.message)
        case .eventOnRecvOnlineOnlyMessage:
            guard let data = data as? EventOnRecvOnlineOnlyMessageData else { return }
            
            onRecvOnlineOnlyMessage?(data.message)
        default:
            break
        }
    }
}

public class OnFriendshipListener: Listener {
    let onBlackAdded: (DataCallBack<IMBlack>)?
    let onBlackDeleted: (DataCallBack<IMBlack>)?
    let onFriendAdded: (DataCallBack<IMFriend>)?
    let onFriendApplicationAccepted: (DataCallBack<IMFriendApplication>)?
    let onFriendApplicationAdded: (DataCallBack<IMFriendApplication>)?
    let onFriendApplicationDeleted: (DataCallBack<IMFriendApplication>)?
    let onFriendApplicationRejected: (DataCallBack<IMFriendApplication>)?
    let onFriendDeleted: (DataCallBack<IMFriend>)?
    let onFriendInfoChanged: (DataCallBack<IMFriend>)?

    public init(
        onBlackAdded: (DataCallBack<IMBlack>)? = nil,
        onBlackDeleted: (DataCallBack<IMBlack>)? = nil,
        onFriendAdded: (DataCallBack<IMFriend>)? = nil,
        onFriendApplicationAccepted: (DataCallBack<IMFriendApplication>)? = nil,
        onFriendApplicationAdded: (DataCallBack<IMFriendApplication>)? = nil,
        onFriendApplicationDeleted: (DataCallBack<IMFriendApplication>)? = nil,
        onFriendApplicationRejected: (DataCallBack<IMFriendApplication>)? = nil,
        onFriendDeleted: (DataCallBack<IMFriend>)? = nil,
        onFriendInfoChanged: (DataCallBack<IMFriend>)? = nil
    ) {
        self.onBlackAdded = onBlackAdded
        self.onBlackDeleted = onBlackDeleted
        self.onFriendAdded = onFriendAdded
        self.onFriendApplicationAccepted = onFriendApplicationAccepted
        self.onFriendApplicationAdded = onFriendApplicationAdded
        self.onFriendApplicationDeleted = onFriendApplicationDeleted
        self.onFriendApplicationRejected = onFriendApplicationRejected
        self.onFriendDeleted = onFriendDeleted
        self.onFriendInfoChanged = onFriendInfoChanged
    }

    func handleListenerEvent(eventName: FuncRequestEventName, data: Any? = nil) {
        switch eventName {
        case .eventOnBlackAdded:
            guard let data = data as? EventOnBlackAddedData else { return }
            onBlackAdded?(data.black)

        case .eventOnBlackDeleted:
            guard let data = data as? EventOnBlackDeletedData else { return }
            onBlackDeleted?(data.black)

        case .eventOnFriendAdded:
            guard let data = data as? EventOnFriendAddedData else { return }
            onFriendAdded?(data.friend)

        case .eventOnFriendApplicationAccepted:
            guard let data = data as? EventOnFriendApplicationAcceptedData else { return }
            onFriendApplicationAccepted?(data.application)

        case .eventOnFriendApplicationAdded:
            guard let data = data as? EventOnFriendApplicationAddedData else { return }
            onFriendApplicationAdded?(data.application)

        case .eventOnFriendApplicationDeleted:
            guard let data = data as? EventOnFriendApplicationDeletedData else { return }
            onFriendApplicationDeleted?(data.application)

        case .eventOnFriendApplicationRejected:
            guard let data = data as? EventOnFriendApplicationRejectedData else { return }
            onFriendApplicationRejected?(data.application)

        case .eventOnFriendDeleted:
            guard let data = data as? EventOnFriendDeletedData else { return }
            onFriendDeleted?(data.friend)

        case .eventOnFriendInfoChanged:
            guard let data = data as? EventOnFriendInfoChangedData else { return }
            onFriendInfoChanged?(data.friend)

        default:
            break
        }
    }
}

public class OnGroupListener: Listener {
    let onJoinedGroupAdded: (DataCallBack<IMGroup>)?
    let onJoinedGroupDeleted: (DataCallBack<IMGroup>)?
    let onGroupMemberAdded: (DataCallBack<IMGroupMember>)?
    let onGroupMemberDeleted: (DataCallBack<IMGroupMember>)?
    let onGroupApplicationAdded: (DataCallBack<IMGroupApplication>)?
    let onGroupApplicationDeleted: (DataCallBack<IMGroupApplication>)?
    let onGroupInfoChanged: (DataCallBack<IMGroup>)?
    let onGroupDismissed: (DataCallBack<IMGroup>)?
    let onGroupMemberInfoChanged: (DataCallBack<IMGroupMember>)?
    let onGroupApplicationAccepted: (DataCallBack<IMGroupApplication>)?
    let onGroupApplicationRejected: (DataCallBack<IMGroupApplication>)?

    public init(
        onJoinedGroupAdded: (DataCallBack<IMGroup>)? = nil,
        onJoinedGroupDeleted: (DataCallBack<IMGroup>)? = nil,
        onGroupMemberAdded: (DataCallBack<IMGroupMember>)? = nil,
        onGroupMemberDeleted: (DataCallBack<IMGroupMember>)? = nil,
        onGroupApplicationAdded: (DataCallBack<IMGroupApplication>)? = nil,
        onGroupApplicationDeleted: (DataCallBack<IMGroupApplication>)? = nil,
        onGroupInfoChanged: (DataCallBack<IMGroup>)? = nil,
        onGroupDismissed: (DataCallBack<IMGroup>)? = nil,
        onGroupMemberInfoChanged: (DataCallBack<IMGroupMember>)? = nil,
        onGroupApplicationAccepted: (DataCallBack<IMGroupApplication>)? = nil,
        onGroupApplicationRejected: (DataCallBack<IMGroupApplication>)? = nil
    ) {
        self.onJoinedGroupAdded = onJoinedGroupAdded
        self.onJoinedGroupDeleted = onJoinedGroupDeleted
        self.onGroupMemberAdded = onGroupMemberAdded
        self.onGroupMemberDeleted = onGroupMemberDeleted
        self.onGroupApplicationAdded = onGroupApplicationAdded
        self.onGroupApplicationDeleted = onGroupApplicationDeleted
        self.onGroupInfoChanged = onGroupInfoChanged
        self.onGroupDismissed = onGroupDismissed
        self.onGroupMemberInfoChanged = onGroupMemberInfoChanged
        self.onGroupApplicationAccepted = onGroupApplicationAccepted
        self.onGroupApplicationRejected = onGroupApplicationRejected
    }

    func handleListenerEvent(eventName: FuncRequestEventName, data: Any? = nil) {
        switch eventName {
        case .eventOnJoinedGroupAdded:
            guard let data = data as? EventOnJoinedGroupAddedData else { return }
            onJoinedGroupAdded?(data.group)

        case .eventOnJoinedGroupDeleted:
            guard let data = data as? EventOnJoinedGroupDeletedData else { return }
            onJoinedGroupDeleted?(data.group)

        case .eventOnGroupMemberAdded:
            guard let data = data as? EventOnGroupMemberAddedData else { return }
            onGroupMemberAdded?(data.member)

        case .eventOnGroupMemberDeleted:
            guard let data = data as? EventOnGroupMemberDeletedData else { return }
            onGroupMemberDeleted?(data.member)

        case .eventOnGroupApplicationAdded:
            guard let data = data as? EventOnGroupApplicationAddedData else { return }
            onGroupApplicationAdded?(data.application)

        case .eventOnGroupApplicationDeleted:
            guard let data = data as? EventOnGroupApplicationDeletedData else { return }
            onGroupApplicationDeleted?(data.application)

        case .eventOnGroupInfoChanged:
            guard let data = data as? EventOnGroupInfoChangedData else { return }
            onGroupInfoChanged?(data.group)

        case .eventOnGroupDismissed:
            guard let data = data as? EventOnGroupDismissedData else { return }
            onGroupDismissed?(data.group)

        case .eventOnGroupMemberInfoChanged:
            guard let data = data as? EventOnGroupMemberInfoChangedData else { return }
            onGroupMemberInfoChanged?(data.member)

        case .eventOnGroupApplicationAccepted:
            guard let data = data as? EventOnGroupApplicationAcceptedData else { return }
            onGroupApplicationAccepted?(data.application)

        case .eventOnGroupApplicationRejected:
            guard let data = data as? EventOnGroupApplicationRejectedData else { return }
            onGroupApplicationRejected?(data.application)

        default:
            break
        }
    }
}

public class OnProgressListener: Listener {
    let onProgress: (DataCallBack<Int>)

    public init(onProgress: @escaping (DataCallBack<Int>)) {
        self.onProgress = onProgress
    }

    func handleListenerEvent(eventName: FuncRequestEventName, data: Any? = nil) {
        switch eventName {
        case .eventOnUploadFileProgress:
            guard let data = data as? EventOnUploadFileProgressData else { return }
            
            onProgress(Int(data.progress))
        case .eventOnSendMsgProgress:
            guard let data = data as? EventOnSendMsgProgressData else { return }
            
            onProgress(Int(data.progress))
        case .eventOnUploadLogsProgress:
            guard let data = data as? EventOnUploadLogsProgressData else { return }
            
            onProgress(Int(data.progress))
        default:
            break
        }
    }
}
