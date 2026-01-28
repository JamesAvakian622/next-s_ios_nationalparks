import SwiftUI
import StoreKit

struct AboutView: View {
    @EnvironmentObject var storeManager: StoreManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Image(systemName: "leaf.circle.fill") // Placeholder for app icon or logo
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundStyle(.green)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)
                    
                    Text("About National Parks")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Welcome to the National Parks Explorer app. Our mission is to help you discover the natural beauty of the United States' 63 National Parks.")
                        .font(.body)
                    
                    
                    // Premium Access Section
                    VStack(spacing: 16) {
                        Text("Premium Access")
                            .font(.title2)
                            .bold()
                        
                        if storeManager.isPremium {
                            HStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.green)
                                Text("You are a Premium Member!")
                                    .foregroundColor(.green)
                                    .bold()
                            }
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(12)
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                FeatureRow(icon: "note.text", text: "Unlimited Trip Notes")
                                FeatureRow(icon: "map.fill", text: "Offline Maps (Coming Soon)")
                                FeatureRow(icon: "star.fill", text: "Support Development")
                            }
                            .padding()
                            
                            if !storeManager.products.isEmpty {
                                ForEach(storeManager.products) { product in
                                    Button(action: {
                                        Task {
                                            try? await storeManager.purchase(product)
                                        }
                                    }) {
                                        VStack {
                                            Text(product.displayName)
                                                .font(.headline)
                                            Text(product.displayPrice)
                                                .font(.subheadline)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    }
                                }
                            } else {
                                ProgressView()
                            }
                            
                            Button("Restore Purchases") {
                                Task {
                                    await storeManager.restorePurchases()
                                }
                            }
                            .font(.footnote)
                            .padding(.top)
                        }
                    }
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(16)
                    
                    Text("Features")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("• Interactive Map: Explore parks across the country.\n• Park Details: Get in-depth information on park highlights, directions, and costs.\n• State-by-State Directory: Easily find parks in your favorite states.")
                        .font(.body)
                    
                    Spacer()
                    
                    Text("© 2026 Optical Automation, LLC. All rights reserved.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
            }
            .navigationTitle("About Us")
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
                .foregroundColor(.blue)
            Text(text)
        }
    }
}
