# README

1) One to many association. Product belongs to categoriation 

2. Pagination on Products pages

3. Basic and Advanced search functionality with a backend search database that is purged for searches older than a month old.

4. Endless page scroll for products and searches pages. Extended will_paginate functionality in products.js.coffee, searches.js.coffee and their respective views.

5. Non activerecord based model with controller with index and show actions/view rendering products in by alphabet

6. Added Faker and populate gems to fill database with test data to simulate production, /lib/tasks/populate rake job created

7. Shopping cart integration  -  ActiveMerchant Integration

8. Products with Dynamic product_types and Categories through ancestry