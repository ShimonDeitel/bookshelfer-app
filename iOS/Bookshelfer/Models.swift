import Foundation

struct BookEntry: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var author: String
    var shelf: String
    var addedDate: String
    var notes: String = ""
    var createdAt: Date = Date()
}
