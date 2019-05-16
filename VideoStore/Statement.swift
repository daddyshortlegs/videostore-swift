public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  public func generate() -> String {
    
    var result = generateHeader(customerName: customer.name)
    
    for rental in customer.rentals {
      result += "\t\(rental.title)\t\(rental.calculateAmount())\n"
    }

    var totalAmount: Double = 0
    for rental in customer.rentals {
      totalAmount += rental.calculateAmount()
    }

    var frequentRenterPoints: Int = 0
    for rental in customer.rentals {
      frequentRenterPoints += rental.calculateFrequentRenterPoints()
    }
    
    result += generateFooter(owedAmount: totalAmount, earnedPoints: frequentRenterPoints)
    
    return result
  }
  
  func generateHeader(customerName: String) -> String {
    return "Rental Record for \(customerName)\n"
  }
  
  func generateFooter(owedAmount: Double, earnedPoints: Int) -> String {
    return "You owed \(owedAmount)\nYou earned \(earnedPoints) frequent renter points\n"
  }
  

}
