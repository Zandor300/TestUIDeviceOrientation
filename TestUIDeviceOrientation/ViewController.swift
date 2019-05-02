/// Copyright 2012-2019 (C) Butterfly Network, Inc.

import UIKit

class ViewController: UIViewController {

    deinit {
        guard let notification = notification else { return }
        NotificationCenter.default.removeObserver(notification)
    }

    @IBOutlet weak var orientationNameLabel: UILabel!
    @IBOutlet weak var isPortraitLabel: UILabel!
    @IBOutlet weak var isLandscapeLabel: UILabel!
    @IBOutlet weak var isFlatLabel: UILabel!

    private var notification: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateIsLabels()

        // Do any additional setup after loading the view, typically from a nib.
        notification = NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                self?.orientationNameLabel.text = {
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
                self?.updateIsLabels()
            }
        )
    }

    var isPortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }

    var isLandscape: Bool {
        return UIDevice.current.orientation.isLandscape
    }

    var isFlat: Bool {
        return UIDevice.current.orientation.isFlat
    }

    func updateIsLabels() {
        self.isPortraitLabel.text = "isPortrait == " + (self.isPortrait ? "true" : "false")
        self.isLandscapeLabel.text = "isLandscape == " + (self.isLandscape ? "true" : "false")
        self.isFlatLabel.text = "isFlat == " + (self.isFlat ? "true" : "false")
    }

}

