//
//  ContentView.swift
//  OpenIMSDKExample
//
//  Created by x on 11/25/24.
//

import SwiftUI
import OpenIMSDK

struct ContentView: View {
    init() {
        addObserves()
    }
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8, content: {
                ActionButton(action: {
                    var req = LoginReq()
                    req.userID = "4703677104"
                    req.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiI0NzAzNjc3MTA0IiwiUGxhdGZvcm1JRCI6MSwiZXhwIjoxNzQxMTY3MTY2LCJuYmYiOjE3MzMzOTA4NjYsImlhdCI6MTczMzM5MTE2Nn0.kOC0PHA9IcB6tjzdudbuuNOhjlqQdEUy9FeNwt8ckMU"
                    try await IMManager.shared.connection.login(req)
                }, label: "Login")
                
                ActionButton(action: {
                    let info = try await IMManager.user.getSelfUserInfo()
                    print(try info.jsonString())
                }, label: "GetSelfUserInfo")
                
                ActionButton(action: {
                    let info = try await IMManager.connection.getLoginStatus()
                    print(info)
                }, label: "LoginStatus")
                
                ActionButton(action: {
                    try await IMManager.connection.logout()
                }, label: "Logout")
                
                ActionButton(action: {
                    let version = try await IMManager.connection.version()
                    print("sdk versiIon: \(version).")
                }, label: "Version")
            })
        }.padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
    }
    
    private func addObserves() {
        IMManager.connection.addListener(listener: OnConnectListener(onConnectFailed: { errCode, errMsg in
            print("onConnectFailed: \(errCode), \(errMsg)")
        }, onConnectSuccess: {
            print("onConnectSuccess")
        }, onConnecting: {
            print("onConnecting")
        }, onKickedOffline: {
            print("onKickedOffline")
        }, onUserTokenExpired: {
            print("onUserTokenExpired")
        }, onUserTokenInvalid: { data in
            print("onUserTokenInvalid: \(data)")
        }))
    }
}

struct ActionButton: View {
    let action: () async throws -> Void
    let label: String
    
    var body: some View {
        Button(action: {
            Task {
                do {
                    try await action()
                    print("\(label) excute success.")
                } catch {
                    print("\(label) throw an error: \(error)")
                }
            }
        }, label: {
            Text(label)
        })
    }
}

#Preview {
    ContentView()
}
