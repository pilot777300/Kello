
import Foundation
import CoreData

class CoredataManager {
    
    static let shared = CoredataManager()
    
    init() {
        reloadPost()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavPostModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addPost(author: String, text: String, picture: Data) {
        let post = FavPost(context: persistentContainer.viewContext)
        post.postAuthor = author
        post.postText = text
        post.postPicture = picture
        saveContext()
    }
    
    var favPostData: [FavPost] = []
    
    func reloadPost() {
        let fetchRequest = FavPost.fetchRequest()
        let posts = (try? persistentContainer.viewContext.fetch(fetchRequest)) ?? []
        self.favPostData = posts
    }
    
    func deletePost(post: FavPost) {
        persistentContainer.viewContext.delete(post)
        saveContext()
        reloadPost()
    }
    
}
