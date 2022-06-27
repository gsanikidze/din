//
//  ChartTabScreen.swift
//  DIN (iOS)
//
//  Created by sano on 6/27/22.
//

import SwiftUI
import SwiftUICharts

struct ChartTabScreen: View {
    @FetchRequest(entity: Group.entity(), sortDescriptors: []) private var groups: FetchedResults<Group>
    
    private let groupColumns = Array.init(repeating: GridItem(), count: 2)
    
    private var groupData: [([Double], GradientColor)] {
        get {
            var res: [([Double], GradientColor)] = []
            
            for group in groups {
                var todoCounts: [Double] = [0]
                let color = Color(hex: group.color!)!
                
                for _ in group.todos! {
                    todoCounts.append((todoCounts.last ?? 0) + 1)
                }
                
                res.append((todoCounts, GradientColor(start: color.opacity(0.5), end: color)))
            }
            
            return res
        }
    }
    
    private let style = ChartStyle(backgroundColor: Color(UIColor.systemGray6), accentColor: .accentColor, secondGradientColor: .secondary, textColor: .primary, legendTextColor: .primary, dropShadowColor: .black)
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack (spacing: 20) {
                        MultiLineChartView(
                            data: groupData,
                            title: "Groups",
                            legend: "Todos by group",
                            style: style,
                            form: CGSize(width: geometry.size.width - 40, height: 200),
                            rateValue: 0,
                            dropShadow: false
                        )
                        .foregroundColor(.red.opacity(0))
                        
                        LazyVGrid (columns: groupColumns, alignment: .leading) {
                            ForEach(groups) { group in
                                HStack {
                                    Color(hex: group.color!)
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(100)
                                    Text("\(group.title!) (\(group.todos!.count))")
                                }
                            }
                        }
                    }
                }
                .padding(20)
                .navigationTitle("Statistics")
                .preferredColorScheme(.dark)
            }
        }
    }
}

struct ChartTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChartTabScreen()
    }
}
