import SwiftUI
import MapKit

struct ParkDetailView: View {
    let park: Park
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var notes: String = ""
    @State private var showingNotes = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Image Header with Favorites Button
                ZStack(alignment: .bottomTrailing) {
                    if let imageUrl = park.images.first, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .clipped()
                        } placeholder: {
                            Rectangle()
                                .fill(Color(uiColor: .secondarySystemBackground))
                                .frame(height: 300)
                                .overlay(ProgressView())
                        }
                    } else {
                         Rectangle()
                            .fill(Color.green.opacity(0.3))
                            .frame(height: 300)
                            .overlay(
                                Image(systemName: "leaf.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .foregroundStyle(.white)
                            )
                    }
                    
                    Button(action: {
                        favoritesManager.toggleFavorite(parkId: park.id)
                    }) {
                        Image(systemName: favoritesManager.isFavorite(parkId: park.id) ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.5)))
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    // Notes Section (only if favorite)
                    if favoritesManager.isFavorite(parkId: park.id) {
                        VStack(alignment: .leading) {
                            HStack {
                                Label("My Trip Notes", systemImage: "note.text")
                                    .font(.headline)
                                Spacer()
                                Button("Edit") {
                                    notes = favoritesManager.getNotes(parkId: park.id)
                                    showingNotes = true
                                }
                            }
                            
                            let savedNotes = favoritesManager.getNotes(parkId: park.id)
                            if !savedNotes.isEmpty {
                                Text(savedNotes)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(8)
                            } else {
                                Text("No notes yet. Tap Edit to add specific details related to your trip!")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical)
                        .sheet(isPresented: $showingNotes) {
                            NavigationView {
                                TextEditor(text: $notes)
                                    .padding()
                                    .navigationTitle("Edit Notes")
                                    .navigationBarItems(
                                        leading: Button("Cancel") {
                                            showingNotes = false
                                        },
                                        trailing: Button("Save") {
                                            favoritesManager.saveNotes(parkId: park.id, notes: notes)
                                            showingNotes = false
                                        }
                                    )
                            }
                        }
                        
                        Divider()
                    }
                    
                    Text(park.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    if let description = park.description {
                        Text(description)
                            .font(.body)
                    } else {
                        Text("Explore this beautiful national park in \(park.state).")
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    
                    if let highlights = park.highlights {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Highlights")
                                .font(.headline)
                            ForEach(highlights, id: \.self) { highlight in
                                HStack(alignment: .top) {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .font(.caption)
                                        .padding(.top, 2)
                                    Text(highlight)
                                }
                            }
                        }
                    }
                    
                    if let directions = park.directions {
                         VStack(alignment: .leading, spacing: 8) {
                            Text("Getting There")
                                .font(.headline)
                            Text(directions)
                                .font(.subheadline)
                        }
                    }
                    
                    if let cost = park.entryCost {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Entrance Fees")
                                .font(.headline)
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text("Vehicle").frame(width: 100, alignment: .leading)
                                    Text(cost.vehicle)
                                }
                                HStack {
                                    Text("Individual").frame(width: 100, alignment: .leading)
                                    Text(cost.individual)
                                }
                                HStack {
                                    Text("Annual Pass").frame(width: 100, alignment: .leading)
                                    Text(cost.annual)
                                }
                            }
                            .font(.subheadline)
                        }
                    }
                    
                    if let coordinates = park.coordinates {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Location")
                                .font(.headline)
                            
                            Map(coordinateRegion: .constant(MKCoordinateRegion(
                                center: coordinates,
                                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                            )), annotationItems: [park]) { location in
                                MapMarker(coordinate: location.coordinates ?? coordinates)
                            }
                            .frame(height: 200)
                            .cornerRadius(12)
                        }
                    }
                    
                    if let lodging = park.lodging {
                         VStack(alignment: .leading, spacing: 12) {
                            Text("Where to Stay")
                                .font(.headline)
                            ForEach(lodging, id: \.self) { place in
                                VStack(alignment: .leading) {
                                    Text(place.name)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(place.description)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    Text(place.price)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(park.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
