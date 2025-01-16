import Foundation
import SwiftProtobuf
import OpenIMSDKCore

typealias CallBack = @convention(c) (UnsafeMutableRawPointer?, Int32) -> Void

class ResponseManager {
    static var shared = ResponseManager()
    
    private init() {}
    
    func setCoreResponse() {
        let onResponse: CallBack = { ptr, len in
            ResponseManager.shared.onResponse(dataPtr: ptr, len: len)
        }
        
        OpenIMSDKCore.ffi_init(onResponse, 2)
    }
    
    private let connectionTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .initSdk: InitSDKResp.self,
        .login: LoginResp.self,
        .logout: LogoutResp.self,
        .getLoginStatus: GetLoginStatusResp.self,
        .uploadFile: UploadFileResp.self,
        .updateFcmToken: UpdateFcmTokenResp.self,
        .log: LogResp.self,
        .version: VersionResp.self
    ]
    
    private let userTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getUsersInfo: GetUsersInfoResp.self,
        .getSelfUserInfo: GetSelfUserInfoResp.self,
        .setSelfInfo: SetSelfInfoResp.self,
        .subscribeUsersOnlineStatus: SubscribeUsersOnlineStatusResp.self,
        .unsubscribeUsersOnlineStatus: UnsubscribeUsersOnlineStatusResp.self
    ]
    
    private let conversationTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getAllConversationList: GetAllConversationListResp.self,
        .getConversationListSplit: GetConversationListSplitResp.self,
        .hideConversation: HideConversationResp.self,
        .getAtAllTag: GetAtAllTagResp.self,
        .getOneConversation: GetOneConversationResp.self,
        .getMultipleConversation: GetMultipleConversationResp.self,
        .hideAllConversations: HideAllConversationsResp.self,
        .setConversationDraft: SetConversationDraftResp.self,
        .setConversation: SetConversationResp.self,
        .getTotalUnreadMsgCount: GetTotalUnreadMsgCountResp.self,
        .getConversationIdbySessionType: GetConversationIDBySessionTypeResp.self
    ]
    
    private let messageTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .sendMessage: SendMessageResp.self,
        .findMessageList: FindMessageListResp.self,
        .getHistoryMessageList: GetHistoryMessageListResp.self,
        .revokeMessage: RevokeMessageResp.self,
        .typingStatusUpdate: TypingStatusUpdateResp.self,
        .markConversationMessageAsRead: MarkConversationMessageAsReadResp.self,
        .markAllConversationMessageAsRead: MarkAllConversationMessageAsReadResp.self,
        .deleteMessageFromLocal: DeleteMessageFromLocalResp.self,
        .deleteMessage: DeleteMessageResp.self,
        .deleteAllMsgFromLocalAndServer: DeleteAllMsgFromLocalAndServerResp.self,
        .deleteAllMessageFromLocal: DeleteAllMessageFromLocalResp.self,
        .clearConversationAndDeleteAllMsg: ClearConversationAndDeleteAllMsgResp.self,
        .deleteConversationAndDeleteAllMsg: DeleteConversationAndDeleteAllMsgResp.self,
        .insertSingleMessageToLocal: InsertSingleMessageToLocalResp.self,
        .insertGroupMessageToLocal: InsertGroupMessageToLocalResp.self,
        .searchLocalMessages: SearchLocalMessagesResp.self,
        .setMessageLocalEx: SetMessageLocalExResp.self,
        .searchConversation: SearchConversationResp.self,
        .createTextMessage: CreateTextMessageResp.self,
        .createAdvancedTextMessage: CreateAdvancedTextMessageResp.self,
        .createTextAtMessage: CreateTextAtMessageResp.self,
        .createLocationMessage: CreateLocationMessageResp.self,
        .createCustomMessage: CreateCustomMessageResp.self,
        .createQuoteMessage: CreateQuoteMessageResp.self,
        .createAdvancedQuoteMessage: CreateAdvancedQuoteMessageResp.self,
        .createCardMessage: CreateCardMessageResp.self,
        .createImageMessage: CreateImageMessageResp.self,
        .createSoundMessage: CreateSoundMessageResp.self,
        .createVideoMessage: CreateVideoMessageResp.self,
        .createFileMessage: CreateFileMessageResp.self,
        .createMergerMessage: CreateMergerMessageResp.self,
        .createFaceMessage: CreateFaceMessageResp.self,
        .createForwardMessage: CreateForwardMessageResp.self
    ]
    
    private let friendshipTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getSpecifiedFriends: GetSpecifiedFriendsResp.self,
        .addFriend: AddFriendResp.self,
        .getFriendApplication: GetFriendApplicationResp.self,
        .handleFriendApplication: HandleFriendApplicationResp.self,
        .checkFriend: CheckFriendResp.self,
        .deleteFriend: DeleteFriendResp.self,
        .getFriends: GetFriendsResp.self,
        .getFriendsPage: GetFriendsPageResp.self,
        .searchFriends: SearchFriendsResp.self,
        .addBlack: AddBlackResp.self,
        .deleteBlack: DeleteBlackResp.self,
        .getBlacks: GetBlacksResp.self,
        .updateFriend: UpdateFriendResp.self
    ]
    
    private let groupTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .createGroup: CreateGroupResp.self,
        .joinGroup: JoinGroupResp.self,
        .quitGroup: QuitGroupResp.self,
        .dismissGroup: DismissGroupResp.self,
        .changeGroupMute: ChangeGroupMuteResp.self,
        .changeGroupMemberMute: ChangeGroupMemberMuteResp.self,
        .transferGroupOwner: TransferGroupOwnerResp.self,
        .kickGroupMember: KickGroupMemberResp.self,
        .setGroupInfo: SetGroupInfoResp.self,
        .setGroupMemberInfo: SetGroupMemberInfoResp.self,
        .getJoinedGroups: GetJoinedGroupsResp.self,
        .getJoinedGroupsPage: GetJoinedGroupsPageResp.self,
        .getSpecifiedGroupsInfo: GetSpecifiedGroupsInfoResp.self,
        .searchGroups: SearchGroupsResp.self,
        .getGroupMemberOwnerAndAdmin: GetGroupMemberOwnerAndAdminResp.self,
        .getGroupMembersByJoinTimeFilter: GetGroupMembersByJoinTimeFilterResp.self,
        .getSpecifiedGroupMembersInfo: GetSpecifiedGroupMembersInfoResp.self,
        .getGroupMembers: GetGroupMembersResp.self,
        .getGroupApplication: GetGroupApplicationResp.self,
        .searchGroupMembers: SearchGroupMembersResp.self,
        .isJoinGroup: IsJoinGroupResp.self,
        .getUsersInGroup: GetUsersInGroupResp.self,
        .inviteUserToGroup: InviteUserToGroupResp.self,
        .handleGroupApplication: HandleGroupApplicationResp.self
    ]
    
    private func onResponse(dataPtr: UnsafeMutableRawPointer?, len: Int32) {
        guard let dataPtr else { return }
        
        let byteBuffer = [UInt8](UnsafeBufferPointer(start: dataPtr.assumingMemoryBound(to: UInt8.self), count: Int(len)))
        let result = try! FfiResult(serializedBytes: byteBuffer)
        
        handleFunctionResponse(result: result)
        
        OpenIMSDKCore.ffi_drop_handle(GoInt64(result.handleID))
    }
    
    private func handleFunctionResponse(result: FfiResult) {
        let funcName = result.funcName
        
        if connectionTypeMap[funcName] != nil {
            handleFunc(ffiResult: result, typeMap: connectionTypeMap)
        } else if userTypeMap[funcName] != nil {
            handleFunc(ffiResult: result, typeMap: userTypeMap)
        } else if conversationTypeMap[funcName] != nil {
            handleFunc(ffiResult: result, typeMap: conversationTypeMap)
        } else if groupTypeMap[funcName] != nil {
            handleFunc(ffiResult: result, typeMap: groupTypeMap)
        } else if friendshipTypeMap[funcName] != nil {
            handleFunc(ffiResult: result, typeMap: friendshipTypeMap)
        } else {
            ListenerManager.shared.handleEvent(result: result)
        }
    }
    
    // A generic handler function for handling both connection and user events
    private func handleFunc(ffiResult: FfiResult, typeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type]) {
        let funcName = ffiResult.funcName

        guard let type = typeMap[funcName] else {
            print("Unhandled funcName: \(funcName)")
            
            return
        }
        
        let handleID = ffiResult.handleID
        let errCode = ffiResult.errCode
        print("\(#function) handle event: \(funcName)[\(handleID)]")

        if errCode > 0 {
            let errMsg = ffiResult.errMsg
            
            handleFailure(type, handleID: handleID, code: errCode, errMsg: errMsg)
        } else {
            let data = ffiResult.data
                    
            handleSuccess(type, handleID: handleID, data: data)
        }
    }
    
    private func handleSuccess<T: SwiftProtobuf.Message>(_ type: T.Type, handleID: UInt64, data: Data) {
        do {
            let result = try T(serializedBytes: data)
            let success: Result<T, Error> = .success(result)
            
            resume(handleID: handleID, result: success)
        } catch {
            print("\(#function) throw an error: \(error)")
        }
    }
    
    private func handleFailure<T: SwiftProtobuf.Message>(_ type: T.Type, handleID: UInt64, code: Int32, errMsg: String) {
        let error = IMSDKError(code: ErrorCode(rawValue: Int(code)) ?? .noError, message: errMsg)
        let failure: Result<T, Error> = .failure(error)
        
        resume(handleID: handleID, result: failure)
    }
    
    private func resume<T>(handleID: UInt64, result: Result<T, Error>) {
        AsyncTaskManager.shared.resume(handleID: handleID, with: result)
    }
}
