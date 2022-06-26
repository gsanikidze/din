//
//  TodoList.swift
//  DIN (iOS)
//
//  Created by sano on 6/26/22.
//

import SwiftUI

struct TodoList: View {
    @FetchRequest private var todos: FetchedResults<Todo>
    
    var body: some View {
        ForEach(todos) { todo in
            ListItemView(todo: todo)
        }
    }
    
    init(query: String, group: Group? = nil) {
        let sortByDate = NSSortDescriptor(key: #keyPath(Todo.createdAt), ascending: false)
        
        if group != nil {
            if query.isEmpty {
                _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "group = %@", group!))
            } else {
                _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "group = %@ && title CONTAINS[cd] %@", group!, query))
            }
        } else if !query.isEmpty {
            _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate], predicate: NSPredicate(format: "title CONTAINS[cd] %@", query))
        } else {
            _todos = FetchRequest<Todo>(sortDescriptors: [sortByDate])
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList(query: "")
    }
}
