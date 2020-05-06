internal class RegularMovie: Movie {
  
  override func initialAmount() -> Double {
    return 2.0
  }
  
  override func daysOverdue() -> Int {
    return 2
  }
  
}
