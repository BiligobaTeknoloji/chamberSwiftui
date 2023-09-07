import SwiftUI

struct CountryPicker: View {
    @Binding var selectedCountryID: String
    var body: some View {
        Picker("Code", selection: $selectedCountryID) {
            ForEach(CPData.allCountry) { country in
                Text("\(country.flag)  \(country.dial_code)")
                    .tag(country.id)
            }
        }
        .modifier(UnderlinedPicker())
    }
}

struct UnderlinedPicker: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: geometry.size.width, height: 1)
                        .offset(y: geometry.size.height - 5.3)
                }
                    .foregroundColor(.black.opacity(0.5)) // Color of the underline
            )
    }
}
