# テストケース

| time | range  | expected | result |
| ---- | ------ | -------- | ------ |
| 4    | 5 - 22 | false    | ok     |
| 5    | 5 - 22 | true     | ok     |
| 21   | 5 - 22 | true     | ok     |
| 22   | 5 - 22 | false    | ok     |
| 21   | 22 - 5 | false    | ok     |
| 22   | 22 - 5 | true     | ok     |
| 4    | 22 - 5 | true     | ok     |
| 5    | 22 - 5 | false    | ok     |
| 0    | 22 - 5 | true     | ok     |
| 5    | 5 - 5  | true     | ok     |
