import Foundation


/// Represents a Product Entity.
///
public struct Product: Decodable {
    public let productID: Int
    public let name: String
    public let slug: String
    public let permalink: String

    public let dateCreated: Date       // gmt
    public let dateModified: Date?     // gmt

    public let productTypeKey: String
    public let statusKey: String
    public let featured: Bool
    public let catalogVisibilityKey: String // convert to enum ProductVisibility?

    public let description: String?
    public let shortDescription: String?
    public let sku: String?

    public let price: String
    public let regularPrice: String?
    public let salePrice: String?
    public let dateOnSaleFrom: Date?   // gmt
    public let dateOnSaleTo: Date?     // gmt
    public let priceHTML: String?
    public let onSale: Bool

    public let purchasable: Bool
    public let totalSales: Int
    public let virtual: Bool

    public let downloadable: Bool
    public let downloads: [ProductDownload?]
    public let downloadLimit: Int     // defaults to -1
    public let downloadExpiry: Int    // defaults to -1

    public let externalURL: String?
    public let buttonText: String?

    public let taxStatusKey: String   // convert to enum? ProductTaxStatus
    public let taxClass: String?

    public let manageStock: Bool
    public let stockQuantity: Int?   // API reports Int or null
    public let stockStatusKey: String   // convert to enum ProductStockStatus?
    public let backordersKey: String    // convert to enum ProductBackOrders?
    public let backordersAllowed: Bool
    public let backordered: Bool

    public let soldIndividually: Bool
    public let weight: String?
    public let dimensions: Dimensions // struct

    public let shippingRequired: Bool
    public let shippingTaxable: Bool
    public let shippingClass: String?
    public let shippingClassID: Int

    public let reviewsAllowed: Bool
    public let averageRating: String
    public let ratingCount: Int

    public let relatedIDs: [Int?]
    public let upsellIDs: [Int?]
    public let crossSellIDs: [Int?]
    public let parentID: Int

    public let purchaseNote: String?
    public let categories: [String: Any?]
    public let tags: [String: Any?]
    public let images: [String: Any?]
    public let attributes: [String: Any?]
    public let defaultAttributes: [String: Any?]
    public let variations: [Int?]
    public let groupedProducts: [Int?]

    public let menuOrder: Int
    public let metaData: [String: Any?]

    /// Computed Properties
    ///
    public var productType: ProductType {
        return ProductType(rawValue: productTypeKey)
    }

    public var status: ProductStatus {
        return ProductStatus(rawValue: statusKey)
    }

    /// Product struct initializer.
    ///
    public init(productID: Int,
                name: String,
                slug: String,
                permalink: String,
                dateCreated: Date,      // gmt
                dateModified: Date?,    // gmt
                productTypeKey: String,
                statusKey: String,
                featured: Bool,
                catalogVisibilityKey: String,
                description: String?,
                shortDescription: String?,
                sku: String?,
                price: String,
                regularPrice: String?,
                salePrice: String?,
                dateOnSaleFrom: Date?,  // gmt
                dateOnSaleTo: Date?,    // gmt
                priceHTML: String?,
                onSale: Bool,
                purchasable: Bool,
                totalSales: Int,
                virtual: Bool,
                downloadable: Bool,
                downloads: [ProductDownload?],
                downloadLimit: Int,    // defaults to -1
                downloadExpiry: Int,   // defaults to -1
                externalURL: String?,
                buttonText: String?,
                taxStatusKey: String,
                taxClass: String?,
                manageStock: Bool,
                stockQuantity: Int?,  // API reports Int or null
                stockStatusKey: String,
                backordersKey: String,
                backordersAllowed: Bool,
                backordered: Bool,
                soldIndividually: Bool,
                weight: String?,
                dimensions: Dimensions, // struct
                shippingRequired: Bool,
                shippingTaxable: Bool,
                shippingClass: String?,
                shippingClassID: Int,
                reviewsAllowed: Bool,
                averageRating: String,
                ratingCount: Int,
                relatedIDs: [Int?],
                upsellIDs: [Int?],
                crossSellIDs: [Int?],
                parentID: Int,
                purchaseNote: String?,
                categories: [String: Any?],
                tags: [String: Any?],
                images: [String: Any?],
                attributes: [String: Any?],
                defaultAttributes: [String: Any?],
                variations: [Int?],
                groupedProducts: [Int?],
                menuOrder: Int,
                metaData: [String: Any?]) {
        self.productID = productID
        self.name = name
        self.slug = slug
        self.permalink = permalink
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.productTypeKey = productTypeKey
        self.statusKey = statusKey
        self.featured = featured
        self.catalogVisibilityKey = catalogVisibilityKey
        self.description = description
        self.shortDescription = shortDescription
        self.sku = sku
        self.price = price
        self.regularPrice = regularPrice
        self.salePrice = salePrice
        self.dateOnSaleFrom = dateOnSaleFrom
        self.dateOnSaleTo = dateOnSaleTo
        self.priceHTML = priceHTML
        self.onSale = onSale
        self.purchasable = purchasable
        self.totalSales = totalSales
        self.virtual = virtual
        self.downloadable = downloadable
        self.downloads = downloads
        self.downloadLimit = downloadLimit
        self.downloadExpiry = downloadExpiry
        self.externalURL = externalURL
        self.buttonText = buttonText
        self.taxStatusKey = taxStatusKey
        self.taxClass = taxClass
        self.manageStock = manageStock
        self.stockQuantity = stockQuantity
        self.stockStatusKey = stockStatusKey
        self.backordersKey = backordersKey
        self.backordersAllowed = backordersAllowed
        self.backordered = backordered
        self.soldIndividually = soldIndividually
        self.weight = weight
        self.dimensions = dimensions
        self.shippingRequired = shippingRequired
        self.shippingTaxable = shippingTaxable
        self.shippingClass = shippingClass
        self.shippingClassID = shippingClassID
        self.reviewsAllowed = reviewsAllowed
        self.averageRating = averageRating
        self.ratingCount = ratingCount
        self.relatedIDs = relatedIDs
        self.upsellIDs = upsellIDs
        self.crossSellIDs = crossSellIDs
        self.parentID = parentID
        self.purchaseNote = purchaseNote
        self.categories = categories
        self.tags = tags
        self.images = images
        self.attributes = attributes
        self.defaultAttributes = defaultAttributes
        self.variations = variations
        self.groupedProducts = groupedProducts
        self.menuOrder = menuOrder
        self.metaData = metaData
    }

    /// The public initializer for Product.
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let productID = try container.decode(Int.self, forKey: .productID)
        let name = try container.decode(String.self, forKey: .name)
        let slug = try container.decode(String.self, forKey: .slug)
        let permalink = try container.decode(String.self, forKey: .permalink)
        let dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated) ?? Date()
        let dateModified = try container.decodeIfPresent(Date.self, forKey: .dateModified) ?? Date()
        let productTypeKey = try container.decode(String.self, forKey: .productTypeKey)
        let statusKey = try container.decode(String.self, forKey: .statusKey)
        let featured = try container.decode(Bool.self, forKey: .featured)
        let catalogVisibilityKey = try container.decode(String.self, forKey: .catalogVisibilityKey)
        let description = try container.decode(String.self, forKey: .description)
        let shortDescription = try container.decode(String.self, forKey: .shortDescription)
        let sku = try container.decode(String.self, forKey: .sku)
        let price = try container.decode(String.self, forKey: .price)
        let regularPrice = try container.decode(String.self, forKey: .regularPrice)
        let salePrice = try container.decode(String.self, forKey: .salePrice)
        let dateOnSaleFrom = try container.decode(Date.self, forKey: .dateOnSaleFrom) ?? Date()
        let dateOnSaleTo = try container.decode(Date.self, forKey: .dateOnSaleTo) ?? Date()
        let priceHTML = try container.decode(String.self, forKey: .priceHTML)
        let onSale = try container.decode(Bool.self, forKey: .onSale)
        let purchasable = try container.decode(Bool.self, forKey: .purchasable)
        let totalSales = try container.decode(Int.self, forKey: .totalSales)
        let virtual = try container.decode(Bool.self, forKey: .virtual)
        let downloadable = try container.decode(Bool.self, forKey: .downloadable)
        let downloads = try container.decode([ProductDownload].self, forKey: .downloads)
        let downloadLimit = try container.decode(Int.self, forKey: .downloadLimit)
        let downloadExpiry = try container.decode(Int.self, forKey: .downloadExpiry)
        let externalURL = try container.decode(String.self, forKey: .externalURL)
        let buttonText = try container.decode(String.self, forKey: .buttonText)
        let taxStatusKey = try container.decode(String.self, forKey: .taxStatusKey)
        let taxClass = try container.decode(String.self, forKey: .taxClass)
        let manageStock = try container.decode(Bool.self, forKey: .manageStock)
        let stockQuantity = try container.decode(Int.self, forKey: .stockQuantity)
        let stockStatusKey = try container.decode(String.self, forKey: .stockStatusKey)
        let backordersKey = try container.decode(String.self, forKey: .backordersKey)
        let backordersAllowed = try container.decode(Bool.self, forKey: .backordersAllowed)
        let backordered = try container.decode(Bool.self, forKey: .backordered)
        let soldIndividuallly = try container.decode(Bool.self, forKey: .soldIndividually)
        let weight = try container.decode(String.self, forKey: .weight)
        let dimensions = try container.decode(Dimensions.self, forKey: .dimensions)
        let shippingRequired = try container.decode(Bool.self, forKey: .shippingRequired)
        let shippingTaxable = try container.decode(Bool.self, forKey: .shippingTaxable)
        let shippingClass = try container.decode(String.self, forKey: .shippingClass)
        let shippingClassID = try container.decode(Int.self, forKey: .shippingClassID)
        let reviewsAllowed = try container.decode(Bool.self, forKey: .reviewsAllowed)
        let averageRating = try container.decode(String.self, forKey: .averageRating)
        let ratingCount = try container.decode(Int.self, forKey: .ratingCount)
        let relatedIDs = try container.decodeIfPresent([Int].self, forKey: .relatedIDs)
        let upsellIDs = try container.decodeIfPresent([Int].self, forKey: .upsellIDs)
        let crossSellIDs = try container.decodeIfPresent([Int].self, forKey: .crossSellIDs)
        let parentID = try container.decode(Int.self, forKey: .parentID)
        let purchaseNote = try container.decodeIfPresent(String.self, forKey: .purchaseNote)
//        let categories: [Dictionary<String, Any>] = try container.decode([Dictionary<String, Any>].self, forKey: .categories)
//        let tags: [String: Any] = try container.decodeIfPresent([String: Any].self, forKey: .tags)
//        let images: [String: Any] = try container.decode([String: Any?].self, forKey: .images)
    }
}


/// Defines all of the Product CodingKeys
///
private extension Product {

    enum CodingKeys: String, CodingKey {
        case productID = "id"
        case name
        case slug
        case permalink
        case dateCreated = "date_created_gmt"
        case dateModified = "date_modified_gmt"
        case productTypeKey = "type"
        case statusKey = "status"
        case featured
        case catalogVisibilityKey = "catalog_visibility"
        case description
        case shortDescription = "short_description"
        case sku
        case price
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case dateOnSaleFrom = "date_on_sale_from_gmt"
        case dateOnSaleTo = "date_on_sale_to_gmt"
        case priceHTML = "price_html"
        case onSale = "on_sale"
        case purchasable
        case totalSales = "total_sales"
        case virtual
        case downloadable
        case downloads
        case downloadLimit = "download_limit"
        case downloadExpiry = "download_expiry"
        case externalURL = "external_url"
        case buttonText = "button_text"
        case taxStatusKey = "tax_status"
        case taxClass = "tax_class"
        case manageStock = "manage_stock"
        case stockQuantity = "stock_quantity"
        case stockStatusKey = "stock_status"
        case backordersKey = "backorders"
        case backordersAllowed = "backorders_allowed"
        case backordered
        case soldIndividually = "sold_individually"
        case weight
        case dimensions
        case shippingRequired = "shipping_required"
        case shippingTaxable = "shipping_taxable"
        case shippingClass = "shipping_class"
        case shippingClassID = "shipping_class_id"
        case reviewsAllowed = "reviews_allowed"
        case averageRating = "average_rating"
        case ratingCount = "rating_count"
        case relatedIDs = "related_ids"
        case upsellIDs = "upsell_ids"
        case crossSellIDs = "cross_sell_ids"
        case parentID = "parent_id"
        case purchaseNote = "purchase_note"
        case categories
        case tags
        case images
        case attributes
        case defaultAttributes = "default_attributes"
        case variations
        case groupedProducts = "grouped_products"
        case menuOrder = "menu_order"
        case metaData = "meta_data"
    }
}
