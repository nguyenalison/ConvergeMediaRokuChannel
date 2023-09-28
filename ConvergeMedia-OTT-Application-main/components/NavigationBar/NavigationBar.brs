sub Init()

    m.NavBar = m.top.findNode("NavBar")
    m.Home = m.top.findNode("Home")
    m.Show = m.top.findNode("Show")
    m.Film = m.top.findNode("Film")
    m.About = m.top.findNode("About")
    m.HomeScreen = m.top.findNode("itemPoster")
    m.navContainer = m.top.findNode("navContainer")


    device = CreateObject("roDeviceInfo")
    m.navContainer.width = device.GetDisplaySize().w
    
  
  end sub

  
 