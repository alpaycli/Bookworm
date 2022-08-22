//
//  AddBookView.swift
//  Bookworm
//
//  Created by Alpay Calalli on 19.08.22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var date = Date.now
    
    var hasValidInputs: Bool{
        if title.isEmpty || author.isEmpty || genre.isEmpty{
            return true
        }
        return false
    }
    
    let genres = ["Comedy", "Thriller", "Kids", "Horror", "Mystery", "Poetry", "Fantasy", "Romance"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }header: {
                    Text("Write a review")
                }
                
                Section{
                    Button("Save me"){
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.genre = genre
                        newBook.author = author
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        
                        try?moc.save()
                        dismiss()
                    }
                }
                .disabled(hasValidInputs)
            }
            .navigationTitle("Add Book")
        }
        
        
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
