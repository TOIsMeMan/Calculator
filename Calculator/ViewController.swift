//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook Pro on 01/10/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var KQLabel: UILabel!
    
    @IBOutlet weak var ULCButton: UIButton!
    @IBOutlet weak var ULCanButton: UIButton!
    @IBOutlet weak var ULCTButton: UIButton!
    @IBOutlet weak var ULPTButton: UIButton!
    @IBOutlet weak var ULChiaButon: UIButton!
    @IBOutlet weak var ULNhanButton: UIButton!
    @IBOutlet weak var ULTruButton: UIButton!
    @IBOutlet weak var ULCongButton: UIButton!
    
    var n1: Double = 0
    var n2: Double = 1
    var n3: Double = 1
    
    var bang: Bool = true
    var phay: Bool = false
    
    var mn1: Double = 1
    var mn2: Double = 1
    
    var PhepTinh: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributedString = NSMutableAttributedString(string: "+", attributes: [
                    NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle),
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                ])

                // Thiết lập attributed string cho tiêu đề của UIButton
                ULCTButton.setAttributedTitle(attributedString, for: .normal)
    }

    func select(button: UIButton) {
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 5.0
        button.layer.cornerRadius = 10
    }
    
    func Unselect(button: UIButton) {
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 10
    }
    
    func SetKQLable(num: Double)
    {
        if (num - Double(Int(num)) == 0) {
            KQLabel.text = String(Int(num))
        } else {
            KQLabel.text = String(num)
        }
    }
    
    func Bang() {
        n2 = n2 / mn2
        mn2 = 1
        phay = false
        
        if (PhepTinh == 1) {
            n3 = n1 + n2
        } else if (PhepTinh == 2) {
            n3 = n1 - n2
        } else if (PhepTinh == 3) {
            n3 = n1 * n2
        } else {
            n3 = n1 / n2
        }
        SetKQLable(num: n3)
        bang = true
        PhepTinh = 0
//        print("\(n1), \(n2), \(n3)")
    }
    
//  C
    @IBAction func TapCButton(_ sender: Any) {
        n1 = 0
        n2 = 1
        n3 = 0
        SetKQLable(num: n3)
//        print("\(n1), \(n2), \(n3)")
        bang = false
        PhepTinh = 0
    }
    
//    √
    @IBAction func TapCanButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = n3
        }
        n3 = sqrt(n1)
        SetKQLable(num: n3)
        bang = true
//        print("\(n1), \(n2), \(n3)")
    }
    
//    +-
    @IBAction func TapCTButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = n3
        }
        n3 = n1 * -1
        SetKQLable(num: n3)
        bang = true
//        print("\(n1), \(n2), \(n3)")
    }
    
//  %
    @IBAction func TapPTButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = n3
        }
        n3 = n1 / 100
        SetKQLable(num: n3)
        bang = true
//        print("\(n1), \(n2), \(n3)")
    }
    
//    :
    @IBAction func TapChiaButton(_ sender: Any) {
        self.select(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        if (PhepTinh != 0) {
            Bang()
        }
        self.PhepTinh = 4
        if (bang) {
            n1 = n3
        }
        n1 = n1 / mn1
        mn1 = 1
        phay = false
        n2 = 0
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
    
//    x
    @IBAction func TapNhanButton(_ sender: Any) {
        self.select(button: ULNhanButton)
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        if (PhepTinh != 0) {
            Bang()
        }
        self.PhepTinh = 3
        if (bang) {
            n1 = n3
        }
        n1 = n1 / mn1
        mn1 = 1
        phay = false
        n2 = 0
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
    
//    -
    @IBAction func TapTruButton(_ sender: Any) {self.select(button: ULTruButton)
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULCongButton)
        if (PhepTinh != 0) {
            Bang()
        }
        self.PhepTinh = 2
        if (bang) {
            n1 = n3
        }
        n1 = n1 / mn1
        mn1 = 1
        phay = false
        n2 = 0
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
    
//    +
    @IBAction func TapCongButton(_ sender: Any) {
        self.select(button: ULCongButton)
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        if (PhepTinh != 0) {
            Bang()
        }
        self.PhepTinh = 1
        if (bang) {
            n1 = n3
        }
        n1 = n1 / mn1
        mn1 = 1
        phay = false
        n2 = 0
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    0
    @IBAction func TapKhongButton(_ sender: Any) {
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    1
    @IBAction func TapMotButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 1
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 1
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
        
//        print("\(n1), \(n2), \(n3)")
    }
//    2
    @IBAction func TapHaiButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 2
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 2
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    3
    @IBAction func TapBaButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 3
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 3
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    4
    @IBAction func TapBonButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 4
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 4
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    5
    @IBAction func TapNamButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 5
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 5
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    6
    @IBAction func TapSauButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 6
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 6
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    7
    @IBAction func TapBayButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 7
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 7
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    8
    @IBAction func TapTamButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 8
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 8
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    9
    @IBAction func TapChinButton(_ sender: Any) {
        self.Unselect(button: ULChiaButon)
        self.Unselect(button: ULNhanButton)
        self.Unselect(button: ULTruButton)
        self.Unselect(button: ULCongButton)
        
        if (bang) {
            n1 = 0
        }
        if (PhepTinh == 0) {
            n1 = n1 * 10 + 9
            if (phay) {
                mn1 = mn1 * 10
            }
//            KQLabel.text = String(n1 / mn1)
            SetKQLable(num: n1 / mn1)
        } else {
            n2 = n2 * 10 + 9
            if (phay) {
                mn2 = mn2 * 10
            }
//            KQLabel.text = String(n2 / mn2)
            SetKQLable(num: n2 / mn2)
        }
        bang = false
//        print("\(n1), \(n2), \(n3)")
    }
//    ,
    @IBAction func TapPhayButton(_ sender: Any) {
        if (bang) {
            n1 = 0
        }
        if (!phay) {
            KQLabel.text! += "."
        }
        phay = true
        bang = false
    }
//    =
    @IBAction func TapBangButton(_ sender: Any) {
        Bang()
    }
    
}

