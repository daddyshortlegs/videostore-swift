internal class RegularMovie: Movie {
  
  override func initialAmount() -> Double {
    return 2.0
  }
  
  override func daysOverdue() -> Int {
    return 2
  }

  internal override func calculateAmount() -> Double {
    var thisAmount = initialAmount()
    if daysRented > daysOverdue() {
      thisAmount += Double(daysRented - daysOverdue()) * 1.5
    }
    return thisAmount
  }
  
}
