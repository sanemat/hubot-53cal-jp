chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe '53cal-jp', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/53cal-jp')(@robot)

  it 'registers a respond listener today', ->
    expect(@robot.respond).to.have.been.calledWith(/ゴミ 今日/)

  it 'registers a respond listener tomorrow', ->
    expect(@robot.respond).to.have.been.calledWith(/ゴミ 明日/)
