sub RunContentTask(screen as string)
    m.contentTask = CreateObject("roSGNode", "MainLoaderTask") ' create task for feed retrieving
    ' observe content so we can know when feed content will be parsed
    if screen = "Grid" 
        print "Onmaincontentloaded"
        m.contentTask.ObserveField("contentSeries", "OnMainContentLoaded")
    else  if screen ="Show"
        print "OnmaincontentloadedShow"
        m.contentTask.ObserveField("contentSeries","OnMainContentLoadedShow")
    else
        print "OnmaincontentloadedFilm"
        m.contentTask.ObserveField("contentFilm", "OnMainContentLoadedFilm")
    end if

    m.contentTask.control = "run" ' GetContent(see MainLoaderTask.brs) method is executed
    'm.loadingIndicator.visible = true ' show loading indicator while content is loading
end sub

sub OnMainContentLoaded() ' invoked when content is ready to be used
    m.GridScreen.SetFocus(true) ' set focus to GridScreen
    'm.loadingIndicator.visible = false ' hide loading indicator because content was retrieved
    m.GridScreen.content = m.contentTask.contentSeries ' populate GridScreen with content
end sub

sub OnMainContentLoadedFilm() ' invoked when content is ready to be used
    m.FilmScreen.SetFocus(true) ' set focus to GridScreen
    'm.loadingIndicator.visible = false ' hide loading indicator because content was retrieved
    m.FilmScreen.content = m.contentTask.contentFilm ' populate GridScreen with content
end sub

sub OnMainContentLoadedShow() ' invoked when content is ready to be used
    m.ShowScreen.SetFocus(true) ' set focus to GridScreen
    'm.loadingIndicator.visible = false ' hide loading indicator because content was retrieved
    m.ShowScreen.content = m.contentTask.contentSeries ' populate GridScreen with content
end sub

