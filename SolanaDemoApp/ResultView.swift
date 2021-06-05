//
//  ResultView.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import SwiftUI
import CodeEditor

struct ResultView: View {
    
    @State var input: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        CodeEditor(source: $input, language: .javascript, theme: colorScheme == .dark ? .agate : .atelierSavannaDark)
            .font(.caption)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing:8))
    }
}

struct ResultView_Previews: PreviewProvider {
    
    static let inputText = """
    ["result": {
        context =     {
            slot = 60671161;
        };
        value =     {
            blockhash = 8fvJiYGR4WCfBW2BhoeV2sE6hwDwmjiDRqMQWtdmm4fe;
            feeCalculator =         {
                lamportsPerSignature = 5000;
            };
            lastValidBlockHeight = 60128530;
            lastValidSlot = 60671461;
        };
    }, "jsonrpc": 2.0, "id": 1]
    """
    
    static var previews: some View {
        ResultView(input: inputText)
    }
}
