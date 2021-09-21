//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Shorabh Dhandharia on 9/21/21.
//

import UIKit
//import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {

//    var categories = [Category]()
    let realm = try! Realm()

//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
        return categories?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
//        cell.textLabel?.text = categories[indexPath.row].name
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        return cell
    }


    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = categories[indexPath.row]
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }

    //MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        categories  = realm.objects(Category.self)
        tableView.reloadData()
    }
    
//    func saveCategories() {
//        do {
//            try context.save()
//        } catch {
//            print("Error saving category \(error)")
//        }
//        tableView.reloadData()
//    }
//    func loadCategories() {
//        let request : NSFetchRequest<Category> = Category.fetchRequest()
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error loading categories \(error)")
//        }
//        tableView.reloadData()
//    }


    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
//            let newCategory = Category(context: self.context)
            let newCategory = Category()
            newCategory.name = textField.text!
//            self.categories.append(newCategory)
//            self.saveCategories()
            self.save(category: newCategory)
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
}
