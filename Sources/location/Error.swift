struct EncError: Encodable {
    let error: String

    init(_ error: String) {
        self.error = error
    }
}
