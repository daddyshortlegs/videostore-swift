internal class ChildrensMovie: Movie {
  
  override func initialAmount() -> Double {
    return 1.5
  }
  
  override func daysOverdue() -> Int {
    return 3
  }
  
  internal override func calculateAmount() -> Double {
    var thisAmount = initialAmount()
    if (daysRented > daysOverdue()) {
      thisAmount += Double(daysRented - daysOverdue()) * rentalRate()
    }
    return thisAmount
  }
}
