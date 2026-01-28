import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var storeManager = StoreManager()
    
    var body: some View {
        TabView {
            MapView()
                .environmentObject(favoritesManager)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            ParkListView()
                .environmentObject(favoritesManager)
                .tabItem {
                    Label("Parks", systemImage: "list.bullet")
                }
            
            FavoritesView()
                .environmentObject(favoritesManager)
                .tabItem {
                    Label("My Trips", systemImage: "suit.heart")
                }
            
            AboutView()
                .environmentObject(storeManager)
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
