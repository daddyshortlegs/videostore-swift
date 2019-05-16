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
      thisAmount += rental.calculateAmount()
      frequentRenterPoints += rental.calculateFrequentRenterPoints()
      
      result += "\t\(rental.title)\t\(thisAmount)\n"
      totalAmount += thisAmount
    }
    
    result += generateFooter(owedAmount: totalAmount, earnedPoints: frequentRenterPoints)
    
    return result
  }
  
  func generateFooter(owedAmount: Double, earnedPoints: Int) -> String {
    return "You owed \(owedAmount)\nYou earned \(earnedPoints) frequent renter points\n"
  }
  

}
