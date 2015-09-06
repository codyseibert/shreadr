
module.exports = do ->
  touching: (r1, r2) ->
    not (
      r2.left > r1.right or
      r2.right < r1.left or
      r2.top > r1.bottom or
      r2.bottom < r1.top
    )
