//
//  ContentView.swift
//  Waterdeep Currency Converter
//
//  Created by Josh Boles on 2/12/20.
//  Copyright © 2020 Josh Boles. All rights reserved.
//

import SwiftUI


struct ContentView: View {
  @State var inputValue: String = "1"
  @State private var inputCurrency = 0
  let currencies = ["Copper Nibs", "Silver Shards", "Gold Dragons", "Brass Taols", "Platinum Suns", "Platinum Harbor Moons"]
  
  private var copperNibs: Double {
    let inputValue = Double(self.inputValue) ?? 0.0
    switch(inputCurrency) {
    case 0:
      return inputValue * 1.0
    case 1:
      return inputValue * 10.0
    case 2:
      return inputValue * 100.0
    case 3:
      return inputValue * 200.0
    case 4:
      return inputValue * 1000.0
    case 5:
      return inputValue * 5000.0
    default:
      return 0.0
    }
  }
  
  private var silverShards: Double {
    return Double(copperNibs / 10)
  }
  private var goldDragons: Double {
    return Double(copperNibs / 100)
  }
  private var brassTaols: Double {
    return Double(copperNibs / 200)
  }
  private var platinumSuns: Double {
    return Double(copperNibs / 1000)
  }
  private var platinumHarborMoons: Double {
     return Double(copperNibs / 5000)
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $inputValue)
            .keyboardType(.decimalPad)
          
          Picker("Select currency", selection: $inputCurrency) {
            ForEach(0 ..< currencies.count) {
              Text(self.currencies[$0])
            }
          }
        }

        Section(header: Text("Conversions:")) {
          HStack{
            VStack {
              VStack {
                Text("\(self.copperNibs.removeZerosFromEnd())")
                  .bold()
                Text("copper nibs")
              }
              .padding()
              
              VStack{
                Text("\(self.goldDragons.removeZerosFromEnd())")
                  .bold()
                Text("gold dragons\n")
              }
              .padding()
              
              VStack {
                Text("\(self.platinumSuns.removeZerosFromEnd())")
                  .bold()
                Text("platinum suns")
              }
              .padding()
            }
            
            Spacer()
            
            VStack {
              VStack {
                Text("\(self.silverShards.removeZerosFromEnd())")
                  .bold()
                Text("silver shards")
              }
              .padding()
              
              VStack{
                Text("\(self.brassTaols.removeZerosFromEnd())")
                  .bold()
                Text("brass taols")
              }
              .padding()
              
              VStack {
                Text("\(self.platinumHarborMoons.removeZerosFromEnd())")
                  .bold()
                Text("platinum \nharbor moons")
                  .multilineTextAlignment(.center)
              }
              .padding()
            }
          }
        }
      }
      .navigationBarTitle(Text("Waterdeep Currency"))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 11")
  }
}

extension Double {
  func removeZerosFromEnd() -> String {
    let formatter = NumberFormatter()
    let number = NSNumber(value: self)
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
    return String(formatter.string(from: number) ?? "")
  }
}
