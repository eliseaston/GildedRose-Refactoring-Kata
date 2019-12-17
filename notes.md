Small inn: buys and sells goods.
Goods deteriorate in value as they approach sell-by date.

All items have:
  * A SellIn value (number of days left to sell the item)
  * A Quality value (how valuable the item is)
  * Quality value minimum: 0
  * Quality value maximum: 50
  * After sell-by date, Quality value degrades twice as fast
  * At the end of each day, both values for each item is lowered.
  **EXCEPTIONS:**
      * "Aged Brie" Quality value increases as it gets older
      * "Sulfuras" has no SellIn value. Quality value == 80 and never changes
      * "Backstage passes" Quality value increases as it gets older:
        <= 10 days until concert => Quality value increases by 2
        <= 5 days until concert => Quality value increases by 3
        Past concert date => Quality value == 0


**Task:**
Add a new feature to the system so they can sell a new category of item ("Conjured items").
Properties of Conjured items:
  * Quality value degrades twice as quickly as normal items

**N.B.:**
CAN change UpdateQuality method
CAN write new code
MUST all still work correctly
CANNOT change Item class
CANNOT change Items property
