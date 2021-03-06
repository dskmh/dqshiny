library(shiny)
shinyApp(
  ui = fluidPage(
    tags$script("var loaded = false;"),
    dqshiny::dq_handsontable_output("randomTable", 9L)
  ),
  server = function(input, output, session) {
    hw <- c("hello", "my", "funny", "world!")
    data <- data.frame(A = rep(hw, 50), B = hw[c(2L, 3L, 4L, 1L)],
      C = 1:50, D = 51:100, stringsAsFactors = FALSE)

    dqshiny::dq_render_handsontable("randomTable", data,
      filters = list("S", "T", list(type = "R", value = c(7, 17)), "A"), sorting = TRUE,
      page_size = c(17L, 5L, 500L, 1000L),
      table_param = list(afterRender = htmlwidgets::JS("function(e){setTimeout(function(){loaded = true;},500);}")),
      col_param = list(list(col = 1L, type = "dropdown", source = letters)),
      cell_param = list(list(row = 2:9, col = 2L, readOnly = TRUE))
    )
  }
)
