import Foundation

class LocalData {
    static let shared = LocalData()
    
    private init() {}
    
    func getModels<T: Codable>(fileName: String) -> [T] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            fatalError("\(fileName).json not found")
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let models = try JSONDecoder().decode([T].self, from: data)
            return models
        } catch {
            fatalError("Failed to decode \(fileName).json: \(error)")
        }
    }
}
