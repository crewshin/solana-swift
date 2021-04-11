//
//  ResultView.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import SwiftUI

struct ResultView: View {
    
    @State var input: String
    
    var body: some View {
        TextEditor(text: $input)
            .font(.caption)
            .foregroundColor(.pink)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing:8))
    }
}

struct ResultView_Previews: PreviewProvider {
    
    static let inputText = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel egestas metus, et tempus lacus. Nam quis vulputate neque, ac cursus purus. Fusce faucibus tortor leo, ut imperdiet elit consequat quis. Ut efficitur mauris lorem. Nam faucibus neque ac ante tristique, ut fringilla erat varius. Nunc sed venenatis dolor. Aenean viverra orci tellus, ut volutpat elit posuere sed. Donec vel rhoncus leo, vel porttitor orci. Vivamus ultrices, libero ac tincidunt sagittis, purus leo dapibus nulla, congue mattis urna leo vitae augue. Vivamus lobortis, tellus ut sollicitudin finibus, ligula elit convallis justo, sit amet vehicula nulla ipsum at lacus. Etiam eu maximus metus. Aenean sed pulvinar urna. In magna libero, fermentum at nunc in, tristique porttitor felis. Fusce posuere et diam et iaculis. Proin commodo urna sed laoreet interdum.

    Duis eget ligula eros. Sed vel ligula sed leo hendrerit pellentesque vel sed tellus. Nullam ac massa id diam lacinia cursus. Etiam lobortis ligula eget tristique faucibus. Etiam ut hendrerit nibh, in laoreet libero. Nulla purus leo, suscipit at arcu vel, rhoncus sollicitudin turpis. Nunc accumsan aliquet orci, eu consectetur mauris scelerisque a. Vestibulum diam leo, elementum id nunc eu, dictum commodo quam. Suspendisse cursus iaculis lectus ut molestie. In quis nisl nunc.

    Pellentesque eu dolor et ante volutpat tincidunt. Suspendisse a sapien imperdiet, pulvinar urna id, vulputate odio. Quisque at congue nisi, sit amet tempor ligula. Phasellus vulputate suscipit augue eget accumsan. Mauris lacinia condimentum nunc congue pretium. Vivamus quis nisi ac risus condimentum malesuada ultrices vitae metus. Mauris laoreet dolor vel nisl auctor, blandit accumsan tellus vehicula. Maecenas ac sollicitudin massa. Morbi ut leo sollicitudin, accumsan nisl eu, scelerisque enim. Vestibulum porta nibh ac viverra facilisis. Nam dapibus bibendum odio, sed pulvinar magna imperdiet vel. Cras nisl dolor, egestas et felis ut, tristique fringilla eros. Nullam auctor maximus augue, ac sollicitudin magna bibendum vitae. Integer et sapien metus. Duis tempus orci lorem, at hendrerit odio euismod et.

    Sed maximus nisl eu sagittis sodales. Integer lobortis pulvinar odio, et iaculis elit interdum eget. Morbi pulvinar sem risus, ut egestas quam rutrum vitae. Proin cursus mi vitae rhoncus tristique. Maecenas pulvinar arcu non diam gravida semper. Sed ac arcu sed purus sagittis ornare ac sit amet velit. Phasellus nisi eros, porta vitae odio vel, rhoncus dignissim est. Aliquam elementum venenatis tincidunt. Vivamus luctus elit massa, sed sodales orci porta vitae. Fusce vitae metus nisl.

    Sed ex turpis, tempus vel scelerisque ac, luctus at ante. Nam dapibus varius ex, vitae gravida sem bibendum quis. Vestibulum at magna ut mi vehicula tristique in sed ipsum. Morbi vestibulum vitae sapien ac tincidunt. Vestibulum eu erat placerat, gravida augue vestibulum, lobortis elit. Donec mollis lacinia nisl, tempus laoreet sem condimentum non. Duis eget metus quis ex efficitur rhoncus. Nam facilisis porta dictum. Nulla vitae fermentum sem, et scelerisque odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam non tellus ornare, tempor ipsum a, faucibus nisl. In sagittis facilisis tortor at interdum. Integer ullamcorper arcu neque, pretium convallis nisl fermentum vitae. Fusce non mauris a augue vehicula suscipit.

    Sed maximus nisl eu sagittis sodales. Integer lobortis pulvinar odio, et iaculis elit interdum eget. Morbi pulvinar sem risus, ut egestas quam rutrum vitae. Proin cursus mi vitae rhoncus tristique. Maecenas pulvinar arcu non diam gravida semper. Sed ac arcu sed purus sagittis ornare ac sit amet velit. Phasellus nisi eros, porta vitae odio vel, rhoncus dignissim est. Aliquam elementum venenatis tincidunt. Vivamus luctus elit massa, sed sodales orci porta vitae. Fusce vitae metus nisl.

    Sed ex turpis, tempus vel scelerisque ac, luctus at ante. Nam dapibus varius ex, vitae gravida sem bibendum quis. Vestibulum at magna ut mi vehicula tristique in sed ipsum. Morbi vestibulum vitae sapien ac tincidunt. Vestibulum eu erat placerat, gravida augue vestibulum, lobortis elit. Donec mollis lacinia nisl, tempus laoreet sem condimentum non. Duis eget metus quis ex efficitur rhoncus. Nam facilisis porta dictum. Nulla vitae fermentum sem, et scelerisque odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam non tellus ornare, tempor ipsum a, faucibus nisl. In sagittis facilisis tortor at interdum. Integer ullamcorper arcu neque, pretium convallis nisl fermentum vitae. Fusce non mauris a augue vehicula suscipit.
    """
    
    static var previews: some View {
        ResultView(input: inputText)
    }
}
