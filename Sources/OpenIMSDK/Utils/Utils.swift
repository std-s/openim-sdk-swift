
import Foundation
import SwiftProtobuf
import OpenIMSDKCore

class Utils {
    static func callCoreAPI<T: SwiftProtobuf.Message, R>(funcName: FuncRequestEventName, req: T) async throws -> R {
        try await AsyncTaskManager.shared.add {
            try Utils.callFunc(
                funcName: funcName,
                dataBuffer: try req.serializedData()
            )
        }
    }
    
    static func callFunc(funcName: FuncRequestEventName, dataBuffer: Data) -> UInt64 {
        var funcBuffer = FfiRequest()
        funcBuffer.funcName = funcName
        funcBuffer.data = dataBuffer
        funcBuffer.handleID = UInt64.random(in: 0..<100000)
        
        let data = try! funcBuffer.serializedData()
        let count = data.count
            
        let pointer = UnsafeMutableRawPointer.allocate(byteCount: count, alignment: MemoryLayout<UInt8>.alignment)
        data.copyBytes(to: pointer.assumingMemoryBound(to: UInt8.self), count: count)

        OpenIMSDKCore.ffi_request(pointer, Int32(count))
        
        return funcBuffer.handleID
    }
}


