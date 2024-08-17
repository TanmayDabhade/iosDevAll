//
//  Extensions.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import Foundation
import SwiftUI

extension Color {
    //In the tutorial we needed to add extensions as it was older version of xcode, now xcode itself adds the asset, colors to the Color property.
//    static let background = Color("Background")
//    static let icon = Color("Icon")
//    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)

}

extension DateFormatter{
    //This is a lazy method and make sure we initialise this method once only, as it is very expensive operation.
    //Also Static helps to ensure that there is only one instance of it.
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/DD/YYYY"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date()}
        
        return parsedDate
    }
}
