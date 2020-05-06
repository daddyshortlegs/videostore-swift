public class Movie {
    
    public var title: String
    public var daysRented: Int
    
    public init(title: String, daysRented: Int) {
      self.title = title;
      self.daysRented = daysRented
    }
  
    internal func calculateAmount() -> Double {
      var thisAmount = initialAmount()
      if (daysRented > daysOverdue()) {
        thisAmount += Double(daysRented - daysOverdue()) * rentalRate()
      }
      return thisAmount
    }
  
    func initialAmount() -> Double {
      return 0.0
    }
  
    func daysOverdue() -> Int {
      return 0
    }
  
    func rentalRate() -> Double {
      return 1.5
    }
  
    func calculateFrequentRenterPoints() -> Int {
      return 1
    }

}
