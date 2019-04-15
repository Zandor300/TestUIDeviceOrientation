/// Copyright 2012-2019 (C) Butterfly Network, Inc.

import UIKit

class ViewController: UIViewController {

    deinit {
        guard let notification = notification else { return }
        NotificationCenter.default.removeObserver(notification)
    }

    @IBOutlet weak var label: UILabel!

    private var notification: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        notification = NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                self?.label.text = {
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
        )
    }

}

