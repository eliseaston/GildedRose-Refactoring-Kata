# Gilded Rose
## Refactoring exercise in Ruby

**Tech used**
* Ruby
* RSpec
* SimpleCov
* Rubocop

**To install this program**
* Fork and clone this repository
* Type `bundle install` in the command line

**To run the tests**
* Type `rspec` in the command line

**The program**

The program updates an inventory of stock for a tavern, The Gilded Rose. Every `Item` in the inventory has 3 properties: its name, sell-in value and quality value. By passing in an array (`items`) to the `GildedRose` class, and calling the `update_quality` method, each item will be updated accordingly:

* Normal item quality will reduce by 1 until their sell-by date, and by 2 afterwards
* Aged Brie quality will increase as their sell-in value decreases
* Backstage passes quality will increase in value until their sell-by date. Their quality increases by 1 if their sell-in value is more than 10, by 2 if their sell-in value is between 5 and 10, and by 3 if between 0 and 5. Their quality value reduces to 0 after their sell-by date has passed.
* Sulfuras has no sell-in value and a permanent quality value of 80. This does not change.
* Conjured Items (new category) quality reduces twice as quickly: i.e., by 2 until their sell-by date, and by 4 afterwards.


**My approach**

I first made a [notes.md](notes.md) file to clarify the requirements of the program and task.

I next wrote out the complex nested if statement from the legacy code, and colour-coded the if/else pairs to understand the structure of the code. [See here.](IMG_20191218_161405.jpg)

I used this colour coded if statement to draw a flowchart of the codebase's logic:
[Flowchart 1](IMG_20191218_161332.jpg)
[Flowchart 2](IMG_20191218_161338.jpg)
[Flowchart 3](IMG_20191218_161345.jpg)

I then wanted to test that the existing code was functional. In the spec test file, I created one of each item from the task instructions (e.g. Aged Brie, Sulfuras, Backstage passes and ordinary item) and ran a series of tests to make sure that the `update_quality` method worked as expected for each item's requirements, which it did.

Once I was confident the code worked and the tests passed, I started to refactor the code. These refactors included:

* Moving the `Item` class to a separate file.
* Refactoring the complex nested if statement to a switch/case statement, based on the `.name` property of each item. Firstly I thought this was more readable than a long if statement, and secondly I thought it would be easier to change if more items are added to the inventory in future.
* I encapsulated separate methods for each item. Again, I thought this would be more readable and easier to add additional items and methods in future.
* I noticed a lot of repetition across my methods, so I refactored to keep my code DRY. e.g., every item (except Sulfuras) reduces the item's sell_in value by 1, so I moved this to line 26 in the switch statement. I also had `unless item.quality > 50` and `unless item.quality < 0` repeated a lot through my code, so I created a `.check_limits` method and call this on line 27 for every item.
* I refactored the maximum and minimum quality values as Constants on lines 3 and 4. If these values change at all in future, this will make it easier to update the code.

Once I was happy with the refactoring of my code, I TDD adding a new 'Conjured Items' feature. I wrote tests to check that the quality value of a Conjured Item would reduce by 2 before its sell-by date, and by 4 afterwards. I then used my failing tests to add the code to the switch statement, and also a `update_conjured` method, to make the tests pass.
