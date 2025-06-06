import Foundation
import Translation

@available(macOS 15.0, *)
actor AsyncTextTranslator {
    private var session: TranslationSession?
    private let service = TranslationService()

    func configure(source: Locale.Language, target: Locale.Language) async throws {
        let configuration = TranslationSession.Configuration(source: source, target: target)
        session = try await TranslationSession(configuration: configuration)
    }

    func translate(_ text: String) async -> String {
        do {
            return try await service.translate(session: session, text: text)
        } catch {
            print(error)
            return text
        }
    }
}
