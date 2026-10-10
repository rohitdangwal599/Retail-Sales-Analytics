--------------------------------------------------------------
Band Category Summary
--------------------------------------------------------------

let
    Source = retail_sales_dataset,
    #"Removed Other Columns" = Table.SelectColumns(Source,{"Customer ID", "Product Category", "Total Amount", "Customer_value Band"}),
    #"Grouped Rows" = Table.Group(#"Removed Other Columns", {"Product Category", "Customer_value Band"}, {{"Revenue", each List.Sum([Total Amount]), type nullable number}, {"Transactions", each Table.RowCount(_), Int64.Type}})
in
    #"Grouped Rows"