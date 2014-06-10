# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   sanemat[@<org>]
gomiCalJp = require '53cal-jp-scraper'
moment = require 'moment'
scraper = gomiCalJp({ city: '1130104', area: '1130104154' })

module.exports = (robot) ->
  robot.respond /ゴミ 明日/, (msg) ->
    day = moment().add('days', 1)
    dayString = day.format('YYYY-MM-DD')
    scraper.whatDate dayString, (err, data) ->
      gomi = if data.result[dayString] then data.result[dayString] + 'です。' else 'ゴミの収集がありません。'
      msg.reply day.format('YYYY-MM-DD dddd') + ' ' + 'の[' + data.meta.areaName + ']は' + gomi

  robot.respond /ゴミ 今日/, (msg) ->
    day = moment()
    dayString = day.format('YYYY-MM-DD')
    scraper.whatDate dayString, (err, data) ->
      gomi = if data.result[dayString] then data.result[dayString] + 'です。' else 'ゴミの収集がありません。'
      msg.reply day.format('YYYY-MM-DD dddd') + ' ' + 'の[' + data.meta.areaName + ']は' + gomi
