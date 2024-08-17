import SwiftUI

struct WeatherView: View {
    @State private var isSheetVisible = true
    var weather: ResponseBody
    
    var body: some View {
        GeometryReader{geometry in
            ZStack {
                
                WeatherBackground(weather_description: weather.weather[0].main)
                
                VStack {
                    // Top section with rounded rectangle
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(weather.name)
                                .font(.title)
                                .bold()
                            Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding(.leading, 20)
                        
                        
                        HStack {
                            WeatherInfo(weather_description: weather.weather[0].main)
                            
                            Text(weather.current.feels_like.roundDouble() + "ºC")
                                .font(.system(size: 80))
                                .fontWeight(.bold)
                                .padding()
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: 200)
                    //                    .padding()
                    .colorInvert()
                    .padding(.bottom, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20, corners: .allCorners)
                    
                    
                    VStack {
                        Spacer()
                        VStack {
                            
                            
                               
                        }
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .preferredColorScheme(.dark)
            }
            .sheet(isPresented: $isSheetVisible) {
                WeatherInfoView(weather: weather)
                    .presentationDetents([.fraction(0.25), .medium])
                    .interactiveDismissDisabled(true)
            }
        }
    }
}

struct WeatherInfoView: View{
    var weather: ResponseBody
    var body: some View{
        VStack(alignment: .leading) {
            Text("Weather Details")
                .bold()
                .padding(.bottom, 20)
            HStack {
                
                VStack(alignment: .leading){
                    
                    WeatherRow(logo: "thermometer", name: "Temperature", value: "\(weather.current.temp.roundDouble())ºC")
                    
                    WeatherRow(logo: "wind", name: "Wind Speed", value: "\(weather.current.wind_speed.roundDouble())m/s")
                    
                }
                Spacer()
                VStack(alignment: .leading){
                    WeatherRow(logo: "thermometer", name: "Feels Like", value: "\(weather.current.feels_like.roundDouble())ºC")
                    WeatherRow(logo: "humidity", name: "Humidity ", value: "\(weather.current.humidity)%")
                    
                }
                
                
            }
//            HStack{
//                VStack(alignment: .leading){
//                    WeatherRow(logo: "thermometer", name: "Sun Rise", value: "\(Date(timeIntervalSince1970: TimeInterval(weather.sys.sunrise)).formatted(.dateTime.hour().minute()))")
//                    
//                    
//                }
//                VStack(alignment: .leading){
//                  
//                    WeatherRow(logo: "thermometer", name: "Sun Rise", value: "\(Date(timeIntervalSince1970: TimeInterval(weather.sys.sunset)).formatted  (.dateTime.hour().minute()))")
//                    
//                }
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.345))
        .background(Color.white)
        //                                    .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
