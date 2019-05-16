public class Movie {
    
    public var title: String
  
    public init(title: String) {
        self.title = title;
    }
  
    internal func calculateAmount(_ rental: Rental) -> Double {
      return 0.0
    }
  
    func calculateFrequentRenterPoints(rental: Rental) -> Int {
      return 1
    }

}
