//
//  AuthenticationController.swift
//  Notepad
//
//  Created by Iago Ramos on 02/01/24.
//

import Foundation
import LocalAuthentication

final class AuthenticationController {
    static let shared = AuthenticationController()
    
    private init() {}
    
    private func askBiometricAvailability(with context: LAContext) {
        var error: NSError?
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        
        if let error = error {
            print(error.localizedDescription)
        }
    }
    
    func authenticate(completion: @escaping (Bool) -> Void) {
        let reason = "We need this to allow you to lock/unlock notes."
        
        let context = LAContext()
        askBiometricAvailability(with: context)
        
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
            if success {
                DispatchQueue.main.async {
                    completion(true)
                }
                
                return
            }
            
            if let error = error as? LAError {
                print("Error while authenticating: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                completion(false)
            }
        }
    }
}
