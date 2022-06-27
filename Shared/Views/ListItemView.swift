//
//  ListItemView.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI
import CoreData

struct ListItemView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var todo: Todo
    
    @State private var doesClose = false
    @State private var isEditTodoOpen = false
    
    private func deleteTodo(object: NSManagedObject) {
        PersistenceController.shared.delete(context: moc, object: object)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    HStack {
                        CheckboxView(defaultChecked: todo.done, onToggle: {
                            todo.toggle(context: moc)
                        })
                        if todo.title != nil {
                            Text(todo.title!)
                                .onTapGesture {
                                    isEditTodoOpen.toggle()
                                }
                                .sheet(isPresented: $isEditTodoOpen) {
                                    PublishTodoScreen(todo: todo)
                                }
                        }
                    }
                    
                    Text("\(todo.group!.title!) | \(todo.readableDoDate)")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Image(systemName: "trash")
                    .onTapGesture {
                        deleteTodo(object: todo)
                    }
            }
            Divider()
        }
    }
}

let todo = Todo.createFakeTodo(group: Group())

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(todo: todo)
            .previewLayout(.sizeThatFits)
    }
}
