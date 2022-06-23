//
//  AddTodoScreen.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct AddTodoScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    private let groups = [
        "Today", "Some group", "Some other group"
    ]
    
    @State private var title = ""
    @State private var group = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                Picker("Select Group", selection: $group) {
                    ForEach(groups, id: \.self) {
                        Text($0)
                    }
                }
                
                DatePicker(
                    "Do Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button (action: { dismiss() }) {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem (placement: .primaryAction) {
                    Button (action: { dismiss() }) {
                        Text("Done")
                    }
                }
            }
            .navigationTitle("Add Todo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddTodoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoScreen()
    }
}
