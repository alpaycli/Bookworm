//
//  RatingView.swift
//  Bookworm
//
//  Created by Alpay Calalli on 21.08.22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var label = ""
    
    var maximumRating = 5
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self){ number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        withAnimation{
                            rating = number
                        }
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image{
        if number > rating{
            return offImage ?? onImage
        }else{
            return onImage
        }
    }
    
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
