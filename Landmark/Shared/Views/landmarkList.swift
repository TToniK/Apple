//
//  landmarkList.swift
//  Landmark (iOS)
//
//  Created by Toni Kari on 11/01/2021.
//
import CoreData
import SwiftUI

struct LandmarkList: View {
    @State private var showAlert = false
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var indexSetToDelete: IndexSet?
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
            }
                ForEach(filteredLandmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                   
                }
                
                .onDelete { (indexSet) in
                     //self.showAlert = true
                     self.indexSetToDelete = indexSet
                }
                //.alert(isPresented: $showAlert){
                  //  Alert(title: Text("Confirm Deletion"),
                    //    message: Text("Are you sure you want to delete this?"),
                      //  primaryButton: .destructive(Text("Delete")) {
                          
                            
                        
                        //},
                       // secondaryButton: .cancel())
                //}
            }
            .navigationTitle("Landmarks")
                .navigationBarItems(trailing:
                EditButton())
            
        }
       
    }
}

struct landmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
                    LandmarkList()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
}
}


