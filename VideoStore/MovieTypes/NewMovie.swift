internal class NewMovie: Movie {
  
  internal override func calculateAmount() -> Double {
    let thisAmount = initialAmount()
    if daysRented > daysOverdue() {
      return Double(daysRented - daysOverdue()) * rentalRate()
    }
    return thisAmount
  }
  
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
