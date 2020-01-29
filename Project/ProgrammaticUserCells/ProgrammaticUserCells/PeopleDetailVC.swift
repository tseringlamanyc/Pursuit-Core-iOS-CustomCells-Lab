//
//  PoepleDetailVC.swift
//  ProgrammaticUserCells
//
//  Created by Tsering Lama on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class PeopleDetailVC: UIViewController {
    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var cell: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        phone.text = "Phone number:\(user.phone)"
        gender.text = user.gender
        name.text = "\(user.name.first) \(user.name.last)"
        email.text = user.email
        location.text = user.location.state
        cell.text = "Cell:\(user.cell)"
        
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime,
                                          .withDashSeparatorInDate,
                                          .withFullDate,
                                          .withFractionalSeconds,
                                          .withColonSeparatorInTimeZone]
        isoDateFormatter.timeZone = TimeZone.current
        _ = isoDateFormatter.string(from: Date())
        let timestampString = user.dob.date
        if let date = isoDateFormatter.date(from: timestampString) {
        let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM, dd, yyyy h:mm a"
        let dateFormattedString = dateFormatter.string(from: date)
            birthday.text = dateFormattedString
        } else {
        print("not a valid date")
        }
    }
    


}
