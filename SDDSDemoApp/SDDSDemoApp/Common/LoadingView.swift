import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Инициализация тем...")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
}
