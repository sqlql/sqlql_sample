# README

## Example

### request

```sh
curl -X GET -H 'Authorization: Token 14efc767-a7a8-47ad-90b0-986016a10eac' -d "haute_couture[query]=SELECT comments.id, content, comment_users.name AS commented_by, ARRAY_AGG(like_users.name) AS liked_by FROM likes JOIN users AS like_users ON likes.user_id = like_users.id JOIN comments ON likes.comment_id = comments.id JOIN users AS comment_users ON comments.user_id = comment_users.id GROUP BY 1, 2, 3" localhost:3000/haute_couture
```

### response

```
[{"id":7,"content":"Hi, hello 2","commented_by":"yancya","liked_by":["yancya","yancya","yancya","yancya","yancya","yancya"]}]%
```
