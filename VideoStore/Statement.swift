public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  func calculateFrequentRenterPoints(rental: Rental) -> Int {
    var frequentRenterPoints = 1
    
    if rental.movie.priceCode == Movie.NEW_RELEASE
      && rental.daysRented > 1 {
      frequentRenterPoints += 1
    }
    return frequentRenterPoints
  }
  
  public func generate() -> String {
    var totalAmount: Double = 0
    var frequentRenterPoints: Int = 0
    
    var result = "Rental Record for \(customer.name)\n"
    
    for rental in customer.rentals {
      var thisAmount: Double = 0
      thisAmount += rental.movie.calculateAmount(rental)
      frequentRenterPoints += calculateFrequentRenterPoints(rental: rental)
      
      result += "\t\(rental.movie.title)\t\(thisAmount)\n"
      totalAmount += thisAmount
    }
    
    result += "You owed \(totalAmount)\n"
    result += "You earned \(frequentRenterPoints) frequent renter points\n"
    
    return result
  }

}
