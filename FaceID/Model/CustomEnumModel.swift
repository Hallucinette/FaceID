import Foundation
import SwiftUI

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
