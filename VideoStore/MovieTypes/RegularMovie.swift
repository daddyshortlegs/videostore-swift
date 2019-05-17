internal class RegularMovie: Movie {

  internal override func calculateAmount() -> Double {
    var thisAmount: Double = 2;
    if daysRented > 2 {
      thisAmount += Double(daysRented - 2) * 1.5
    }
    return thisAmount
  }
  
}
