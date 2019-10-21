import Foundation
import Yosemite

/// Converts the input product model to properties ready to be shown on `ProductsTabProductTableViewCell`.
struct ProductsTabProductViewModel {
    let imageUrl: String?
    let name: String
    let detailsAttributedString: NSAttributedString

    init(product: Product) {
        imageUrl = product.images.first?.src
        name = product.name
        detailsAttributedString = product.createDetailsAttributedString()
    }
}

extension Product {
    fileprivate func createDetailsAttributedString() -> NSAttributedString {
        let statusText = createStatusText()
        let stockText = createStockText()
        let variationsText = createVariationsText()

        let detailsText = [statusText, stockText, variationsText]
            .compactMap({ $0 })
            .joined(separator: " • ")

        let attributedString = NSMutableAttributedString(
            string: detailsText,
            attributes: [
                .foregroundColor: StyleManager.wooGreyMid,
                .font: StyleManager.footerLabelFont,
            ])
        if let statusText = statusText {
            attributedString.addAttributes(
                [.foregroundColor: StyleManager.highlightTextColor],
                range: NSRange(location: 0, length: statusText.count))
        }
        return attributedString
    }

    fileprivate func createStatusText() -> String? {
        switch productStatus {
        case .pending, .draft:
            return productStatus.description
        default:
            return nil
        }
    }

    fileprivate func createStockText() -> String? {
        switch productStockStatus {
        case .inStock:
            if let stockQuantity = stockQuantity {
                let format = NSLocalizedString("%ld in stock", comment: "Label about product's inventory stock status shown on Products tab")
                return String.localizedStringWithFormat(format, stockQuantity)
            } else {
                return NSLocalizedString("In stock", comment: "Label about product's inventory stock status shown on Products tab")
            }
        default:
            return productStockStatus.description
        }
    }

    fileprivate func createVariationsText() -> String? {
        guard !variations.isEmpty else {
            return nil
        }
        let numberOfVariations = variations.count
        let singularFormat = NSLocalizedString("%ld variant", comment: "Label about one product variation shown on Products tab")
        let pluralFormat = NSLocalizedString("%ld variants", comment: "Label about number of variations shown on Products tab")
        let format = String.pluralize(numberOfVariations, singular: singularFormat, plural: pluralFormat)
        return String.localizedStringWithFormat(format, numberOfVariations)
    }
}
