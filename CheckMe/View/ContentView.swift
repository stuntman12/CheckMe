
import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var value: Float = Float(Int.random(in: 0...100))
    @State private var number = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 25) {
        
            ProgressX(opacity: opacity())
            
            Text("Подвинь слайдер, как можно ближе к \(number)")
                .lineLimit(0)
            
            HStack{
                Text("0")
                UISliderRepresent(value: $value, opacity: opacity())
                    .frame(width: 230)
                    .onChange(of: value) { _, newValue in
                        value = newValue
                    }
                Text("100")
            }            
            Button("Проверь меня") {
                self.showAlert.toggle()
            }.alert("Ваш результат", isPresented: $showAlert) {
                //
            } message: {
                Text("\(opacity())")
            }

            Button("Начать заново") {
                number = Int.random(in: 0...100)
            }
        }
        .padding()
    }
}

extension ContentView {
    private func opacity() -> Int {
        let difference = abs(number - lround(Double((value))))
        return (100 - difference) / 10
    }
}

