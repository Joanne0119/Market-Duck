import SwiftUI
import CoreLocation

struct Market: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let tags: [String]
    let location: String
    let startDate: String
    let endDate: String
    let time: String
    let mrt: String
    let mrtline: String
    var score: Float
    var totalReview: Int
    let info: String
    var isEnd: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        guard let endDate = dateFormatter.date(from: endDate) else {
            return false
        }

        let currentDate = Date()
        
        
        return currentDate > endDate
    
        
    }
}

let taipieMarkets: [Market] = [
    Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/5/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk02", name: "花博農民市集", latitude: 25.070540, longitude: 121.521078, tags: ["美食", "小農", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00", mrt: "圓山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk03", name: "西門紅樓創意市集", latitude: 25.042186, longitude: 121.521078, tags: ["文創", "台北"], location: "台北大同", startDate: "2024/5/18", endDate: "2024/5/19", time: "12:00-21:00(週日至20:00)", mrt: "西門站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食", "台北"], location: "台北大安", startDate: "2024/5/18", endDate: "2024/5/19", time: "17:00-22:00",mrt: "忠孝復興站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk05", name: "好好手感微笑市集", latitude: 25.136580, longitude: 121.502808, tags: ["文創", "美食", "台北"], location: "台北北投", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "新北投站", mrtline: "pink_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk06", name: "天母生活市集", latitude: 25.118692, longitude: 121.529977, tags: ["二手"], location: "台北士林", startDate: "5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "芝山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk07", name: "松菸水水市集", latitude: 25.043791, longitude: 121.559521, tags: ["文創", "美食", "音樂", "台北"], location: "台北信義", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "國父紀念館站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食", "台北"], location: "台北萬華", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "北門站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk09", name: "公館創意跳蚤市集", latitude: 25.012888, longitude: 121.533791, tags: ["文創", "美食", "寵物", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "公館站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk10", name: "嘎啦嘎啦市集", latitude: 25.058436, longitude: 121.530453, tags: ["文創", "美食", "寵物", "台北"], location: "台北中正", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "行天宮站", mrtline: "orange_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。")
]

let recentHistory: [Market] = [
    Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/5/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk05", name: "好好手感微笑市集", latitude: 25.136580, longitude: 121.502808, tags: ["文創", "美食", "台北"], location: "台北北投", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "新北投站", mrtline: "pink_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk07", name: "松菸水水市集", latitude: 25.043791, longitude: 121.559521, tags: ["文創", "美食", "音樂", "台北"], location: "台北信義", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)",mrt: "國父紀念館站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食", "台北"], location: "台北萬華", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "北門站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk09", name: "公館創意跳蚤市集", latitude: 25.012888, longitude: 121.533791, tags: ["文創", "美食", "寵物", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "公館站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk10", name: "嘎啦嘎啦市集", latitude: 25.058436, longitude: 121.530453, tags: ["文創", "美食", "寵物", "台北"], location: "台北中正", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "行天宮站", mrtline: "orange_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。")
]

let nowTrending: [Market] = [
    Market(image: "mk05", name: "好好手感微笑市集", latitude: 25.136580, longitude: 121.502808, tags: ["文創", "美食", "台北"], location: "台北北投", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)",mrt: "新北投站", mrtline: "pink_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk06", name: "天母生活市集", latitude: 25.118692, longitude: 121.529977, tags: ["二手"], location: "台北士林", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "芝山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk10", name: "嘎啦嘎啦市集", latitude: 25.058436, longitude: 121.530453, tags: ["文創", "美食", "寵物", "台北"], location: "台北中正", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "行天宮站", mrtline: "orange_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食", "台北"], location: "台北大安", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "忠孝復興站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/5/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。")
]

let recommend: [Market] = [
    Market(image: "mk02", name: "花博農民市集", latitude: 25.070540, longitude: 121.521078, tags: ["美食", "小農", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "圓山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk03", name: "西門紅樓創意市集", latitude: 25.042186, longitude: 121.521078, tags: ["文創", "台北"], location: "台北大同", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "西門站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食", "台北"], location: "台北萬華", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "北門站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食", "台北"], location: "台北大安", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "忠孝復興站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/5/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk07", name: "松菸水水市集", latitude: 25.043791, longitude: 121.559521, tags: ["文創", "美食", "音樂", "台北"], location: "台北信義", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "國父紀念館站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。")
]

let favorite: [Market] = [
    Market(image: "mk02", name: "花博農民市集", latitude: 25.070540, longitude: 121.521078, tags: ["美食", "小農", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/7/19", time: "13:00-21:00(週日至20:00)", mrt: "圓山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk03", name: "西門紅樓創意市集", latitude: 25.042186, longitude: 121.521078, tags: ["文創", "台北"], location: "台北大同", startDate: "2024/5/18", endDate: "2024/7/19", time: "13:00-21:00(週日至20:00)", mrt: "西門站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食", "台北"], location: "台北萬華", startDate: "2024/5/18", endDate: "2024/9/19", time: "13:00-21:00(週日至20:00)", mrt: "北門站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食", "台北"], location: "台北大安", startDate: "2024/5/18", endDate: "2024/8/19", time: "13:00-21:00(週日至20:00)", mrt: "忠孝復興站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。"),
    Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/5/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。")
]
