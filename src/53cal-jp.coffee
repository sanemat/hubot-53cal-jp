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
scraper = gomiCalJp({ city: '1130104', area: '1130104154' })

module.exports = (robot) ->
  robot.respond /ゴミ 明日/, (msg) ->
    day = '2014-06-10'
    scraper.whatDate day, (err, data) ->
      gomi = if data.result[day] then data.result[day] + 'です。' else 'ゴミの収集がありません。'
      msg.reply day + 'の' + data.meta.areaName + 'は' + gomi
