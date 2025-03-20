import SwiftUI
import SwiftData

struct PrivateMessagesView: View {
    @EnvironmentObject var viewModel: MessageViewModel
    @Environment(\.modelContext) private var modelContext: ModelContext

    var body: some View {
        VStack {
            ForEach(viewModel.directMessages) { message in
                NavigationLink(destination: MessageDetailView(
                    viewModel: viewModel,
                    receiverID: message.receiverID
                )) {
                    MessageRow(
                        message: message,
                        timeAgo: viewModel.timeAgo(date: message.timestamp),
                        senderName: viewModel.getSenderName(for: message),
                        receiverName: viewModel.getReceiverName(for: message)
                    )
                }
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 10)

    }
}
