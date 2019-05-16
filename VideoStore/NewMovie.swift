internal class NewMovie: Movie {
  
  internal override func calculateAmount(_ rental: Rental) -> Double {
    return Double(rental.daysRented) * 3
  }
  
}
