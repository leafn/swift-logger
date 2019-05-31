import UIKit

func log(_ type: Log, _ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        type.s(message, file, function, line)
    #else
    #endif
}

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
        
        //NSLog(string)
    }
    
    func s(_ string: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            return formatter
        }()
        
        var fileString: String
        let components = file.components(separatedBy: "/")
        if components.count > 0 {
            fileString = components.last!
        } else {
            fileString = file
        }
        
        print("[\(dateFormatter.string(from:Date()))] \(self.emoji) \(self.rawValue)| \(fileString) > \(function): \(line)")
        print(string)
    }
}
