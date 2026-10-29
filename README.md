# Experiment 6 – Dashboard and Scorecard Development using Power BI
Business Intelligence Lab · Unit 2 · Session 6 · Global Superstore

## 1. How to open (3 steps)
1. Extract the whole ZIP to a normal folder (e.g. `C:\Experiment6_PowerBI`). Do not open it from inside the ZIP.
2. Double-click **`Step1_Set_Data_Path.bat`** – it writes the location of the `Data` folder into the project.
   (Manual alternative: open the project, *Home → Transform data → Edit parameters*, set `DataFolderPath` to the full path of the `Data` folder **ending with a backslash**, e.g. `C:\Experiment6_PowerBI\Data\`.)
3. Double-click **`Experiment6.pbip`** → Power BI Desktop opens → click **Refresh** on the Home ribbon.
   If Power BI asks about a data source, choose *File* → *Anonymous/Windows* and Connect. Use a current Power BI Desktop (PBIR / TMDL format; if the project does not open, enable *File → Options → Preview features → "Power BI Project (.pbip) save option"* and *"Store reports using enhanced metadata format (PBIR)"*, restart).

## 2. What is inside
| Item | Purpose |
|---|---|
| `Experiment6.pbip` | Project file – open this |
| `Experiment6.SemanticModel/` | Data model in TMDL: tables, relationship, DAX measures |
| `Experiment6.Report/` | Report in PBIR: 3 pages, all visuals |
| `Data/Global_Superstore_2018.xlsx` | Source data (sheet *Orders*, 51,290 rows, 2014–2017) |
| `Data/Targets.csv` | Targets for the scorecard (Year × Region) – editable in Excel |

The three Global Superstore workbooks you attached are byte-identical, so only one copy is used. `Employee_DB.xlsx` (HR data, unrelated to this experiment) is not used.

## 3. Model
`Orders` (fact) ← `Calendar` (1-to-many on Order Date) · `Targets` and `Scorecard` are stand-alone helper tables.

Key measures (table *Orders*): Total Sales = `SUM(Sales)`, Total Profit = `SUM(Profit)`, Total Orders = `DISTINCTCOUNT(Order ID)`, Profit Margin % = Profit ÷ Sales, Sales Top 10 Customers (RANKX ≤ 10).
Scorecard measures (`SC …`): actual, target, achievement %, status text and status colour.

## 4. Lab steps → where to find them
| Lab step | In the project |
|---|---|
| Part A – planning / layout sketch | Section 6 below |
| Step 5 – KPI cards | Page 1: Total Sales, Total Profit, Total Orders, Profit Margin % |
| Step 6 – visuals | Page 1: Sales by Region, Sales by Category, Monthly Sales Trend, Top 10 Customers, Profit by Segment (+ Profit by Category) |
| Step 7 – formatting | Same navy/teal palette, white cards with rounded borders, titles, data labels |
| Step 8 – slicers | Year, Region, Category (dropdowns; Year and Region are synced across pages) |
| Steps 9–10 – interactivity test | Click any bar/slicer – every visual cross-filters. Test script in section 7 |
| Steps 11–13 – scorecard | Page 2: Sales / Profit / Orders target vs actual, status **✔ Achieved / ◐ Partially Achieved / ✖ Not Achieved**, green/amber/red conditional formatting, plus a region-level scorecard |
| Steps 14–16 – analysis | Page 3 (findings + recommendation) – also section 5 |

**Scorecard rules.** Achievement % = Actual ÷ Target. ≥ 100 % Achieved, 80–99.9 % Partially Achieved, < 80 % Not Achieved. Target = previous-year actual + 20 % for each Region (2014 has no previous year, so its target = its own actual, i.e. baseline). The dataset has no official targets, so these are illustrative – edit `Data/Targets.csv` to change them and click Refresh. Targets are set per Year × Region, so the scorecard ignores the Category slicer.

## 5. Business analysis (all years, 2014–2017)
Overall: **$12.64M sales, $1.47M profit, 25,728 orders, 11.6 % margin.**
* **Best region:** Western Europe – $218K profit on $1.73M sales (12.6 % margin).
* **Worst region:** Western Asia – $53.9K loss on $317K sales (−17.0 %). Western Africa (−$50.4K) and Central Asia (−$7.3K) also lose money.
* **Most profitable category:** Technology – $663.8K profit (14.0 % margin).
* **Least profitable category:** Furniture – $285.1K profit (6.9 % margin); Tables alone lose $64.1K.
* **Recommendation:** Cap discounts at 30 % (manager approval above that). Orders discounted > 30 % earned $1.55M sales but lost $793.5K, whereas all other orders earned $2.26M profit. Loss-making regions average 35–43 % discount, best regions 5–9 %, Tables 29 %. Tightening discounts there and re-pricing Furniture/Tables should lift profit without extra sales.
(Best/worst are judged by profit; the page-3 chart re-computes for any slicer selection.)

## 6. Dashboard layout sketch (Part A)
```
+--------------------------------------------------------------------------+
| Global Superstore – Executive Dashboard        [Year] [Region] [Category]  |
+----------------+----------------+----------------+-----------------------+
|  Total Sales   |  Total Profit  |  Total Orders  |  Profit Margin %      |
+----------------+----------------------------------+-----------------------+
| Sales by       | Monthly Sales Trend (line)       | Sales by Category     |
| Region (bar)   +----------------------------------+-----------------------+
|                | Top 10 Customers (bar)           | Profit by Segment     |
|                |                                  +-----------------------+
|                |                                  | Profit by Category    |
+----------------+----------------------------------+-----------------------+
```
Why these visuals: cards for single KPIs, bars for ranking categories, line for time trend, column for a few segments.

## 7. Interactivity test (Steps 9–10)
1. Select **Year = 2017** → all cards, charts and the trend change.
2. Add **Region = Western Europe** → Top 10 customers and category charts re-rank.
3. Add **Category = Technology** → pages 1 and 3 respond (page 2 ignores Category by design).
4. Click a bar in *Sales by Region* → the other visuals cross-filter; click again to clear.
5. Go to page 2 – the Year/Region slicers are synced and the statuses change.
