//
//  CoreDataManager.swift
//  GeekTranslations
//
//  Created by Emilly Maia on 12/10/22.
//

import Foundation
import CoreData

final class CoreDataManager {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteTranslationsCoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext(translation: String) {
        let contextManager = CoreDataManager.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "FavoriteTranslationEntity",
                                                      in: contextManager) else { return }
        let favoriteTranslate = NSManagedObject.init(entity: entity, insertInto: contextManager)
        favoriteTranslate.setValue(translation, forKey: "translation")
        do {
            try contextManager.save()
            print("Salvou")
        } catch {
            print("Erro ao salvar no coredata")
        }
    }
    func fetchTranslations() -> [NSManagedObject] {
        let contextManager = CoreDataManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteTranslationEntity")
        do {
            let dataToReturn = try contextManager.fetch(fetchRequest)
            return dataToReturn
        } catch {
            print("Falha ao trazer os arquivos")
        }
        return [NSManagedObject]()
    }
}
