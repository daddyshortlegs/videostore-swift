public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  public func generate() -> String {
    var totalAmount: Double = 0
    var frequentRenterPoints: Int = 0;
    
    var result = "Rental Record for " + customer.name + "\n";
    
    var index = 0
    while index < customer.rentals.count {
      var thisAmount: Double = 0;
      let each = customer.rentals[index]
      
      // determines the amount for each line
      switch each.movie.priceCode {
      case Movie.REGULAR:
        thisAmount += 2;
        if (each.daysRented > 2) {
          thisAmount += Double(each.daysRented - 2) * 1.5
        }
      case Movie.NEW_RELEASE:
        thisAmount += Double(each.daysRented) * 3
      case Movie.CHILDRENS:
        thisAmount += 1.5
        if (each.daysRented > 3) {
          thisAmount += Double(each.daysRented - 3) * 1.5
        }
      default:
        break
      }
      
      frequentRenterPoints+=1;
      
      if each.movie.priceCode == Movie.NEW_RELEASE
        && each.daysRented > 1 {
        frequentRenterPoints+=1;
      }
      
      result += "\t" + each.movie.title + "\t"
        + String(thisAmount) + "\n";
      totalAmount += thisAmount;
      index+=1
    }
    
    result += "You owed " + String(totalAmount) + "\n";
    result += "You earned " + String(frequentRenterPoints) + " frequent renter points\n";
    
    return result;
  }

}
