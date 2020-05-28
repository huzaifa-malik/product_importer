Scenario - Product Import via File Upload
---------------------------

Story: A new  US branch needs to be onboarded, for this we got a new feature request from our product owner.

The user should be able to upload a csv to import products into the database. This data should then be shown in a list.

The upload should work multiple times and always update the corresponding products.
Bonus Feature: Products that are not in the CSV get deleted (can be enabled via checkbox)

Lines in the CSV represent steel products.

An example CSV is in the repo.
Here is some help to understand the CSV structure:

PART_NUMBER = identifier for a product
BRANCH_ID = which  branch produces the product (TUC = tucson, CIN = cincinnati)
PART_PRICE = price in USD
SHORT_DESC = short description text about the product
