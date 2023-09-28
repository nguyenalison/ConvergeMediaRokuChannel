
' Note that we need to import this file in MainScene.xml using relative path.

sub ShowDetailsScreen(content as Object, selectedItem as Integer)
    ' create new instance of details screen
    m.detailsScreen = CreateObject("roSGNode", "DetailsScreen")
    m.detailsScreen.content = content
    m.detailsScreen.jumpToItem = selectedItem ' set index of item which should be focused
    m.detailsScreen.ObserveField("visible", "OnDetailsScreenVisibilityChanged")
    m.detailsScreen.ObserveField("buttonSelected", "OnButtonSelected")
    ShowScreen(m.detailsScreen)
end sub

sub CloseDetailsScreen()
    CloseScreen(m.detailsScreen)
end sub


sub OnButtonSelected(event) ' invoked when button in DetailsScreen is pressed
    details = event.GetRoSGNode()
    print details
    content = details.content
    buttonIndex = event.getData() ' index of selected button
    selectedItem = details.itemFocused
    if buttonIndex = 0 ' check if "Play" button is pressed
        ' create Video node and start playback
        ShowVideoScreen(content, selectedItem)
    end if
end sub

sub OnDetailsScreenVisibilityChanged(event as Object) ' invoked when DetailsScreen "visible" field is changed
    visible = event.GetData()
    m.detailsScreen = event.GetRoSGNode()
    ' update GridScreen's focus when navigate back from DetailsScreen
    if visible = false
        m.ShowScreen.jumpToRowItem = [m.selectedIndex[0], m.detailsScreen.itemFocused]
        m.FilmScreen.jumpToRowItem = [m.selectedIndex[0], m.detailsScreen.itemFocused]
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], m.detailsScreen.itemFocused]
    end if
end sub