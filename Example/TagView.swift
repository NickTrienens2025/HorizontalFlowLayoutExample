//import SwiftUI
//import HorizontalFlowLayout
//
//struct TagView: View {
//    let title: String
//    let isSelected: Bool
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(.system(size: 14, weight: .medium))
//                .padding(.horizontal, 10)
//                .padding(.vertical, 6)
//                .background(isSelected ? Color.blue : Color(.systemGray5))
//                .foregroundColor(isSelected ? .white : .primary)
//                .cornerRadius(16)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//struct RemovableTagView: View {
//    let text: String
//    let color: Color
//    let onRemove: () -> Void
//    
//    var body: some View {
//        HStack(spacing: 4) {
//            Text(text)
//                .font(.system(size: 14, weight: .medium))
//            
//            Button(action: onRemove) {
//                Image(systemName: "xmark.circle.fill")
//                    .font(.system(size: 14))
//            }
//            .foregroundColor(Color.white.opacity(0.8))
//        }
//        .padding(.horizontal, 10)
//        .padding(.vertical, 6)
//        .background(color)
//        .foregroundColor(.white)
//        .cornerRadius(16)
//    }
//}
//
//struct TagsExampleView: View {
//    @State private var tags = [
//        "Swift", "UIKit", "SwiftUI", "iOS", "Mobile",
//        "Development", "Design", "UI", "Layout"
//    ]
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Removable Tags Example")
//                .font(.headline)
//            
//            HorizontalFlowLayout(alignment: .leading,
//                             horizontalSpacing: 8,
//                             verticalSpacing: 10) {
//                ForEach(tags, id: \.self) { tag in
//                    RemovableTagView(
//                        text: tag,
//                        color: tagColor(for: tag),
//                        onRemove: { removeTag(tag) }
//                    )
//                }
//            }
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            
//            if tags.count < 9 {
//                Button("Reset Tags") {
//                    tags = [
//                        "Swift", "UIKit", "SwiftUI", "iOS", "Mobile",
//                        "Development", "Design", "UI", "Layout"
//                    ]
//                }
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.blue)
//                .cornerRadius(8)
//            }
//        }
//        .padding()
//    }
//    
//    private func removeTag(_ tag: String) {
//        if let index = tags.firstIndex(of: tag) {
//            withAnimation(.spring()) {
//                tags.remove(at: index)
//            }
//        }
//    }
//    
//    private func tagColor(for tag: String) -> Color {
//        let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .teal, .indigo, .cyan]
//        let index = abs(tag.hashValue) % colors.count
//        return colors[index]
//    }
//}
//
//struct TagsExampleView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagsExampleView()
//    }
//} 
