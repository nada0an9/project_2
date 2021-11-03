

import UIKit

protocol InsertDelegate {
    
    func inert(name: String,price : String, MorY :Int, startDate :Date,endDate : Date , endDatepicker : UIDatePicker)
    
}

struct Subscription{

    static var lastId = 0
    var subscriptionID = Subscription.createNewId()
    var subscriptionName: String
    var startDate = Date()
    var endDate = Date()
    var price: String
    var monthOrYear :Int
    var dayleft : Int
   
    static func daysBetweenDates(endDate: UIDatePicker) -> Int {
        let daydate = Date()
        let end_Date = endDate.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: daydate, to: end_Date)
        return components.day!
    }
  
    
    static func createNewId() -> Int {
       self.lastId += 1
       return (self.lastId)
   }
  

}
class ViewController: UIViewController {
    var delegate : InsertDelegate!

    @IBOutlet weak var monthOrYear: UISegmentedControl!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var sPrice: UITextField!
    @IBOutlet weak var sName: UITextField!
    var indexPath = 0
    var name = ""
    var price = ""
    var start_date = Date()
    var end_date = Date()
    var leftDays = 0
    var s1 : Subscription!

    var arrSubscription : [Subscription]!
   
    @IBAction func addSubscription(_ sender: Any) {
        
        delegate.inert(name: sName.text!,
                       price: sPrice.text!,
                       MorY: monthOrYear.selectedSegmentIndex,
                       startDate: startDate.date,
                       endDate: endDate.date,
                       endDatepicker: endDate)

//      arrSubscription.append(Subscription(
//            subscriptionName: sName.text!,
//            startDate: startDate.date,
//            endDate: endDate.date,
//            price:sPrice.text!,
//            monthOrYear: monthOrYear.selectedSegmentIndex,
//            dayleft: Subscription.daysBetweenDates(endDate: endDate)
        
//
//        ))
//
        
        print(arrSubscription)
        navigationController?.popViewController(animated: true)
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let tableVC = segue.destination as! SubscriptionTableTableViewController
//        let lastSub = arrSubscription
//        tableVC.yourArray = arrSubscription
//

        
        
//    }

}

