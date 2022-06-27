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
    
    private var todosByGroup: [(String, Double)] {
        get {
            var res: [(String, Double)] = []
            
            for group in groups {
                let todosCount = Double(group.todos?.count ?? 0)
                
                res.append(("\(group.title!) (\(Int(todosCount)))", todosCount))
            }
            
            return res
        }
    }
    
    private var totalTodos: Int {
        get {
            var res = 0
            
            for group in groups {
                res += group.todos!.count
            }
            
            return res
        }
    }
    
    private let style = ChartStyle(backgroundColor: Color(UIColor.systemGray6), accentColor: .indigo.opacity(0.5), secondGradientColor: .indigo, textColor: .primary, legendTextColor: .primary, dropShadowColor: .black.opacity(0))
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView (showsIndicators: false){
                    VStack (spacing: 20) {
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
                        
                        BarChartView(
                            data: ChartData(values: todosByGroup),
                            title: "Total \(totalTodos) todos",
                            style: style,
                            form: CGSize(width: geometry.size.width - 40, height: 300),
                            dropShadow: false
                        )
                    }
                }
                .padding(20)
                .navigationTitle("Statistics")
            }
        }
    }
}

struct ChartTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChartTabScreen()
    }
}
