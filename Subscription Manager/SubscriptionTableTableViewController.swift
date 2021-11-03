
import UIKit

class SubscriptionTableTableViewController: UITableViewController, UpdateDelegate, InsertDelegate {
    
    func inert(name: String,price : String, MorY :Int, startDate :Date,endDate : Date, endDatepicker :UIDatePicker ){
        
        yourArray.append(Subscription(
            subscriptionName: name,
            startDate: startDate,
            endDate: endDate,
            price: price,
            monthOrYear: MorY,
            dayleft: Subscription.daysBetweenDates(endDate: endDatepicker)
        ))
        yourArray.sort {
            $0.dayleft < $1.dayleft
        }
    }
    func updateDetails(name: String, price: String, MorY: Int, startDate star_date: Date, endDate end_Date :Date,remainDay : Int) {
        yourArray[indexpath].subscriptionName = name
        yourArray[indexpath].price = price
        yourArray[indexpath].monthOrYear = MorY
        yourArray[indexpath].startDate = star_date
        yourArray[indexpath].endDate = end_Date
        yourArray[indexpath].dayleft = remainDay
        
        yourArray.sort {
            $0.dayleft < $1.dayleft
        }
    }
    
    var yourArray = [Subscription]()
    var id = 0
    var name = ""
    var price = ""
    var yearOrMonth = 0
    var start_date = Date()
    var end_date = Date()
    var reminingDays = 0
    var indexpath = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "show_det"
        {
            let detailsVC = segue.destination as! detailsViewController
            detailsVC.delegate = self
            detailsVC.id = id
            detailsVC.name = name
            detailsVC.price = price
            detailsVC.start_date = start_date
            detailsVC.end_date = end_date
            detailsVC.reminingDays = reminingDays
            detailsVC.yearOrMonth = yearOrMonth
            
        }
        else{
            let oneClass = segue.destination as! ViewController
            oneClass.arrSubscription = yourArray
            oneClass.indexPath = indexpath
            oneClass.delegate = self
            
            
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return yourArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellitem", for: indexPath)
        
        cell.textLabel?.text = yourArray[indexPath.row].subscriptionName
        cell.detailTextLabel?.text = "Reminig Date : \(yourArray[indexPath.row].dayleft)"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            yourArray.remove(at: indexpath)
            yourArray.sort {
                $0.dayleft < $1.dayleft
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = yourArray[indexPath.row].subscriptionID
        name = yourArray[indexPath.row].subscriptionName
        price = yourArray[indexPath.row].price
        start_date = yourArray[indexPath.row].startDate
        end_date = yourArray[indexPath.row].endDate
        reminingDays = yourArray[indexPath.row].dayleft
        yearOrMonth = yourArray[indexPath.row].monthOrYear
        indexpath = indexPath.row
        performSegue(withIdentifier: "show_det", sender: self)
        
        
        
    }
    
    
}
