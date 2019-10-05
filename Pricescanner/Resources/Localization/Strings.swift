import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
    /// Главная
    internal static let mainFirstTabKey = L10n.tr("Localizable", "main_first_tab_key")
    /// На главную
    internal static let mainScreen = L10n.tr("Localizable", "main_screen")
    /// Занадния
    internal static let mainSecondTabKey = L10n.tr("Localizable", "main_second_tab_key")
    /// Товары
    internal static let mainThirdTabKey = L10n.tr("Localizable", "main_third_tab_key")
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
