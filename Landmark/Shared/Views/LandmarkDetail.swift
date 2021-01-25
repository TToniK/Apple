//
//  LandmarkDetail.swift
//  Landmark (iOS)
//
//  Created by Toni Kari on 11/01/2021.
//

import SwiftUI
import CoreData

    
  

struct LandmarkDetail: View {
    @State private var deleteIndexSet: IndexSet?
    @State private var showAlert = false
    @State private var indexSetToDelete: IndexSet?
    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    var landmark: Landmark
    var landmarkIndex: Int {
        guard let index = modelData.landmarks.firstIndex(where: { return $0.id == landmark.id }) else {
            return 0
        }
        return index
    }
    


    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                            HStack {
                                Text(landmark.name)
                                    .font(.title)
                                    .foregroundColor(.primary)
                                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                            }
                HStack {
                                    Text(landmark.park)
                                    Spacer()
                                    Text(landmark.state)
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                                Divider()

                                Text("About \(landmark.name)")
                                    .font(.title2)
                                Text(landmark.description)
                            }
        
            .padding()

        
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            self.showAlert = true
        })
        {
            Image(systemName: "trash")
    }.disabled(false) // Not working
    //)}
    //private func delete(at indexSet: IndexSet){
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Are you sure"), message: Text("Yes"))}
        )}
        
    
        
   



struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
                    .environmentObject(modelData)
    }
}
}



