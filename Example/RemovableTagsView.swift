import SwiftUI
import HorizontalFlowLayout
import PreviewSnapshots

struct RemovableTagsView: View {
    @State private var tags: [TagItem] = [
        TagItem(name: "Swift", color: .red),
        TagItem(name: "UIKit", color: .blue),
        TagItem(name: "SwiftUI", color: .green),
        TagItem(name: "This is a long tag", color: .orange),
        TagItem(name: "iOS", color: .purple),
        TagItem(name: "Short", color: .pink),
        TagItem(name: "Development", color: .teal),
        TagItem(name: "Mobile", color: .indigo),
        TagItem(name: "Design", color: .cyan)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Removable Tags")
                .font(.title)
                .bold()
                .padding(.bottom, 8)
                
            Text("Tap the X to remove a tag:")
                .font(.headline)
            
            HorizontalFlowLayout(alignment: .leading,
                             horizontalSpacing: 8,
                             verticalSpacing: 10) {
                ForEach(tags) { tag in
                    RemovableTag(
                        text: tag.name,
                        color: tag.color,
                        onRemove: {
                            print("\(tag.name) removed")
                            removeTag(tag)
                        }
                    )
                    .dynamicTypeSize(...DynamicTypeSize.accessibility5)

                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            
            if tags.count < 9 {
                Button("Reset Tags") {
                    resetTags()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .dynamicTypeSize(...DynamicTypeSize.accessibility5)

            }
            
            Spacer()
        }
        .padding()
    }
    
    private func removeTag(_ tag: TagItem) {
        withAnimation(.spring()) {
            tags.removeAll { $0.id == tag.id }
        }
    }
    
    private func resetTags() {
        withAnimation {
            tags = [
                TagItem(name: "Swift", color: .red),
                TagItem(name: "UIKit", color: .blue),
                TagItem(name: "SwiftUI", color: .green),
                TagItem(name: "This is a long tag", color: .orange),
                TagItem(name: "iOS", color: .purple),
                TagItem(name: "Short", color: .pink),
                TagItem(name: "Development", color: .teal),
                TagItem(name: "Mobile", color: .indigo),
                TagItem(name: "Design", color: .cyan)
            ]
        }
    }
}

struct TagItem: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct RemovableTag: View {
    let text: String
    let color: Color
    let onRemove: () -> Void
    
    var body: some View {
        HStack(spacing: 4) {
            Text(text)
                .font(.body)
                .dynamicTypeSize(...DynamicTypeSize.accessibility5)
            
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
                    .font(.caption)
                    .dynamicTypeSize(...DynamicTypeSize.accessibility5)

            }
            .foregroundColor(Color.white.opacity(0.8))
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility5)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}

struct RemovableTagsView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<PreviewState> {
        PreviewSnapshots(
            configurations: PreviewState.all(named: "Normal")
                .map {  PreviewSnapshots.Configuration.init(name: "Layout\($0.name)", state: $0)  },
            configure: { state in
                RemovableTagsView()
                    .environment(\.colorScheme, state.colorScheme)
                    .environment(\.dynamicTypeSize, state.dynamicFontSize)
            }
        )
    }
}
