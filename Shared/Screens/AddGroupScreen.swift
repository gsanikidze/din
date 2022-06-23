//
//  AddGroupScreen.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct AddGroupScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    
    private let colors = [
        Color.indigo, Color.red, Color.blue, Color.cyan, Color.yellow,
        Color.green, Color.mint, Color.purple, Color.teal, Color.pink,
    ]
    
    private let systemIcons = [
        "calendar", "book.closed", "bookmark", "graduationcap", "cart",
        "display", "clock", "network", "phone", "heart"
    ]
    
    private let columns = Array(repeating: GridItem(spacing: 20), count: 5)
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    VStack (alignment: .center, spacing: 20) {
                        GroupIconView(systemIcon: "calendar", color: Color.indigo, size: .lg)
                        TextField("Title", text: $title)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                    LazyVGrid (columns: columns, spacing: 20) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 30, height: 30)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    
                    LazyVGrid (columns: columns, spacing: 20) {
                        ForEach(systemIcons, id: \.self) { icon in
                            GroupIconView(systemIcon: icon, color: Color.indigo)
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
                    Button (action: { dismiss() }) {
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
