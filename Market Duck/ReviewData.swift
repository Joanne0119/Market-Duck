//
//  ReviewData.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/25.
//

import Foundation
import SwiftUI

struct Review: Identifiable, Hashable {
    let id = UUID()
    let date = Date()
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: date)
    }
    let content:String
    let userName:String
    let userImage:String
    let score: Float
}
