import Foundation
import Translation

@available(macOS 15.0, *)
actor AsyncTextTranslator {
    private var session: TranslationSession?
    private let service = TranslationService()

    /// Updates the translation session obtained from `translationTask` or elsewhere.
    func update(session: TranslationSession?) {
        self.session = session
    }

    /// Asynchronously translates the given text.
    func translate(_ text: String) async -> String {
        do {
            return try await service.translate(session: session, text: text)
        } catch {
            print(error)
            return text
        }
    }
}
