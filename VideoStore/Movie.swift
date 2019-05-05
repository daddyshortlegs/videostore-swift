public class Movie {
    public static let CHILDRENS: Int = 2
    public static let REGULAR: Int = 0
    public static let NEW_RELEASE: Int = 1
    
    private var title: String
    private var priceCode: Int
    
    public init(title: String, priceCode: Int) {
        self.title = title;
        self.priceCode = priceCode;
    }
    
    public func getPriceCode() -> Int {
        return priceCode;
    }
    
    public func setPriceCode(code: Int) {
        priceCode = code;
    }
    
    public func getTitle() -> String {
        return title;
    }

}
