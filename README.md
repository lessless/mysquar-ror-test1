# Welcome to RoR test project

## TODO

### Create JSON APIs

  1. Rank by recency
  2. Add pagination
  3. Create likes table and its association to posts
  4. Rank by hot (reach certain amount of likes in a period of time)
    + 5 likes within last 1 hour.

  5. Rank by trending (on-the-fly calculation)
    + Sort by scores
    + Score = (CreatedAt - AnchorTime) / 7200 + Log2(Likes)
    + This formula is similar to Reddit ranking algorithm.

### Run the test suite and make it green ;)

