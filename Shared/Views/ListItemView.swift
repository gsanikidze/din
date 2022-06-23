//
//  ListItemView.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct ListItemView: View {
    @State var doesClose = false
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    HStack {
                        CheckboxView()
                        Text("Some list item")
                    }
                    
                    Text("Group Title | Today at 2pm")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Image(systemName: "trash")
            }
            Divider()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
            .previewLayout(.sizeThatFits)
    }
}
