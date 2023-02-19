//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Atil Samancioglu on 11.07.2019.
//  Copyright © 2019 Atil Samancioglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
         let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "marge")!)
         let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
         let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
         let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView,        numberOfItemsInSection section: Int) -> Int {
         // myData is the array of items
         return mySimpsons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:simpsonCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "simpsonCVCell", for: indexPath)as! simpsonCVCell
        cell.setup(with: mySimpsons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
     
    private func collectionView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            chosenSimpson = mySimpsons[indexPath.row]
            self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
    
    
    /**
     extension ViewController: UICollectionViewDelegateFlowLayout {
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: 200, height: 300)
         }
     }
     
     func collectionView(_ collectionView: UICollectionView,        numberOfItemsInSection section: Int) -> Int {
          // myData is the array of items
          return mySimpsons.count
     }
     
     
     
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return mySimpsons.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
         cell.textLabel?.text = mySimpsons[indexPath.row].name
         return cell
     }
     
     
     }
     
     */
    


}

