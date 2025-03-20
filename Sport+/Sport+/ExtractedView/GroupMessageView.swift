
import SwiftUI
import SwiftData

struct GroupMessagesView: View {
    @EnvironmentObject var viewModel: MessageViewModel // Utilisez le même viewModel partagé
    @Environment(\.modelContext) private var modelContext: ModelContext

    var body: some View {
        VStack {
            ForEach(viewModel.groupMessages) { group in
                NavigationLink(destination: MessageDetailView(
                    viewModel: viewModel,
                    groupID: group.id
                )) {
                    GroupRow(group: group)
                }
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 10)

    }
}
