# README

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## setup

```sh
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

## Example

### Request

```sh
curl -X GET \
     -H 'Authorization: Token 6f916ae6-8472-463a-9808-6af19e459541' \
     -d "haute_couture[query]=WITH comments AS (SELECT comments.id, content, users.name AS user_name, comments.created_at FROM comments JOIN users ON comments.user_id = users.id), likes AS (SELECT COALESCE(users.name, '匿名') AS user_name, likes.created_at, comment_id FROM likes LEFT OUTER JOIN users ON likes.user_id = users.id) SELECT comments.id, content, comments.user_name, JSON_AGG(likes ORDER BY likes.created_at DESC) AS liked_by FROM comments JOIN likes ON likes.comment_id = comments.id GROUP BY 1, 2, 3" \
     localhost:3000/haute_couture | jq
```

### Response

```json
[
  {
    "id": 8,
    "content": "hoge",
    "user_name": "yancya",
    "liked_by": [
      {
        "user_name": "匿名",
        "created_at": "2017-09-20T05:10:20.676045",
        "comment_id": 8
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:34.871388",
        "comment_id": 8
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:29.185687",
        "comment_id": 8
      }
    ]
  },
  {
    "id": 9,
    "content": "fuga",
    "user_name": "yancya",
    "liked_by": [
      {
        "user_name": "匿名",
        "created_at": "2017-09-20T05:10:23.789931",
        "comment_id": 9
      },
      {
        "user_name": "testuser",
        "created_at": "2017-09-18T05:23:01.764913",
        "comment_id": 9
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:32.062099",
        "comment_id": 9
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:26.740116",
        "comment_id": 9
      }
    ]
  },
  {
    "id": 10,
    "content": "piyo",
    "user_name": "yancya",
    "liked_by": [
      {
        "user_name": "testuser",
        "created_at": "2017-09-18T05:23:07.392301",
        "comment_id": 10
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:36.449477",
        "comment_id": 10
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:33.455075",
        "comment_id": 10
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:23.85745",
        "comment_id": 10
      }
    ]
  },
  {
    "id": 11,
    "content": "it is secret",
    "user_name": "yancya",
    "liked_by": [
      {
        "user_name": "testuser",
        "created_at": "2017-09-18T05:23:10.6083",
        "comment_id": 11
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:04:19.505836",
        "comment_id": 11
      }
    ]
  },
  {
    "id": 13,
    "content": "it is not secret",
    "user_name": "testuser",
    "liked_by": [
      {
        "user_name": "testuser",
        "created_at": "2017-09-18T05:23:15.535289",
        "comment_id": 13
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:15:50.857694",
        "comment_id": 13
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:13:34.048887",
        "comment_id": 13
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:11:50.945295",
        "comment_id": 13
      },
      {
        "user_name": "yancya",
        "created_at": "2017-09-18T05:11:48.028928",
        "comment_id": 13
      }
    ]
  }
]
```
