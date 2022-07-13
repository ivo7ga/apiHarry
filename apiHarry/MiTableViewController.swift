//
//  MiTableViewController.swift
//  apiHarry
//
//  Created by Iván González on 9/3/22.
//

import UIKit

class MiTableViewController: UITableViewController {
    
    var potters:[Potter?] = []
    var imagenes: [UIImage?] = []
    let Max_potters = 23
    var imagesDownload = 0
    var connection = Connection()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Personajes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        potters = [Potter?](repeating: nil, count: Max_potters)
        imagenes = [UIImage?](repeating: nil, count: Max_potters)
        
        downloadPotterInfo()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return potters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPotterCell", for: indexPath) as! MiTableViewCell

        // Configure the cell...
        if let potter = potters[indexPath.row]{
            cell.potterLabel.text = potter.personaje ?? "Desconocido"
            cell.potterLabel.textColor = .blue
            cell.potterHouse.text = potter.casaDeHogwarts ?? "Desconocido"
            cell.potterHouse.textColor = .red
        }
        if let imagen = imagenes[indexPath.row]{
            cell.potterImagen.image = imagen
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func downloadPotterInfo(){
        for i in 1...Max_potters{
            connection.getPokemon(withId: i) { potter in
                if let potter = potter, let id = potter.id {
                    self.potters[id - 1] = potter
                    if let image = potter.imagen{
                        self.connection.getSprite(withURLString: image) { image in
                            self.imagesDownload += 1
                            if let image = image {
                                self.imagenes[id - 1] = image
                            }
                            if self.imagesDownload == self.Max_potters{
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOther"{
           if let detailVC = segue.destination as? MiViewController,
              let indexPath = tableView.indexPathForSelectedRow,
              let potter = potters[indexPath.row],
              let imagen = imagenes[indexPath.row],
              let casa = potters[indexPath.row]
            {
               detailVC.potterImage = imagen
               detailVC.potters = potter
               detailVC.potterHouse = casa
            }
        }
    }
}
