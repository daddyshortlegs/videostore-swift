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

    result += generateFooter()
    
    return result
  }
  
  func generateHeader(customerName: String) -> String {
    return "Rental Record for \(customerName)\n"
  }
  
  func generateFooter() -> String {
    return "You owed \(calculateTotal())\nYou earned \(calculateFrequentRenterPoints()) frequent renter points\n"
  }
  
  func calculateTotal() -> Double {
    var totalAmount: Double = 0
    for rental in customer.rentals {
      totalAmount += rental.calculateAmount()
    }
    return totalAmount
  }
  
  func calculateFrequentRenterPoints() -> Int {
    var frequentRenterPoints: Int = 0
    for rental in customer.rentals {
      frequentRenterPoints += rental.calculateFrequentRenterPoints()
    }
    return frequentRenterPoints
  }

}
