//
//  ContentView.swift
//  UsingTouchIDAuthentication
//
//  Created by Ramill Ibragimov on 14.04.2021.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    var body: some View {
        Button(action: {
            authenticate()
        }, label: {
            Text("Login")
        })
    }
    
    func authenticate() {
        let context = LAContext()
        let message = "Authenticate"
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: message) { (success, error) in
                if success {
                    print("Authentication succeded")
                } else {
                    print("FAILED!")
                }
            }
        } else {
            print("Device has no Touch ID sensor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
