 ' entry point of detailsScreen
 function Init()
  ' observe "visible" so we can know when DetailsScreen change visibility
  m.top.ObserveField("visible", "OnVisibleChange")
  ' observe "itemFocused" so we can know when another item gets in focus
  m.top.ObserveField("itemFocused", "OnItemFocusedChanged")
  ' save a references to the DetailsScreen child components in the m variable
  ' so we can access them easily from other functions
  m.buttons = m.top.FindNode("buttons")
  m.poster = m.top.FindNode("poster") 
  m.poster_1 = m.top.FindNode("poster_1")
  m.description = m.top.FindNode("descriptionLabel")
  
  m.timeLabel = m.top.FindNode("timeLabel")
  m.titleLabel = m.top.FindNode("titleLabel")
  m.overviewLabel  = m.top.FindNode("overviewLabel")
 
  m.releaseLabel = m.top.FindNode("releaseLabel")
  
  ' create buttons
  result = []
  for each button in ["Play"] ' buttons list contains only "Play" button for now
      result.Push({title : button})
  end for
  m.buttons.content = ContentListToSimpleNode(result) ' set list of buttons for DetailsScreen
end function

sub OnVisibleChange() ' invoked when DetailsScreen visibility is changed
  ' set focus for buttons list when DetailsScreen become visible
  if m.top.visible = true
      m.buttons.SetFocus(true)
      m.top.itemFocused = m.top.jumpToItem
  end if
end sub

' Populate content details information
sub SetDetailsContent(content as Object)
  m.description.text = content.description ' set description of content
  m.poster.uri = content.hdPosterUrl ' set url of content poster
  m.poster_1.uri = content.hdPosterUrl
  m.timeLabel.text = GetTime(content.length) ' set length of content
  m.titleLabel.text = content.title ' set title of content
  m.releaseLabel.text = content.releaseDate ' set release date of content
  
end sub

sub OnJumpToItem() ' invoked when jumpToItem field is populated
  content = m.top.content
  ' check if jumpToItem field has valid value
  ' it should be set within interval from 0 to content.Getchildcount()
  if content <> invalid and m.top.jumpToItem >= 0 and content.GetChildCount() > m.top.jumpToItem
      m.top.itemFocused = m.top.jumpToItem
  end if
end sub

sub OnItemFocusedChanged(event as Object)' invoked when another item is focused
  focusedItem = event.GetData() ' get position of focused item
  content = m.top.content.GetChild(focusedItem) ' get metadata of focused item
  SetDetailsContent(content) ' populate DetailsScreen with item metadata
end sub

' The OnKeyEvent() function receives remote control key events
function OnkeyEvent(key as String, press as Boolean) as Boolean
  result = false
  if press
      currentItem = m.top.itemFocused ' position of currently focused item
      ' ' handle "left" button keypress
      ' if key = "left"
      '     ' navigate to the left item in case of "left" keypress
      '     m.top.jumpToItem = currentItem - 1 
      '     result = true
      ' ' handle "right" button keypress
      ' else if key = "right" 
      '     ' navigate to the right item in case of "right" keypress
      '     m.top.jumpToItem = currentItem + 1 
      '     result = true
      ' end if
  end if
  return result
end function
Sub changeContent() 'Changes info to be displayed on the overhang
    contentItem = m.RowList.content.getChild(m.RowList.rowItemFocused[0]).getChild(m.RowList.rowItemFocused[1])
    'contentItem is a variable that points to (rowItemFocused[0]) which is the row, and rowItemFocused[1] which is the item index in the row

    m.top.backgroundUri = contentItem.HDPOSTERURL 'Sets Scene background to the image of the focused item
    m.Poster.uri = contentItem.HDPOSTERURL 'Sets overhang image to the image of the focused item
    m.Title.text = contentItem.TITLE 'Sets overhang title to the title of the focused item
    m.Description.text = contentItem.DESCRIPTION ' Sets overhang description to the description of the focused item
End Sub
