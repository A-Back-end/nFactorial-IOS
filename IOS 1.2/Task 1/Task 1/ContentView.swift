import SwiftUI

class CounterText: ObservableObject {
    @Published var texts: [String] = []
}

struct ContentView: View {
    @ObservedObject var getText = CounterText()
    @State private var isOn = false

    var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text("Toggle me")
            }
            .padding(30)
            .padding(.vertical, 20)

            Spacer()

            if isOn {
                ForEach(Array(getText.texts.enumerated()), id: \.offset) { index, text in
                    Text(text)
                        .padding(5)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            
                HStack {
                    Button {
                        if !getText.texts.isEmpty {
                            getText.texts.removeLast()
                        }
                    } label: {
                        Image(systemName: "minus")
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    .padding(.trailing, 50)

                    Button {
                        getText.texts.append("List \(getText.texts.count + 1)")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
