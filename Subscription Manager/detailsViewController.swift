

import UIKit

protocol UpdateDelegate {
    func updateDetails(name: String,price : String, MorY :Int, startDate :Date,endDate : Date , remainDay : Int)
}

class detailsViewController: UIViewController {
    var delegate: UpdateDelegate!
    var id = 0
    var name = ""
    var price = ""
    var yearOrMonth = 0
    var start_date = Date()
    var end_date = Date()
    var reminingDays = 0
    var index_path = 0
  
    @IBOutlet weak var sPRICE: UITextField!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var YearOrMonth: UISegmentedControl!
    @IBOutlet weak var sName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let oneClass = segue.destination as! ViewController
        oneClass.name = sName.text!
        oneClass.price = sPRICE.text!
        oneClass.start_date = startDate.date
        oneClass.end_date = endDate.date
        oneClass.leftDays = reminingDays
        oneClass.indexPath = index_path
        oneClass.monthOrYear = YearOrMonth

       }
    
    @IBAction func updateBtn(_ sender: Any) {
        delegate.updateDetails(
            name: sName.text!,
            price: sPRICE.text!,
            MorY: YearOrMonth.selectedSegmentIndex,
            startDate: startDate.date,
            endDate: endDate.date,
            remainDay: Subscription.daysBetweenDates(endDate: endDate)
        )
    
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        sName.text = name
        sPRICE.text = price
        startDate.date = start_date
        endDate.date = end_date
        YearOrMonth.selectedSegmentIndex = yearOrMonth
        super.viewDidLoad()

    }
    

}
