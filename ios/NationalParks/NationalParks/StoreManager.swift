import Foundation
import StoreKit
import Combine

@MainActor
class StoreManager: ObservableObject {
    @Published var isPremium: Bool = false
    @Published var products: [Product] = []
    
    private let productIds = [
        "com.opticalautomation.nationalparks.premium.monthly",
        "com.opticalautomation.nationalparks.premium.annual"
    ]
    
    init() {
        Task {
            await updatePurchasedProducts()
            await fetchProducts()
        }
    }
    
    func fetchProducts() async {
        do {
            let products = try await Product.products(for: productIds)
            self.products = products
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }
    
    func purchase(_ product: Product) async throws {
        let result = try await product.purchase()
        
        switch result {
        case .success(let verification):
            switch verification {
            case .verified(let transaction):
                await transaction.finish()
                await updatePurchasedProducts()
            case .unverified:
                print("Transaction unverified")
            }
        case .userCancelled:
            break
        case .pending:
            break
        @unknown default:
            break
        }
    }
    
    func restorePurchases() async {
        // App Store sync happens automatically, just update state
        await updatePurchasedProducts()
    }
    
    private func updatePurchasedProducts() async {
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else {
                continue
            }
            
            if ["com.opticalautomation.nationalparks.premium.monthly", "com.opticalautomation.nationalparks.premium.annual"].contains(transaction.productID) {
                isPremium = true
                return
            }
        }
        isPremium = false
    }
}
