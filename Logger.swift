import UIKit

func logger<T>(_ type: Logger, _ target: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    switch type {
    case .d:
        #if DEBUG
            type.s("\(target)", file, function, line)
        #else
        #endif
        break
    default:
        type.s("\(target)", file, function, line)
        break
    }
}

struct LogStream: TextOutputStream {
    let stdout = FileHandle.standardOutput
    let stderr = FileHandle.standardError
    
    mutating func write(_ string: String) {
        guard let data = string.data(using: .utf8) else {
            return
        }
        
        stdout.write(data)
    }
}

enum Logger: String{
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
    
    func s(_ target: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        var stream = LogStream()
        
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
        
        print("[\(dateFormatter.string(from:Date()))] \(self.emoji) \(self.rawValue)| \(fileString) > \(function): \(line)", to: &stream)
        print(target, to: &stream)
    }
}
