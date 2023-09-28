sub Init()
  m.rowList = m.top.FindNode("rowList")
 
  ' label with item description
  m.Description = m.top.FindNode("Description")
  m.top.ObserveField("visible", "onVisibleChange")
  ' label with item title
  m.poster = m.top.FindNode("poster")
  m.rowList.SetFocus(true)

  m.RowList.observeField("rowItemFocused", "changeContent")
  m.Title = m.top.FindNode("Title")
  
end sub

sub OnVisibleChange() ' invoked when GridScreen change visibility
  if m.top.visible = true
      m.rowList.SetFocus(true) ' set focus to rowList if GridScreen visible
  end if
end sub

Sub changeContent() 'Changes info to be displayed on the overhang
  contentItem = m.RowList.content.getChild(m.RowList.rowItemFocused[0]).getChild(m.RowList.rowItemFocused[1])
  'contentItem is a variable that points to (rowItemFocused[0]) which is the row, and rowItemFocused[1] which is the item index in the row

  m.top.backgroundUri = contentItem.HDPOSTERURL 'Sets Scene background to the image of the focused item
  m.Poster.uri = contentItem.HDPOSTERURL 'Sets overhang image to the image of the focused item
  m.Title.text = contentItem.TITLE 'Sets overhang title to the title of the focused item
  m.Description.text = contentItem.DESCRIPTION ' Sets overhang description to the description of the focused item
End Sub