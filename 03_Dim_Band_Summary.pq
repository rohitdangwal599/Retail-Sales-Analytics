--------------------------------------------------------------
Band Summary
--------------------------------------------------------------


let
    Source = Csv.Document(File.Contents("C:\Users\tonyr\OneDrive\Desktop\Retail Data Set\retail_sales_dataset.csv"),[Delimiter=",", Columns=9, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Transaction ID", Int64.Type}, {"Date", type date}, {"Customer ID", type text}, {"Gender", type text}, {"Age", Int64.Type}, {"Product Category", type text}, {"Quantity", Int64.Type}, {"Price per Unit", Int64.Type}, {"Total Amount", Int64.Type}}),
    #"Inserted Year" = Table.AddColumn(#"Changed Type", "Year", each Date.Year([Date]), Int64.Type),
    #"Inserted Month Name" = Table.AddColumn(#"Inserted Year", "Month Name", each Date.MonthName([Date]), type text),
    #"Inserted Month" = Table.AddColumn(#"Inserted Month Name", "Month", each Date.Month([Date]), Int64.Type),
    #"Renamed Columns" = Table.RenameColumns(#"Inserted Month",{{"Month", "Month Number"}}),
    #"Sorted Rows" = Table.Sort(#"Renamed Columns",{{"Month Number", Order.Ascending}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Sorted Rows",{{"Age", Int64.Type}}),
    #"Added Conditional Column" = Table.AddColumn(#"Changed Type1", "Custom", each if [Age] < 25 then "18-24" else if [Age] < 35 then "25-34" else if [Age] < 45 then "35-44" else if [Age] > 55 then "44-55" else "55 Plus"),
    #"Renamed Columns1" = Table.RenameColumns(#"Added Conditional Column",{{"Custom", "Age Group"}}),
    #"Inserted Start of Month" = Table.AddColumn(#"Renamed Columns1", "Start of Month", each Date.StartOfMonth([Date]), type date),
    #"Renamed Columns2" = Table.RenameColumns(#"Inserted Start of Month",{{"Start of Month", "Transaction Month"}}),
    #"Added Conditional Column1" = Table.AddColumn(#"Renamed Columns2", "Customer_value Band", each if [Total Amount] < 1500 then "Low Value" else if [Total Amount] = 1500 then "Medium Value" else "High Value"),
    #"Removed Other Columns" = Table.SelectColumns(#"Added Conditional Column1",{"Customer ID", "Quantity", "Price per Unit", "Product Category", "Total Amount", "Customer_value Band"}),
    #"Grouped Rows" = Table.Group(#"Removed Other Columns", {"Customer_value Band"}, {{"Avg_total_amt", each List.Average([Total Amount]), type nullable number}, {"Avg_qty", each List.Average([Quantity]), type nullable number}, {"Avg_price", each List.Average([Price per Unit]), type nullable number}})
in
    #"Grouped Rows"