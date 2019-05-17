internal class NewMovie: Movie {
  
  internal override func calculateAmount() -> Double {
    let thisAmount = initialAmount()
    if daysRented > 0 {
      return Double(daysRented) * 3
    }
    return thisAmount
  }
  
  override func calculateFrequentRenterPoints() -> Int {
    var frequentRenterPoints = 1
    
    if daysRented > 1 {
      frequentRenterPoints += 1
    }
    return frequentRenterPoints
  }
  
}
