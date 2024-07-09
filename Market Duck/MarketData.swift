import SwiftUI
import CoreLocation

class Market: Identifiable, ObservableObject, Hashable {
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
    @Published var score: Float
    @Published var totalReview: Int
    let info: String
    @Published var isFavorite: Bool
//    var isEnd: Bool {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd"
//        
//        guard let endDate = dateFormatter.date(from: endDate) else {
//            return false
//        }
//
//        let currentDate = Date()
//        
//        
//        return currentDate > endDate
//    
//        
//    }
    var isEnd: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        guard let endDate = dateFormatter.date(from: endDate) else {
            return false
        }

        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        
        var endDateComponents = calendar.dateComponents([.month, .day], from: endDate)
        endDateComponents.year = currentYear
        
        guard let endDateWithYear = calendar.date(from: endDateComponents) else {
            return false
        }
        
        return currentDate > endDateWithYear
    }
    
    init(image: String, name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, tags: [String], location: String, startDate: String, endDate: String, time: String, mrt: String, mrtline: String, score: Float, totalReview: Int, info: String, isFavorite: Bool) {
        self.image = image
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.tags = tags
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
        self.time = time
        self.mrt = mrt
        self.mrtline = mrtline
        self.score = score
        self.totalReview = totalReview
        self.info = info
        self.isFavorite = isFavorite
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
       
   static func == (lhs: Market, rhs: Market) -> Bool {
       return lhs.id == rhs.id
   }
}

class MarketData: ObservableObject{
    @Published var markets:[Market] = [
        Market(image: "mk01", 
               name: "心中山迪士尼市集",
               latitude: 25.05582,
               longitude: 121.5206,
               tags: ["文創", "節慶", "美食", "台北"],
               location: "台北中山",
               startDate: "7/4",
               endDate: "9/30",
               time: "13:00-21:00(週日至20:00)",
               mrt: "中山站",
               mrtline: "red_line_color",
               score: 4.5,
               totalReview: 64,
               info:"以米奇與好朋友將首度走進真實世界「Keep It Real」為主題，選中最chill的台北捷運心中山線形公園，將以最潮流的方式和粉絲一起探索城市。可以看到米奇、米妮、唐老鴨、黛西和高飛相約逛街壓馬路、對鏡自拍，奇奇與蒂蒂開心地在公園玩耍；夜幕低垂，街頭塗鴉風格的造景亮起，一不小心還會撞見在約會放閃的米奇和米妮！",
               isFavorite: false),
        Market(image: "mk02",
               name: "有趣市集｜酒肉好友-跟著港覺走",
               latitude: 25.070540,
               longitude: 121.521078,
               tags: ["美食", "台北"],
               location: "台北中山",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "圓山站",
               mrtline: "red_line_color",
               score: 4.2,
               totalReview: 124,
               info:"香港，曾是台灣的旅遊勝地，懷舊的美食讓人垂延三尺大牌樓的招牌，已成為街巷中的風景。\n經典的港片曾是台灣人的童年。這些元素漸漸的被淡忘，愈來愈少台灣人能夠親眼目睹。有趣市集決定讓消費者不用出國，就可以體驗香港的飲食文化，將美食美酒帶入市集中，提供有品味的微醺夜生活。",
               isFavorite: true),
        Market(image: "mk03",
               name: "混市集",
               latitude: 25.04186,
               longitude: 121.54658,
               tags: ["美食", "文創", "台北"],
               location: "台北大安",
               startDate: "7/11",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "忠孝復興站",
               mrtline: "blue_line_color",
               score: 4.5,
               totalReview: 64,
               info:"文創、手作、美食，應有盡有",
               isFavorite: false),
        Market(image: "mk04",
               name: "西紅市．創意市集 Creatives and Art Market",
               latitude: 25.042186,
               longitude: 121.506865,
               tags: ["文創", "台北"],
               location: "台北萬華",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "西門站",
               mrtline: "blue_line_color",
               score: 4.5,
               totalReview: 64,
               info:"西門紅樓創意市集，聚集眾多創意手作藝術家熱鬧共聚，吸引大批觀光人潮前來選購生活創意商品，營造假日歡樂氣氛，並豐富來客之生活品質。",
               isFavorite: true),
        Market(image: "mk05",
               name: "AFTER PARTY（市集）",
               latitude: 25.05387044266678,
               longitude: 121.60478775343375,
               tags: ["文創", "美食", "台北"],
               location: "台北南港",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "南港站",
               mrtline: "brown_line_color",
               score: 4.0,
               totalReview: 102,
               info:"文創、手作、美食，衣服飾品。有得吃有得逛",
               isFavorite: false),
        Market(image: "mk06",
               name: "嘎啦嘎拉市集",
               latitude: 25.058436,
               longitude: 121.530453,
               tags: ["文創", "美食", "台北"],
               location: "台北中山",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "行天宮站",
               mrtline: "orange_line_color",
               score: 4.0,
               totalReview: 112,
               info:"「Let’s keep our fingers crossed 」\n讓你心裡的嘎啦嘎啦話被更多的人聽見，讓你的創作被更多人看見。",
               isFavorite: true),
        Market(image: "mk07",
               name: "公館創意跳蚤市集",
               latitude: 25.012888,
               longitude: 121.533791,
               tags: ["手作", "文創", "台北"],
               location: "台北大安",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "公館站",
               mrtline: "green_line_color",
               score: 4.0,
               totalReview: 112,
               info:"二手、飾品、好吃又好玩",
               isFavorite: false),
        Market(image: "mk08",
               name: "Hello SUMMER  涼好一夏市集",
               latitude: 25.052864025124748,
               longitude: 121.60592222274681,
               tags: ["文創", "手作" ,"美食", "台北"],
               location: "台北南港",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "南港站",
               mrtline: "brown_line_color",
               score: 4.6,
               totalReview: 22,
               info:"最期待的夏天來啦!!期待夏天的什麼呢? 是沙灘或海洋，是一起舉杯的狂歡，還是啤酒下肚的冰涼感夏花清新芳香，夏果甜蜜多汁，夏風暖烘烘的，夏日艷陽熱情迎人！夏天的味道無所不在！走進市集裡，可以發現更多夏的痕跡，來吧!一起涼好一夏！",
               isFavorite: false),
        Market(image: "mk09",
               name: "hello-earth-地球-你好嗎-安森町環保市集",
               latitude: 25.052834866801714,
               longitude: 121.60594368041846,
               tags: ["文創", "美食", "台北"],
               location: "台北大安",
               startDate: "7/13",
               endDate: "7/14",
               time: "14:00-21:00(週日至20:00)",
               mrt: "大安森林公園站",
               mrtline: "orange_line_color",
               score: 4.0,
               totalReview: 100,
               info:"關於夏天的五個「Hallo」串起夏日聯想，用愛開啟這個夏天以環保為議題，在安森町市集裡，發起愛地球的永續理念。我們的地球只有一個，愛護地球之路無止境，為友善地球盡一份力，需要大家一起行動，從小處做起，大處著眼，保護海洋、愛護森林、友善環境，用心維護我們生存的地球。",
               isFavorite: true),
        Market(image: "mk10",
               name: "松菸水水市集",
               latitude: 25.043791,
               longitude: 121.559521,
               tags: ["文創", "美食", "音樂", "台北"],
               location: "台北信義",
               startDate: "7/13",
               endDate: "7/14",
               time: "13:00-21:00(週日至20:00)",
               mrt: "國父紀念館站",
               mrtline: "blue_line_color",
               score: 4.5,
               totalReview: 130,
               info:"不只是創意市集，我們打造的是一個結合文創、藝文、樂活的創藝聚落。",
               isFavorite: false),
        Market(image: "mk11",
               name: "花博農民市集",
               latitude: 25.070540,
               longitude: 121.521078,
               tags: ["美食", "小農", "台北"],
               location: "台北中山",
               startDate: "5/18",
               endDate: "6/19",
               time: "13:00-21:00",
               mrt: "圓山站",
               mrtline: "red_line_color",
               score: 4.5,
               totalReview: 130,
               info:"春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。",
               isFavorite: true)
    ]
//    @Published var markets:[Market] = [
//        Market(image: "mk01", name: "心中山有趣市集", latitude: 25.05582, longitude: 121.5206, tags: ["美食", "文創", "節慶", "台北"], location: "台北中山", startDate: "2024/5/3", endDate: "2024/7/26", time: "13:00-21:00(週日至20:00)", mrt: "中山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk02", name: "花博農民市集", latitude: 25.070540, longitude: 121.521078, tags: ["美食", "小農", "台北"], location: "台北中山", startDate: "2024/7/18", endDate: "2024/7/19", time: "13:00-21:00", mrt: "圓山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: true),
//        Market(image: "mk03", name: "西門紅樓創意市集", latitude: 25.042186, longitude: 121.521078, tags: ["文創", "台北"], location: "台北大同", startDate: "2024/5/18", endDate: "2024/5/19", time: "12:00-21:00(週日至20:00)", mrt: "西門站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk04", name: "混市集", latitude: 25.04186, longitude: 121.54658, tags: ["文創", "美食", "台北"], location: "台北大安", startDate: "2024/5/18", endDate: "2024/7/19", time: "17:00-22:00",mrt: "忠孝復興站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: true),
//        Market(image: "mk05", name: "好好手感微笑市集", latitude: 25.136580, longitude: 121.502808, tags: ["文創", "美食", "台北"], location: "台北北投", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "新北投站", mrtline: "pink_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk06", name: "天母生活市集", latitude: 25.118692, longitude: 121.529977, tags: ["二手"], location: "台北士林", startDate: "5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "芝山站", mrtline: "red_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk07", name: "松菸水水市集", latitude: 25.043791, longitude: 121.559521, tags: ["文創", "美食", "音樂", "台北"], location: "台北信義", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "國父紀念館站", mrtline: "blue_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: true),
//        Market(image: "mk08", name: "大稻埕碼頭貨櫃市集", latitude: 25.056128, longitude: 121.507401, tags: ["文創", "美食", "台北"], location: "台北萬華", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "北門站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk09", name: "公館創意跳蚤市集", latitude: 25.012888, longitude: 121.533791, tags: ["文創", "美食", "寵物", "台北"], location: "台北中山", startDate: "2024/5/18", endDate: "2024/7/19", time: "13:00-21:00(週日至20:00)", mrt: "公館站", mrtline: "green_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false),
//        Market(image: "mk10", name: "嘎啦嘎啦市集", latitude: 25.058436, longitude: 121.530453, tags: ["文創", "美食", "寵物", "台北"], location: "台北中正", startDate: "2024/5/18", endDate: "2024/5/19", time: "13:00-21:00(週日至20:00)", mrt: "行天宮站", mrtline: "orange_line_color", score: 4.5, totalReview: 130, info: "春日的綠意、繽紛。\n隨著時日的推移，走入尾端的盛開滿溢。\n日光落下後的暖意依舊，在盞盞燈光中循線尋找小物。\n讓小物在人群之間發光，訴說自身的故事。", isFavorite: false)
//    ]
}





