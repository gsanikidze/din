//
//  GroupCardView.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct GroupCardView: View {
    var body: some View {
        VStack {
            HStack {
                GroupIconView(systemIcon: "calendar", color: Color.pink)
                
                Spacer()
                
                Text("21")
                    .foregroundColor(.primary)
                    .bold()
            }
            
            HStack {
                Text("Today")
                    .font(.system(size: 18))
                    .bold()
                Spacer()
            }
        }
        .padding(10)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

struct GroupCardView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCardView()
            .previewLayout(.sizeThatFits)
    }
}
