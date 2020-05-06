internal class NewMovie: Movie {
  
  override func rentalRate() -> Double {
    return 3
  }
  
  override func calculateFrequentRenterPoints() -> Int {
    return daysRented > 1 ? 2 : 1
  }
  
}
