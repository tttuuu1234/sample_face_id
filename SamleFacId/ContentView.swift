//
//  ContentView.swift
//  SamleFacId
//
//  Created by Tsubasa on 2024/10/06.
//

import SwiftUI
import SwiftData
import LocalAuthentication

struct ContentView: View {
    @State var isUnlocked: Bool = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("生体認証成功")
            }
            Button(action: {
                auth()
            }, label: {
                Text("生体認証")
            })
        }
    }
    
    func auth() -> Void {
        let context = LAContext()
        var error: NSError?
        
        // 生体認証（Face IDやTouch ID）が利用可能であるかどうかを確認
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let description = "認証が必要です。"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
