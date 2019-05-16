internal class RegularMovie: Movie {

  internal override func calculateAmount(_ rental: Rental) -> Double {
    var rentalCost: Double = 2;
    if (rental.daysRented > 2) {
      rentalCost += Double(rental.daysRented - 2) * 1.5
    }
    return rentalCost
  }
  
}
