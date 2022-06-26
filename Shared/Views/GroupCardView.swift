//
//  GroupCardView.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct GroupCardView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var group: Group
    
    var body: some View {
        VStack {
            HStack {
                GroupIconView(systemIcon: group.systemIcon ?? "calendar", color: group.color != nil ? Color(hex: group.color!)! : Color.pink)
                
                Spacer()
                
                if group.todos != nil {
                    Text("\(group.todos!.count)")
                        .foregroundColor(.primary)
                        .bold()
                }
            }
            
            if group.title != nil {
                HStack {
                    Text(group.title!)
                        .font(.system(size: 18))
                        .bold()
                    Spacer()
                }
            }
        }
        .padding(10)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .contextMenu {
            Button("Delete Group") {
                withAnimation {
                    PersistenceController.shared.delete(context: moc, object: group)
                }
            }
        }
    }
}

let group = Group.createFakeGroup()

struct GroupCardView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCardView(group: group)
            .previewLayout(.sizeThatFits)
    }
}
