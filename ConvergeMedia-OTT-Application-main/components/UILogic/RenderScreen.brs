sub RenderGridContent()
  InitScreenStack()
  InitGridScreen()
  InitFilmScreen()
  InitShowScreen()
  ShowGridScreen()
  RunContentTask("Grid")
 ' print m.screenStack
end sub

sub RenderFilmContent()
  InitScreenStack()
  ShowFilmScreen()
  RunContentTask("Film")
 ' print m.screenStack
end sub

sub RenderShowContent()
  InitScreenStack()
  ShowShowScreen()
  RunContentTask("Show")
 ' print m.screenStack
end sub

sub UnrenderContent()
  RemoveGridScreen()
  RemoveFilmScreen()
  RemoveShowScreen()
end sub
