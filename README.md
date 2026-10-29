# Experiment 7 – Supporting Power BI project
Same project as Experiment 6 plus a new page **Advanced Analytics** (page 4).

## Open it
1. Extract the whole ZIP to a normal folder (e.g. `C:\Experiment7`).
2. Run `Step1_Set_Data_Path.bat` (writes the `Data` folder path into the project). Manual alternative: Home → Transform data → Edit parameters → `DataFolderPath` = full path of the `Data` folder, ending with `\`.
3. Open `Experiment7.pbip` in Power BI Desktop and click **Refresh**.
4. To get a `.pbix` file (deliverable 4): *File → Save as* → choose "Power BI files (*.pbix)".

## Pages
1. Executive Dashboard (Exp. 6) · 2. Business Scorecard (Exp. 6) · 3. Business Analysis (Exp. 6)
4. **Advanced Analytics (Exp. 7)** – Sales/Profit YoY %, profit margin, average discount, loss on loss-making lines; yearly sales vs profit; monthly margin trend; **profit by discount band**; profit by sub-category; margin by market and by segment.

## New model items
`Orders[Discount Band]` (calculated column), measures `Avg Discount %`, `Sales YoY %`, `Profit YoY %`, `Sales PY`, `Profit PY`, `Sales Share %`, `Loss from Loss-making Lines` (folder *4 Advanced analytics*).

## Screenshots for the report (Step 12)
Open each page, then File → Export → PDF, or use Windows + Shift + S, and paste into the Appendix of `Business_Insight_Report.docx`.
