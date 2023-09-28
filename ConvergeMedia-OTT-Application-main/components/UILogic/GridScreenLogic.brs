sub InitGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
end sub

sub InitFilmScreen()
    m.FilmScreen = CreateObject("roSGNode", "FilmScreen")
end sub

sub InitShowScreen()
    m.ShowScreen = CreateObject("roSGNode", "ShowScreen")
end sub

sub ShowGridScreen()
    m.GridScreen.ObserveField("rowItemSelected", "OnGridScreenItemSelected")
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub ShowFilmScreen()
    m.FilmScreen.ObserveField("rowItemSelected", "OnFilmScreenItemSelected")
    ShowScreen(m.FilmScreen) ' show GridScreen
    m.FilmScreen.visible = true
end sub

sub ShowShowScreen()
    m.ShowScreen.ObserveField("rowItemSelected", "OnShowScreenItemSelected")
    ShowScreen(m.ShowScreen) ' show GridScreen
end sub

sub ShowAboutScreen()
    ShowScreen(m.AboutScreen) ' show GridScreen
end sub

sub RemoveFilmScreen()
    CloseScreen(m.FilmScreen)
    m.FilmScreen.visible = false
end sub

sub RemoveShowScreen()
    CloseScreen(m.ShowScreen)
    m.ShowScreen.visible = false
end sub

sub RemoveGridScreen()
    CloseScreen(m.GridScreen)
end sub


sub OnGridScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' extract the row and column indexes of the item the user selected
    m.selectedIndex = event.GetData()
    ' the entire row from the RowList will be used by the Video node
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    ShowDetailsScreen(rowContent, m.selectedIndex[1])
end sub
sub OnShowScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' extract the row and column indexes of the item the user selected
    m.selectedIndex = event.GetData()
    ' the entire row from the RowList will be used by the Video node
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    ShowDetailsScreen(rowContent, m.selectedIndex[1])
end sub

sub OnFilmScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' extract the row and column indexes of the item the user selected
    m.selectedIndex = event.GetData()
    ' the entire row from the RowList will be used by the Video node
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    ShowDetailsScreen(rowContent, m.selectedIndex[1])
end sub