//
//  ContentView.swift
//  Shared
//
//  Created by Toni Kari on 14.5.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showImagePicker:Bool = false
    @State var showActionSheet:Bool = false
    @State var image:Image?
    @State var sourceType:Int = 0
    
    var body: some View {
        ZStack{
        VStack{
            Image("pp")
                .resizable()
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    CameraButtonView(showActionSheet: $showActionSheet)
                        .offset(x: 50, y: 65)
                    
                )
            
            
        }
        .actionSheet(isPresented: $showActionSheet, content: {() -> ActionSheet in
                        ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the gallery or use the camera"), buttons: [
                                        ActionSheet.Button.default(Text("Camera"), action: {
                                            self.sourceType = 0
                                            self.showImagePicker.toggle()
                                        }),
                                        ActionSheet.Button.default(Text("Gallery"), action: {
                                            self.sourceType = 1
                                            self.showImagePicker.toggle()
                                        }),
                            ActionSheet.Button.cancel()])
        })
            if showImagePicker{
                ImagePicker(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
            }
            
        }
        .onAppear{self.image = Image("pp")}
    
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
