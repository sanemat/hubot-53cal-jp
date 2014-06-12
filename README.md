# hubot-53cal-jp
[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-url]][daviddm-image]

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
  You set environmental variables(`GOMICAL_JP_CITY`, `GOMICAL_JP_AREA`) like below:
```
heroku config:set GOMICAL_JP_CITY=1130104 GOMICAL_JP_AREA=1130104154
```
  You can get city and area from [here](http://www.53cal.jp/area_sv/)

  You set `GOMICAL_JP_CRON_JOB`, `GOMICAL_JP_CRON_ROOM` like below:
```
heroku config:set GOMICAL_JP_CRON_JOB="0 0 19 * * *" GOMICAL_JP_CRON_ROOM="#general"
```

## Sample Interaction

```
user1>> hubot ゴミ 今日
hubot>> 2014-06-10 Tuesday の[南大井6丁目18番地(大森住宅）以外]は燃やすごみです。
```

[npm-url]: https://npmjs.org/package/hubot-53cal-jp
[npm-image]: https://badge.fury.io/js/hubot-53cal-jp
[travis-url]: https://travis-ci.org/sanemat/hubot-53cal-jp
[travis-image]: https://travis-ci.org/sanemat/hubot-53cal-jp.svg?branch=master
[daviddm-url]: https://david-dm.org/sanemat/hubot-53cal-jp.svg?theme=shields.io
[daviddm-image]: https://david-dm.org/sanemat/hubot-53cal-jp
[coveralls-url]: https://coveralls.io/r/sanemat/hubot-53cal-jp
[coveralls-image]: https://coveralls.io/repos/sanemat/hubot-53cal-jp/badge.png
