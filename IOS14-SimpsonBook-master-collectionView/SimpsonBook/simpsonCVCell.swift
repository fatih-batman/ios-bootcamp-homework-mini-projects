

import Foundation
import UIKit

class simpsonCVCell: UICollectionViewCell {
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var SsimsonImageView: UIImageView!
    
    @IBOutlet weak var simpsonLabel: UILabel!
    
    func setup (with simp: Simpson){
        SsimsonImageView.image = simp.image
        simpsonLabel.text = simp.name
        
    }
    
}
