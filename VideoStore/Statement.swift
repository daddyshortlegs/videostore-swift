public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  fileprivate func calculateAmount(_ rental: Rental) -> Double {
    var rentalCost: Double = 2;
    if (rental.daysRented > 2) {
      rentalCost += Double(rental.daysRented - 2) * 1.5
    }
    return rentalCost
  }
  
  public func generate() -> String {
    var totalAmount: Double = 0
    var frequentRenterPoints: Int = 0;
    
    var result = "Rental Record for " + customer.name + "\n";
    
    var index = 0
    while index < customer.rentals.count {
      var thisAmount: Double = 0;
      let rental = customer.rentals[index]
      
      switch rental.movie.priceCode {
      case Movie.REGULAR:
        thisAmount += calculateAmount(rental)
      case Movie.NEW_RELEASE:
        thisAmount += Double(rental.daysRented) * 3
      case Movie.CHILDRENS:
        thisAmount += 1.5
        if (rental.daysRented > 3) {
          thisAmount += Double(rental.daysRented - 3) * 1.5
        }
      default:
        break
      }
      
      frequentRenterPoints+=1;
      
      if rental.movie.priceCode == Movie.NEW_RELEASE
        && rental.daysRented > 1 {
        frequentRenterPoints+=1;
      }
      
      result += "\t" + rental.movie.title + "\t"
        + String(thisAmount) + "\n";
      totalAmount += thisAmount;
      index+=1
    }
    
    result += "You owed " + String(totalAmount) + "\n";
    result += "You earned " + String(frequentRenterPoints) + " frequent renter points\n";
    
    return result;
  }

}
