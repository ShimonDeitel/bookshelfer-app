import SwiftUI

struct EntrySheet: View {
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss

    var editing: BookEntry?

    @State private var name: String = ""
    @State private var field1: String = ""
    @State private var field2: String = ""
    @State private var extraField: String = ""
    @State private var notes: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                        .accessibilityIdentifier("entryNameField")
                    TextField("Author", text: $field1)
                        .accessibilityIdentifier("entryField1Field")
                    TextField("Shelf", text: $field2)
                        .accessibilityIdentifier("entryField2Field")
                    TextField("Added", text: $extraField)
                        .accessibilityIdentifier("entryExtraField")
                    TextField("Notes", text: $notes, axis: .vertical)
                        .accessibilityIdentifier("entryNotesField")

                }
            }
            .scrollDismissesKeyboard(.interactively)
            .contentShape(Rectangle())
            .onTapGesture { isFocused = false }
            .navigationTitle(editing == nil ? "Add Book" : "Edit Book")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                        .accessibilityIdentifier("entryCancelButton")
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .accessibilityIdentifier("entrySaveButton")
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .onAppear {
                if let e = editing {
                    name = e.name
                    field1 = e.author
                    field2 = e.shelf
                    extraField = e.addedDate
                    notes = e.notes
                }
            }
        }
    }

    private func save() {
        if var e = editing {
            e.name = name
            e.author = field1
            e.shelf = field2
            e.addedDate = extraField
            e.notes = notes
            store.update(e)
        } else {
            let entry = BookEntry(name: name, author: field1, shelf: field2, addedDate: extraField, notes: notes)
            store.add(entry)
        }
        dismiss()
    }
}
