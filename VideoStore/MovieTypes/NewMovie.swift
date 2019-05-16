internal class NewMovie: Movie {
  
  init(title: String) {
    super.init(title: title, priceCode: Movie.NEW_RELEASE)
  }
  
  internal override func calculateAmount(_ rental: Rental) -> Double {
    return Double(rental.daysRented) * 3
  }
  
  override func calculateFrequentRenterPoints(rental: Rental) -> Int {
    var frequentRenterPoints = 1
    
    if rental.daysRented > 1 {
      frequentRenterPoints += 1
    }
    return frequentRenterPoints
  }
  
}
