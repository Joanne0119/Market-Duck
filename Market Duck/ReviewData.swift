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

var reviewData: [Review] = [
        Review(content: "好棒的市集!有很多有趣的攤位!主辦方也很有心，布置得非常美麗。推薦大家一定要來。", userName: "小海馬", userImage: "default_profile_photo", score: 5),
        Review(content: "整體規劃很不錯，人多也不會到動彈不得，但建議主辦方可以設置多一點垃圾桶。", userName: "小恐龍", userImage: "default_profile_photo", score: 4),
        Review(content: "逛了許多市集，這個市集算是名列前茅的，主題名稱很吸引人，但整體活動還是無聊了點。", userName: "烏鴉小妹", userImage: "default_profile_photo", score: 4),
        Review(content: "很不錯~逛起來舒服，而且攤販都很親切。", userName: "企鵝小弟", userImage: "default_profile_photo", score: 5),
        Review(content: "不錯不錯!推薦大家來!", userName: "樹懶小夥", userImage: "default_profile_photo", score: 5)
    ]

