library(shiny)
library(shinyMobile)
shinyApp(
  ui = f7Page(
    title = "Insert a tab Before the target",
    f7TabLayout(
      navbar = f7Navbar(
        title = "Tabs",
        hairline = FALSE,
        shadow = TRUE,
        leftPanel = TRUE,
        rightPanel = TRUE
      ),
      f7Tabs(
        animated = TRUE,
        id = "tabs",
        f7Tab(
          tabName = "Tab 1",
          icon = f7Icon("airplane"),
          active = TRUE,
          "Tab 1",
          f7Button(inputId = "add", label = "Add tabs")
        ),
        f7Tab(
          tabName = "Tab 2",
          icon = f7Icon("today"),
          active = FALSE,
          f7Button(inputId="stay", label = "Stay"),
          "Tab 2"
        )
      )
    )
  ),
  server = function(input, output, session) {
    observeEvent(input$stay, {
      f7Toast("Please stay")
    })
    observeEvent(input$add, {
      insertF7Tab(
        id = "tabs",
        position = "after",
        target = "Tab 1",
        tab = f7Tab (
          # Use multiple elements to test for accessor function
          f7Button(inputId = "add_dynamic", label = "Add dyn"),
          f7Text(inputId = "my_text", label ="Enter something", placeholder = "What?"),
          f7Text(inputId = "my_other", label ="Else:", placeholder = "Else ?"),
          tabName = paste0("tabx_", input$go), "Test2",
          icon = f7Icon("app_badge")
        ),
        select = TRUE
      )
    })
  }
)
