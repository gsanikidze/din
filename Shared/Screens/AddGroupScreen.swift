//
//  AddGroupScreen.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct AddGroupScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    @State private var title = ""
    @State private var color = Color.indigo
    @State private var systemIcon = "calendar"
    
    private let colors = [
        Color.indigo, Color.red, Color.blue, Color.cyan, Color.yellow,
        Color.green, Color.mint, Color.purple, Color.teal, Color.pink,
    ]
    
    private let systemIcons = [
        "calendar", "book.closed", "bookmark", "graduationcap", "cart",
        "display", "clock", "network", "phone", "heart"
    ]
    
    private let columns = Array(repeating: GridItem(spacing: 20), count: 5)
    
    private func createGroup() {
        PersistenceController.shared.createGroup(context: moc, title: title, symbolIcon: systemIcon, color: color)
        
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    VStack (alignment: .center, spacing: 20) {
                        GroupIconView(systemIcon: systemIcon, color: color, size: .lg)
                        TextField("Title", text: $title)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                    LazyVGrid (columns: columns, spacing: 20) {
                        ForEach(colors, id: \.self) { cl in
                            ZStack {
                                if cl == color {
                                    Circle()
                                        .foregroundColor(cl)
                                        .frame(width: 45, height: 45)
                                        .opacity(0.3)
                                }
                                
                                Circle()
                                    .foregroundColor(cl)
                                    .frame(width: 30, height: 30)
                                    .padding(15)
                            }
                            .onTapGesture {
                                withAnimation {
                                    self.color = cl
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                    LazyVGrid (columns: columns, spacing: 20) {
                        ForEach(systemIcons, id: \.self) { icon in
                            GroupIconView(systemIcon: icon, color: self.systemIcon == icon ? self.color : Color(UIColor.systemGray6))
                                .onTapGesture {
                                    withAnimation {
                                        self.systemIcon = icon
                                    }
                                }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                }
            }
            .padding()
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button (action: { dismiss() }) {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem (placement: .primaryAction) {
                    Button (action: createGroup) {
                        Text("Done")
                    }
                }
            }
            .navigationTitle("Add Group")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddGroupScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupScreen()
    }
}
