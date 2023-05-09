//
//  RunInfo.swift
//  RunApp
//
//  Created by Ruslan on 03.05.23.
//

import Foundation

struct RunInfo: Codable {
    let startDate: Date
    let endDate: Date
    let distance: Double
    let duration: TimeInterval
    
    var pace: Double {
        return duration / distance
    }
}
