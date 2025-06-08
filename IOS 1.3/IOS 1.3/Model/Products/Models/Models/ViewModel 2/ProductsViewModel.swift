import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var products: [Character] = []
    @Published var errorDescription: String?

    private let productsService = ProductsService()
    private var nextPageURL: URL?
    private var isLastPage = false

    func fetchCharacter() async {
        guard !isLoading && !isLastPage else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            let charactersPage: CharactersPage
            if let url = nextPageURL {
                charactersPage = try await productsService.getCharacters(url: url)
            } else {
                charactersPage = try await productsService.getCharacters()
            }

            products.append(contentsOf: charactersPage.results)
            nextPageURL = charactersPage.info.next
            isLastPage = nextPageURL == nil
        } catch {
            errorDescription = error.localizedDescription
        }
    }
}
