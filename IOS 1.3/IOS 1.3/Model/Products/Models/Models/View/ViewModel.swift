import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading && viewModel.products.isEmpty {
                ProgressView()
            } else if let errorDescription = viewModel.errorDescription {
                Text(errorDescription)
            } else {
                if viewModel.products.isEmpty {
                    Text("No characters available")
                } else {
                    List(viewModel.products) { character in
                        HStack(spacing: 12) {
                            AsyncImage(url: character.image) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        
                                }
                                else {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 120, height: 120)
                                }
                            }
                            
                            VStack(alignment: .leading){
                                Text("\(character.name)")
                                    .font(.headline)
                                Text("\(character.status)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                                Text("Gender: \(character.gender)")
                                    .font(.caption)
                                Text("Species: \(character.species)")
                                    .font(.caption)
                                    
                                    
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchCharacter()
        }
    }
}

#Preview {
    ProductsView()
}
