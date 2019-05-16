internal class ChildrensMovie: Movie {
  
  internal override func calculateAmount() -> Double {
    var thisAmount = 1.5
    if (daysRented > 3) {
      thisAmount += Double(daysRented - 3) * 1.5
    }
    return thisAmount
  }
}
