internal class RegularMovie: Movie {
  
  override init(title: String, priceCode: Int) {
    super.init(title: title, priceCode: Movie.REGULAR)
  }

  internal override func calculateAmount(_ rental: Rental) -> Double {
    var rentalCost: Double = 2;
    if (rental.daysRented > 2) {
      rentalCost += Double(rental.daysRented - 2) * 1.5
    }
    return rentalCost
  }
  
}
