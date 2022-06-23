//
//  GroupIconView.swift
//  DIN
//
//  Created by sano on 6/23/22.
//

import SwiftUI

enum GroupIconSize {
    case md;
    case lg;
}

struct GroupIconView: View {
    var systemIcon: String
    var color: Color
    var size: GroupIconSize = .md
    
    var sizes: (frame: Double, icon: Double) {
        get {
            switch size {
            case .md:
                return (frame: 35, icon: 15)
            case .lg:
                return (frame: 50, icon: 20)
            }
        }
    }
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: sizes.frame, height: sizes.frame)
            .overlay(
                Image(systemName: systemIcon)
                    .font(.system(size: sizes.icon))
                    .foregroundColor(.white)
            )
    }
}

struct GroupIconView_Previews: PreviewProvider {
    static var previews: some View {
        GroupIconView(systemIcon: "calendar", color: Color.indigo)
            .previewLayout(.sizeThatFits)
    }
}
