//
//  ChartView.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/8/24.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data: [SleepDataPoint]

    var body: some View {
        VStack {
            Chart(data) { point in
                BarMark(
                    x: .value("Day", point.day),
                    y: .value("Hours", point.hours)
                )
//                .foregroundStyle(by: .value("Day", point.day))
            }
            .frame(height: 150)

        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: [
            SleepDataPoint(day: "Monday", hours: 7),
            SleepDataPoint(day: "Tuesday", hours: 6),
            SleepDataPoint(day: "Wednesday", hours: 8),
            SleepDataPoint(day: "Thursday", hours: 5),
            SleepDataPoint(day: "Friday", hours: 7),
            SleepDataPoint(day: "Saturday", hours: 9),
            SleepDataPoint(day: "Sunday", hours: 8)
        ])
    }
}
