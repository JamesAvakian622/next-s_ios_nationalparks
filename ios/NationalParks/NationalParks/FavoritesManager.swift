import Foundation
import SwiftUI
import Combine

struct ParkUserData: Codable {
    var isFavorite: Bool
    var notes: String
}

class FavoritesManager: ObservableObject {
    @Published var userData: [String: ParkUserData] = [:] {
        didSet {
            save()
        }
    }
    
    private let saveKey = "ParkUserData"
    
    init() {
        load()
    }
    
    func toggleFavorite(parkId: String) {
        var data = userData[parkId] ?? ParkUserData(isFavorite: false, notes: "")
        data.isFavorite.toggle()
        userData[parkId] = data
    }
    
    func isFavorite(parkId: String) -> Bool {
        return userData[parkId]?.isFavorite ?? false
    }
    
    func getNotes(parkId: String) -> String {
        return userData[parkId]?.notes ?? ""
    }
    
    func saveNotes(parkId: String, notes: String) {
        var data = userData[parkId] ?? ParkUserData(isFavorite: false, notes: "")
        data.notes = notes
        userData[parkId] = data
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([String: ParkUserData].self, from: data) {
            userData = decoded
        }
    }
}
