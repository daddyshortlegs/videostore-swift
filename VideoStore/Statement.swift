public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  public func generate() -> String {
    var totalAmount: Double = 0
    var frequentRenterPoints: Int = 0
    
    var result = "Rental Record for \(customer.name)\n"
    
    for rental in customer.rentals {
      var thisAmount: Double = 0
      thisAmount += rental.movie.calculateAmount(rental)
      frequentRenterPoints += rental.movie.calculateFrequentRenterPoints(rental: rental)
      
      result += "\t\(rental.movie.title)\t\(thisAmount)\n"
      totalAmount += thisAmount
    }
    
    result += "You owed \(totalAmount)\n"
    result += "You earned \(frequentRenterPoints) frequent renter points\n"
    
    return result
  }

}
