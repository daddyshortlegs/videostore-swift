internal class RegularMovie: Movie {

  internal override func calculateAmount() -> Double {
    var rentalCost: Double = 2;
    if daysRented > 2 {
      rentalCost += Double(daysRented - 2) * 1.5
    }
    return rentalCost
  }
  
}
