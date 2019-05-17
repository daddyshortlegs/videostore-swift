internal class ChildrensMovie: Movie {
  
  override func initialAmount() -> Double {
    return 1.5
  }
  
  internal override func calculateAmount() -> Double {
    var thisAmount = initialAmount()
    if (daysRented > 3) {
      thisAmount += Double(daysRented - 3) * 1.5
    }
    return thisAmount
  }
}
