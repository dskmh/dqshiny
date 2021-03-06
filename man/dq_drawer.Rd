% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dq_drawer.R
\name{dq_drawer}
\alias{dq_drawer}
\alias{update_dq_drawer}
\title{Creates a drawer sidebar element}
\usage{
dq_drawer(
  id = NULL,
  ...,
  drawer_style = NULL,
  btn_style = NULL,
  size = NULL,
  direction = c("left", "right", "top", "bottom")
)

update_dq_drawer(id, open)
}
\arguments{
\item{id}{optional element id, useful if current state is needed}

\item{...}{content elements, must be named since those will be used as button
labels, can also be a named list}

\item{drawer_style, btn_style}{optional character specifying additional styles}

\item{size}{optional size of the drawer (width or height depending on
direction), can be any valid CSS unit (see
\code{\link{validateCssUnit}})}

\item{direction}{optional, specifies the direction the drawer comes from, one
of c("left", "right", "top", "bottom)}

\item{open}{name of the content element to show, NULL to close drawer}
}
\value{
drawer element tag
}
\description{
Creates a drawer element with buttons to draw out different
content elements.
}
\examples{
## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    dq_drawer(
      id = "myDrawer",
      Config = div(actionButton("hide", "Close drawer")),
      Red = div(style = "background: red;width: 100\%;height: 100\%;"),
      "Green Color!" = div("RED!!!!", style = "background: green;"),
      direction = "left", size = 250
    ),
    fluidRow(column(
      3, offset = 5,
      "Current page:", textOutput("drawerVal"),
      actionButton("show", "Show Green")
    ))
  ),
  server = function(input, output) {
    output$drawerVal <- renderText(input$myDrawer)
    observeEvent(input$show, update_dq_drawer("myDrawer", "Green Color!"))
    observeEvent(input$hide, update_dq_drawer("myDrawer", NULL))
  }
)

}
}
\author{
richard.kunze
}
