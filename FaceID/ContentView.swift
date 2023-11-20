import SwiftUI
import LocalAuthentication

struct ContentView: View {

    enum CustomEnum {
        case locked
        case unlocked
    
        var title: String {
            switch self {
            case .locked:
                return "Application locked"
            case .unlocked:
                return "Application unlocked"
            }
        }

        var colorCircle: Color {
            switch self {
            case .locked:
                return Color.red
            case .unlocked:
                return Color.green
            }
        }
        
        var colorButton: Color {
            switch self {
            case .locked:
                return Color.green
            case .unlocked:
                return Color.red
            }
        }
        
        var titleButton: String {
            switch self {
            case .locked:
                return "Open"
            case .unlocked:
                return "Lock"
            }
        }
        
        var image: String {
            switch self {
            case .locked:
                return "Locked"
            case .unlocked:
                return "Unlocked"
            }
        }
    }

    @State var isUnlocked: Bool = false

    var body: some View {
        VStack(spacing: 80) {
            let customEnum: CustomEnum = isUnlocked ? .unlocked : .locked
            Text(customEnum.title)
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.orange)
            
            Image(customEnum.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding(.all, 10)
                .background {
                    Circle()
                        .stroke(customEnum.colorCircle, lineWidth: 5)
                        .frame(width: 100, height: 100)
                }

            Button {
                if isUnlocked {
                    isUnlocked = false
                } else {
                    authenticate()
                }
            } label: {
                Text(customEnum.titleButton)
                    .foregroundColor(Color.white)
                    .padding(.all, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(customEnum.colorButton)
                    }
            }
        }
        .padding(.all, 20)
        .onAppear(perform: authenticate)
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
                    isUnlocked = true
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
