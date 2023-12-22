
import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var value: Float = Float(Int.random(in: 0...100))
    @State private var number = Int.random(in: 0...100)
    
    var computeScore: Int {
        let difference = abs(number - lround(Double((value))))
        return 100 - difference
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Подвинь слайдер, как можно ближе к \(number)")
                .lineLimit(0)
            
            HStack{
                Text("0")
                UISliderRepresent(value: $value, number: $number)
                    .frame(width: 230)
                    .onChange(of: value) { _, newValue in
                        value = newValue
                    }
                Text("100")
            }
            Text("\(value)")
            
            Button("Проверь меня") {
                self.showAlert.toggle()
            }.alert("Ваш результат", isPresented: $showAlert) {
                //
            } message: {
                Text("\(computeScore)")
            }

            Button("Начать заново") {
                number = Int.random(in: 0...100)
            }
        }
        .padding()
    }
}

