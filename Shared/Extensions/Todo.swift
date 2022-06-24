//
//  Todo.swift
//  DIN (iOS)
//
//  Created by sano on 6/24/22.
//

import Foundation
import CoreData

extension Todo {
    static func createFakeTodo(group: Group, context: NSManagedObjectContext? = nil) -> Todo {
        let newTodo = context != nil ? Todo(context: context!) : Todo()
        newTodo.group = group
        newTodo.id = UUID()
        newTodo.title = "Some Todo"
        newTodo.createdAt = Date()
        newTodo.doDate = Date()
        
        return newTodo
    }
    
    var readableDoDate: String {
        get {
            let df = DateFormatter()
            df.dateFormat = "MMM dd,yyyy"
            
            if (self.doDate != nil) {
                return df.string(from: self.doDate!)
            }
            
            return ""
        }
    }
    
    func toggle(context: NSManagedObjectContext) {
        self.done.toggle()
        
        PersistenceController.shared.save(context: context)
    }
}
