internal class ChildrensMovie: Movie {
  
  override func initialAmount() -> Double {
    return 1.5
  }
  
  override func daysOverdue() -> Int {
    return 3
  }

}
