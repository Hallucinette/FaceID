import SwiftUI
import LocalAuthentication

struct ContentView: View {

    @ObservedObject var viewModel = FaceIDAuthentication()

    var body: some View {
        VStack(spacing: 80) {
            Text(viewModel.customEnum.title)
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.orange)
            
            Image(viewModel.customEnum.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding(.all, 20)
                .background {
                    Circle()
                        .stroke(viewModel.customEnum.colorCircle, lineWidth: 5)
                        .frame(width: 110, height: 110)
                }
            
            Button {
                viewModel.lockOrUnlock()
            } label: {
                Text(viewModel.customEnum.titleButton)
                    .foregroundColor(Color.white)
                    .padding(.all, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(viewModel.customEnum.colorButton)
                    }
            }
        }
        .padding(.all, 20)
    }
}
