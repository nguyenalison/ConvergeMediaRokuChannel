' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8089
  'print "HeroScene.brs - [init]"
  m.top.backgroundUri = "https://storageconverge.blob.core.windows.net/thumbnail-photo-test/backgroundGradient.png"
  m.NavBar = m.top.findNode("NavBar")
  m.Home = m.NavBar.findNode("Home")
  m.Show = m.NavBar.findNode("Show")
  m.Film = m.NavBar.findNode("Film")
  m.About = m.NavBar.findNode("About")
  ' HomeScreen Node with RowList

  m.HomeScreen = m.top.FindNode("HomeScreen")
  
  m.AboutScreen = m.top.FindNode("AboutScreen")

  m.FilmScreen = m.top.FindNode("FilmScreen")

  m.ShowScreen = m.top.FindNode("ShowScreen")

  ' Transitions between screens
  m.FadeIn = m.top.findNode("FadeIn")
  m.FadeOut = m.top.findNode("FadeOut")

  RenderGridContent()
end sub


function onKeyEvent(key as string, press as boolean) as boolean
  result = false
 print "in ChannelStartup onKeyEvent ";key;" "; press
  
  if press
    ' handle "back" key press
    if key = "back"

      numberOfScreens = m.screenStack.Count()
      ' close top screen if there are two or more screens in the screen stack
      if numberOfScreens > 0
          CloseScreen(invalid)
          result = true
      end if
    end if

    if m.top.visible = true and key = "up"
      m.Home.focusedColor = "0x4285F4"
      m.Home.setFocus(true)
    end if
    if m.Home.hasFocus() = true 
      if key = "down"
        m.HomeScreen.setFocus(true)
        toggleVisibility(m.HomeScreen)
        RenderGridContent()
        m.Home.focusedColor = "0x4285F4"
      else if key = "right"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "left"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "OK"
        m.Home.focusedColor = "0x4285F4"
        toggleVisibility(m.HomeScreen)
        RenderGridContent()
      end if
    else if m.Show.hasFocus() = true
      print "show has focus"
      if key = "down"
        toggleVisibility(m.ShowScreen)
        RenderShowContent()
        m.Show.focusedColor = "0x4285F4"
       
      else if key = "right"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "left"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.ShowScreen)
        RenderShowContent()
        m.Show.focusedColor = "0x4285F4"
      end if
    else if m.Film.hasFocus() = true
      if key = "down"
        toggleVisibility(m.FilmScreen)
        RenderFilmContent()
        ' m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "right"
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"
      else if key = "left"
        m.Show.setFocus(true)
        m.Show.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.FilmScreen)
        RenderFilmContent()
         m.Film.focusedColor = "0x4285F4"
      end if
    else if m.About.hasFocus() = true
      if key = "down"
        print "no interaction for about page yet"
      else if key = "right"
        m.Home.setFocus(true)
        m.Home.focusedColor = "0x4285F4"
      else if key = "left"
        m.Film.setFocus(true)
        m.Film.focusedColor = "0x4285F4"
      else if key = "OK"
        toggleVisibility(m.AboutScreen)
        m.AboutScreen.visible = true
        m.About.setFocus(true)
        m.About.focusedColor = "0x4285F4"

      end if
    end if
  end if
  return  result
end function

function toggleVisibility(screen as object)
  m.AboutScreen.visible = false

  CloseDetailsScreen()
  UnrenderContent()

end function
