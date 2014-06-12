# Description
#   Check the day taking out the trash JP.
#
# Dependencies:
#   "53cal-jp-scraper"
#   "moment"
#
# Configuration:
#   GOMICAL_JP_CITY, GOMICAL_JP_AREA
#     see: http://www.53cal.jp/area_sv/
#
# Commands:
#   hubot ゴミ 今日 - your scheduled collection day today
#   hubot ゴミ 明日 - your scheduled collection day tomorrow
#
# Author:
#   sanemat
gomiCalJp = require '53cal-jp-scraper'
moment = require 'moment'
sprintf = require("sprintf-js").sprintf
cronJob = require('cron').CronJob

city = process.env.GOMICAL_JP_CITY || '1130104'
area = process.env.GOMICAL_JP_AREA || '1130104154'
# *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
cronTime = process.env.GOMICAL_JP_CRON_JOB || '0 31 18 * * *'
cronRoom = process.env.GOMICAL_JP_CRON_ROOM

scraper = gomiCalJp({ city: city, area: area })


module.exports = (robot) ->
  robot.respond /ゴミ\s+(明日|今日)/, (msg) ->
    day = if msg.match[1] == '今日' then moment() else moment().add('days', 1)
    dayString = day.format('YYYY-MM-DD')
    scraper.whatDate dayString, (err, data) ->
      gomi = if data.result[dayString] then data.result[dayString] + 'です。' else 'ゴミの収集がありません。'
      msg.reply sprintf('%s %s の[%s]は%s', msg.match[1], day.format('YYYY-MM-DD dddd'), data.meta.areaName, gomi)

module.exports = (robot) ->
  if cronTime && cronRoom
    new cronJob(cronTime, () ->
      day = moment().add('days', 1)
      dayString = day.format('YYYY-MM-DD')
      scraper.whatDate dayString, (err, data) ->
        gomi = if data.result[dayString] then data.result[dayString] + 'です。' else 'ゴミの収集がありません。'
        robot.send {room: cronRoom}, sprintf('%s %s の[%s]は%s', '明日', day.format('YYYY-MM-DD dddd'), data.meta.areaName, gomi)
    ).start()
