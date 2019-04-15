/// Copyright 2012-2019 (C) Butterfly Network, Inc.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidLayoutSubviews() {
        label.text = {
            if UIDevice.current.orientation.isPortrait {
                return "Portrait"
            } else if UIDevice.current.orientation.isLandscape {
                return "Landscape"
            } else if UIDevice.current.orientation.isFlat {
                return "Flat"
            } else {
                return "Unknown"
            }
        }()
    }

}

