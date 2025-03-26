import SwiftUI
import UIKit
import Foundation
import HorizontalFlowLayout

struct FailingContentView: View {
    struct TagModel: Identifiable {
        var id = UUID()
        var text: String
        var backgroundColor: Color = .gray
    }
    
    let tags = [
        TagModel(text: "Swift", backgroundColor: .red),
        TagModel(text: "UIKit", backgroundColor: .blue),
        TagModel(text: "SwiftUI", backgroundColor: .green),
        TagModel(text: "This is a long tag that will wrap", backgroundColor: .orange),
        TagModel(text: "iOS", backgroundColor: .purple),
        TagModel(text: "Short", backgroundColor: .pink),
        TagModel(text: "Development", backgroundColor: .teal),
        TagModel(text: "Mobile", backgroundColor: .indigo),
        TagModel(text: "Very very very long tag", backgroundColor: .brown),
        TagModel(text: "UI", backgroundColor: .cyan),
        TagModel(text: "Design", backgroundColor: .mint),
        TagModel(text: "A", backgroundColor: .gray)
    ]
    
    static let ticksPerSecond = CGFloat(60)
    @State private var step = 100
    var width: CGFloat {
        let period = CGFloat(10)
        let widthRange: Range<CGFloat> = 240..<300
        let averageWidth = (widthRange.lowerBound + widthRange.upperBound) / 2
        let rangeWidth = widthRange.upperBound - widthRange.lowerBound
        let phase = cos(CGFloat(step) / Self.ticksPerSecond * 2 * .pi / period)
        return averageWidth + (phase - 0.5) * rangeWidth / 2
    }
    
    let timer = Timer.publish(every: 2 / ticksPerSecond, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                HorizontalFlowLayout(
                    alignment: .leading,
                    horizontalSpacing: 2,
                    verticalSpacing: 6) {
                        ForEach(tags) {
                            Text($0.text)
                                .fixedSize(horizontal: true, vertical: false)
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 4)
                                .background($0.backgroundColor)
                                .cornerRadius(8)
                        }
                    }
                    .frame(width: width)
                    .background(Rectangle().stroke(Color.accentColor))
                    .padding()
                
                Spacer(minLength: .zero)
                
            }
            .background(Rectangle().stroke(Color.red))
            .onReceive(timer) { _ in step += 1 }
            .animation(.default, value: step)
            
            Spacer()
        }
        .padding()
    }
}

struct FailingContentView_Previews: PreviewProvider {
    static var previews: some View {
        FailingContentView()
    }
}
