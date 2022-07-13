//
//  MiViewController.swift
//  apiHarry
//
//  Created by Iván González on 9/3/22.
//

import UIKit

class MiViewController: UIViewController {

    @IBOutlet weak var casaPottercillo: UILabel!
    @IBOutlet weak var labelPottercillo: UILabel!
    @IBOutlet weak var imagePottercillo: UIImageView!
    
    public var potters:Potter?
    public var potterImage:UIImage?
    public var potterHouse:Potter?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let potters = potters {
            labelPottercillo.text = potters.personaje
        }
        if let potterImage = potterImage {
            imagePottercillo.image = potterImage
        }
        if let potterHouse = potterHouse {
            casaPottercillo.text = potterHouse.casaDeHogwarts
        }
        
        if let isGryffindor = potters?.casaDeHogwarts{
            if isGryffindor == "Gryffindor"{
                9
            }else if isGryffindor == "Slytherin"{
                view.backgroundColor = .init(displayP3Red: 40/255, green: 91/255, blue: 75/255, alpha: 36)
            }else{
                view.backgroundColor = .systemBlue
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
