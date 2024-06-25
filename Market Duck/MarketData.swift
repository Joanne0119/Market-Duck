import SwiftUI
import CoreLocation

struct Market: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let tags: [String]
    let location: String
    let date: String
    let mrt: String
}

let taipieMarkets: [Market] = [
    Market(image: "mk01", name: "心中山有趣市", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶"], location: "中山", date: "5/3-5/26", mrt: "中山站"),
    Market(image: "mk02", name: "花博農民市集", latitude: 25.070540, longitude: 121.521078, tags: ["美食", "小農"], location: "中山", date: "5/18-5/19", mrt: "圓山站"),
    Market(image: "mk03", name: "西門紅樓創意市集", latitude: 25.042186, longitude: 121.521078, tags: ["文創"], location: "大同", date: "5/18-5/19", mrt: "西門站"),
    Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食"], location: "大安", date: "5/18-5/19", mrt: "忠孝復興站"),
    Market(image: "mk05", name: "好好手感微笑市集", latitude: 25.136580, longitude: 121.502808, tags: ["文創", "美食"], location: "北投", date: "5/18-5/19", mrt: "新北投站"),
    Market(image: "mk06", name: "天母生活市集", latitude: 25.118692, longitude: 121.529977, tags: ["二手"], location: "士林", date: "5/18-5/19", mrt: "芝山站"),
    Market(image: "mk07", name: "松菸水水市集", latitude: 25.043791, longitude: 121.559521, tags: ["文創", "美食", "音樂"], location: "信義", date: "5/18-5/19", mrt: "國父紀念館站"),
    Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食"], location: "萬華", date: "5/18-5/19", mrt: "北門站"),
    Market(image: "mk09", name: "公館創意跳蚤市集", latitude: 25.012888, longitude: 121.533791, tags: ["文創", "美食", "寵物"], location: "中山", date: "5/18-5/19", mrt: "公館站"),
    Market(image: "mk10", name: "嘎啦嘎啦市集", latitude: 25.058436, longitude: 121.530453, tags: ["文創", "美食", "寵物"], location: "中正", date: "5/18-5/19", mrt: "行天宮站")
]
