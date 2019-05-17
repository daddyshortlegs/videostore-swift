internal class NewMovie: Movie {
  
  override func rentalRate() -> Double {
    return 3
  }
  
  override func calculateFrequentRenterPoints() -> Int {
    var frequentRenterPoints = 1
    
    if daysRented > 1 {
      frequentRenterPoints += 1
    }
    return frequentRenterPoints
  }
  
}
