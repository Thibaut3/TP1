//
//  TableViewCell.swift
//  TP1
//
//  Created by Thibaut Juillard on 08/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ckeckBtn: UIButton!
    
    var bRec = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkMark(_ sender: UIButton) {
        bRec = !bRec
            if bRec {
                sender.setImage(UIImage(named: "iconCheck.png"), for: .normal)
            } else {
                sender.setImage(UIImage(named: ""), for: .normal)
            }
        
     }
}
