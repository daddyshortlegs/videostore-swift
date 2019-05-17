internal class RegularMovie: Movie {
  
  override func initialAmount() -> Double {
    return 2.0
  }

  internal override func calculateAmount() -> Double {
    var thisAmount = initialAmount()
    if daysRented > 2 {
      thisAmount += Double(daysRented - 2) * 1.5
    }
    return thisAmount
  }
  
}
