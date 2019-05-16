public class Movie {
    public static let CHILDRENS: Int = 2
    public static let REGULAR: Int = 0
    public static let NEW_RELEASE: Int = 1
    
    public var title: String
    public var priceCode: Int
    
    public init(title: String, priceCode: Int) {
        self.title = title;
        self.priceCode = priceCode;
    }

}
