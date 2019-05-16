internal class NewMovie: Movie {
  
  internal override func calculateAmount() -> Double {
    return Double(daysRented) * 3
  }
  
  override func calculateFrequentRenterPoints() -> Int {
    var frequentRenterPoints = 1
    
    if daysRented > 1 {
      frequentRenterPoints += 1
    }
    return frequentRenterPoints
  }
  
}
