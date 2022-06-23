//
//  CheckboxView.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI

struct CheckboxView: View {
    var label: String?
    @State private var checked = false
    
    var body: some View {
        HStack {
            if checked {
                Image(systemName: "checkmark.square")
                    .foregroundColor(.indigo)
            } else {
                Image(systemName: "square")
            }
            
            if label != nil {
                Text(label!)
            }
        }.onTapGesture {
            checked = !checked
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView()
            .previewLayout(.sizeThatFits)
        
        CheckboxView(label: "Some Label")
            .previewLayout(.sizeThatFits)
    }
}
