internal class ChildrensMovie: Movie {
  
  override init(title: String, priceCode: Int) {
    super.init(title: title, priceCode: Movie.CHILDRENS)
  }
  
  internal override func calculateAmount(_ rental: Rental) -> Double {
    var thisAmount = 1.5
    if (rental.daysRented > 3) {
      thisAmount += Double(rental.daysRented - 3) * 1.5
    }
    return thisAmount
  }
}
