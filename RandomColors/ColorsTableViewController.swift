//
//  ColorsTableViewController.swift
//  RandomColors
//
//  Created by Bruno Albino on 31/05/23.
//

import UIKit

var COLORS_QUANTITY = 50

enum Cells {
    static let colorCell = "colorCell"
}

enum Segues {
    static let toDetail = "ToColorsDetailViewController"
}

class ColorsTableViewController: UIViewController {
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addRandomColors()
    }

    func addRandomColors() {
        for _ in 0..<COLORS_QUANTITY {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController = segue.destination as! ColorsDetailViewController
        destViewController.color = sender as? UIColor
    }

}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return COLORS_QUANTITY
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) {
            cell.backgroundColor = colors[indexPath.row]
            return cell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
