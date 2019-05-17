public class Movie {
    
    public var title: String
    public var daysRented: Int
  
    public init(title: String, daysRented: Int) {
      self.title = title;
      self.daysRented = daysRented
    }
  
    func initialAmount() -> Double {
      return 0.0
    }
  
    func daysOverdue() -> Int {
      return 0
    }
  
    internal func calculateAmount() -> Double {
      return 0.0
    }
  
    func calculateFrequentRenterPoints() -> Int {
      return 1
    }

}
