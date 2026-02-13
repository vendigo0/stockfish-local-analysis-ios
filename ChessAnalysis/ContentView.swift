import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(resource: "index", subdirectory: "Web")
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
