Sub Init()
    m.poster = m.top.findNode("poster")
 End Sub
sub OncontentSerieset() ' invoked when item metadata retrieved
    content = m.top.itemContent
    ' set poster uri if content is valid
    if content <> invalid 
        m.top.FindNode("poster").uri = content.hdPosterUrl
    end if
end sub