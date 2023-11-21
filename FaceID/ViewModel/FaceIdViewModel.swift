import Foundation
import LocalAuthentication

class FaceIDAuthentication: ObservableObject {
    
    @Published var isUnlocked = false
    
    var customEnum: CustomEnum {
        return isUnlocked ? .unlocked : .locked
    }
    
    func lockOrUnlock() {
        if isUnlocked {
            isUnlocked = false
        } else {
            authenticate()
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    self.isUnlocked = true
                    print("Sucess")
                } else {
                    print("Fail")
                }
            }
        } else {
            print("no biometrics")
        }
    }
}
