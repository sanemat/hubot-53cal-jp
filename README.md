# hubot-53cal-jp

Check the day taking out the trash JP.

See [`src/53cal-jp.coffee`](src/53cal-jp.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-53cal-jp --save`

Then add **hubot-53cal-jp** to your `external-scripts.json`:

```json
["hubot-53cal-jp"]
```

## Configuration
  You set environmental variables like below:
  `heroku config:set GOMICAL_JP_CITY=1130104 GOMICAL_JP_AREA=1130104154`
  You can get city and area from [here](http://www.53cal.jp/area_sv/)

## Sample Interaction

```
user1>> hubot ゴミ 今日
hubot>> 2014-06-10 Tuesday の[南大井6丁目18番地(大森住宅）以外]は燃やすごみです。
```
