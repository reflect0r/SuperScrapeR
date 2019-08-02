library(shiny)
library(shinydashboard)


#code cleanup coming soon boys


header <- dashboardHeader(title = "SuperScraper")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Home", tabName = "home", icon = icon("dashboard")),
        menuItem("Tools",tabName = "tools", icon = icon("th")),
        menuItem("Discord", icon = icon("discord"),
        href="https://discord.gg/WnaeUD4"),
        menuItem("Status", tabName = "status", icon = icon("exclamation-circle"))
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "home",
        h2("Home Page Content")
        ),

        tabItem(tabName = "tools",
        h2("Tools page content")
        ),

        tabItem(tabName = "status",
        fluidRow(
            #TODO: make the uptime valueBox dynamic
            #its static rn and that makes no sense for what it is
        valueBox("100 %", "Uptime", icon = icon("list")),
        valueBoxOutput("progress"),
        valueBoxOutput("apis")
        ),
        fluidRow(

        box(width = 4, actionButton("count", "Increase Progress"))

        )

        )
        )

    )


ui <- dashboardPage(header, sidebar, body)


server <- function(input, output) {
output$progress <- renderValueBox({
    valueBox(
        paste0(1 + input$count, "%"), "Progress", icon = icon("percentage"),
        color = "red"
    )
})

output$apis <- renderValueBox({
    valueBox(
        "0", "Avaliable APIs", icon = icon("cog"),
        color = "purple"
    )
})
}





shinyApp(ui = ui, server = server)