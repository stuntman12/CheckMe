
import SwiftUI

struct UISliderRepresent: UIViewRepresentable {
    
    typealias UIViewType = UISlider
    
    @Binding var value: Float
    
    let opacity: Int
  
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.value = value
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator, action: #selector(Coordinator.changeValue), for: .valueChanged)
        slider.thumbTintColor = UIColor.purple.withAlphaComponent(CGFloat(opacity) / 10)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor.purple.withAlphaComponent(CGFloat(opacity) / 10)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresent {
    final class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc
        func changeValue(_ sender: UISlider) {
            value = Float(Int(sender.value))
        }
    }
}

