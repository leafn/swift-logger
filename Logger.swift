enum Log: String{
    case d = "debug  "
    case e = "error  "
    case i = "info   "
    case v = "verbose"
    case w = "warning"
    case f = "fatal  "
    case n = "       "
    
    enum options {
        case file
        case line
        case column
        case function
    }
    
    var emoji: String {
        switch self {
        case .d:
            return "💬"
        case .e:
            return "‼️"
        case .i:
            return "ℹ️"
        case .v:
            return "🔬"
        case .w:
            return "⚠️"
        case .f:
            return "🔥"
        case .n:
            return ""
        }
    }
    
    func p(_ string : String) {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            return formatter
        }()
        
        print("[\(dateFormatter.string(from:Date()))] \(self.emoji) \(self.rawValue)| \(string)")
    }
    
    func p_option() {
        
    }
    
    func p_adv() {
        // 만드는 중...
    }
}
