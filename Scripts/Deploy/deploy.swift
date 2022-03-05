import Foundation

@main
enum Deploy {
    
    static func main() {
                
        let sourceDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Dependencies/src/css")
        
        let distributionFile = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Dependencies/dist/all.css")
        
        var contents: String = ""
        
        if let enumerator = FileManager.default.enumerator(at: sourceDirectory, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                                        
                    if let content = try? String(contentsOf: path, encoding: .utf8) {
                        
                        contents += content + "\n"
                    }
                }
            }
        }
        
        do {
            
            try contents.write(to: distributionFile, atomically: true, encoding: .utf8)
            
        } catch(let error) {
            
            print("error:", error)
        }
    }
}
