//
//  HomeScreen.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchValue = ""
    @State private var isAddGroupOpen = false
    @State private var isAddTodoOpen = false
    
    private let groupCardColumns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 10) {
                    LazyVGrid(columns: groupCardColumns, spacing: 10) {
                        ForEach(1...4, id: \.self) {_ in
                            GroupCardView()
                        }
                    }
                    
                    SectionTitleView(title: "All")
                    
                    ForEach(1...20, id: \.self) { _ in
                        ListItemView()
                    }
                    .onDelete {indexSet in
                        print("deleted")
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .searchable(text: $searchValue, placement: .toolbar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: { isAddGroupOpen = true }) {
                        Image(systemName: "plus.rectangle.on.folder")
                            .sheet (isPresented: $isAddGroupOpen) {
                                AddGroupScreen()
                            }
                    }
                }
                ToolbarItem (placement: .primaryAction) {
                    Button(action: { isAddTodoOpen = true }) {
                        Image(systemName: "plus.circle")
                            .sheet(isPresented: $isAddTodoOpen) {
                                AddTodoScreen()
                            }
                    }
                }
            }
            .navigationViewStyle(.automatic)
            .preferredColorScheme(.dark)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
