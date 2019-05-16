public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  public func generate() -> String {
    return generateHeader(customerName: customer.name) +
      generateBody() +
      generateFooter()
  }
  
  func generateHeader(customerName: String) -> String {
    return "Rental Record for \(customerName)\n"
  }
  
  func generateBody() -> String {
    return customer.rentals.reduce("") { $0 + generateLine($1) }
  }
  
  func generateLine(_ rental: Movie) -> String {
    return "\t\(rental.title)\t\(rental.calculateAmount())\n"
  }
  
  func generateFooter() -> String {
    return "You owed \(calculateTotal())\nYou earned \(calculateFrequentRenterPoints()) frequent renter points\n"
  }
  
  func calculateTotal() -> Double {
    return customer.rentals.reduce(0) { $0 + $1.calculateAmount()}
  }
  
  func calculateFrequentRenterPoints() -> Int {
    return customer.rentals.reduce(0) { $0 + $1.calculateFrequentRenterPoints()}
  }

}
