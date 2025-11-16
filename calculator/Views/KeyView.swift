import SwiftUI

struct KeyView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOpretion: Opretion = .none
    @State private var changeColor = false
    let button : [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(changeColor ?
                                     Color("num").opacity(0.4) :
                                        Color("pink").opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 200)
                    .animation(Animation.easeInOut.speed(0.17)
                        .repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(Text(self.value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundStyle(Color.black)
                             
                    )
            }.padding()
            ForEach(button,id: \.self){ row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){ element in
                        Button {
                            self.didTap(button: element)
                        } label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .frame(width: self.getWidth(elm: element), height: self.getHeight(elem: element))
                                .background(element.buttonColor)
                                .foregroundStyle(Color.black)
                                .cornerRadius(30)
                                .shadow(color: .purple.opacity(0.8),
                                        radius: 30)
                            
                        }
                    }
                }.padding(.bottom, 4)
            }
        }
    }
    
    func getWidth(elm: Keys) -> CGFloat {
//        if(elm == .zero) {
//            return (UIScreen.main.bounds.width - (5*10)) / 2
//        }
//        return (UIScreen.main.bounds.width - (5*10)) / 4
        
        guard let screen = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.screen else {
                return 0
            }
            
            let totalWidth = screen.bounds.width
            let padding: CGFloat = 5 * 10

            if elm == .zero {
                return (totalWidth - padding) / 2
            } else {
                return (totalWidth - padding) / 4
            }
    }
    func getHeight(elem: Keys) -> CGFloat {
        guard let screen = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.screen else {
                return 0
            }
            
            let totalWidth = screen.bounds.width
            let padding: CGFloat = 5 * 10



            return (totalWidth - padding) / 5
            
    }
    func didTap (button: Keys){
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOpretion = .add
                self.runningNumber = Int(self.value) ?? 0
            }else if button == .subtract {
                self.currentOpretion = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOpretion = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOpretion = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOpretion {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    self.value = "error occur"
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "\(0)"
            runningNumber = 0
            currentOpretion = .none
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }else{
                self.value = "\(self.value)\(number)"
            }
            
            
        }
    }
}

#Preview {
    KeyView()
}
