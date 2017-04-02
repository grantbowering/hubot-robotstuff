Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/robotstuff.coffee')


class MockResponse extends Helper.Response
  random: (items) ->
   items[0]

describe 'robotstuff', ->
 room = null
 beforeEach ->
    room = helper.createRoom({'httpd': false, 'response': MockResponse})

  it 'should think about robots', ->
    room.user.say('alice', 'what do you guys think?').then =>
      expect(room.messages).to.eql [
        ['alice', 'what do you guys think?']
        ['hubot', 'Me? Mostly about robots... sexy, sexy robots. *whirrr*']
      ]

  it 'should feel things when other people feel things', ->
    room.user.say('alice', 'I feel lousy today').then =>
      expect(room.messages).to.eql [
        ['alice', 'I feel lousy today']
        ['hubot', 'I feel metallic. 🤖']
      ]

  it 'should feel things when other people ask how it feels', (done) ->
    room.user.say('alice', 'how do you feel').then =>
      expect(room.messages).to.eql [
        ['alice', 'how do you feel']
        ['hubot', 'I feel metallic. 🤖']
      ]
      setTimeout -> 
        expect(room.messages).to.eql [
          ['alice', 'how do you feel']
          ['hubot', 'I feel metallic. 🤖']
          ['hubot', 'Thank you for asking.']
        ]
        done()
      , 1100

  it 'should feel things when other people ask how it is', (done) ->
    room.user.say('alice', 'how are you').then =>
      expect(room.messages).to.eql [
        ['alice', 'how are you']
        ['hubot', 'I feel metallic. 🤖']
      ]
      setTimeout -> 
        expect(room.messages).to.eql [
          ['alice', 'how are you']
          ['hubot', 'I feel metallic. 🤖']
          ['hubot', 'Thank you for asking.']
        ]
        done()
      , 1100

  it 'should feel things when other people ask how it is doing', (done) ->
    room.user.say('alice', 'how are you doing today @hubot?').then =>
      expect(room.messages).to.eql [
        ['alice', 'how are you doing today @hubot?']
        ['hubot', 'I feel metallic. 🤖']
      ]
      setTimeout -> 
        expect(room.messages).to.eql [
          ['alice', 'how are you doing today @hubot?']
          ['hubot', 'I feel metallic. 🤖']
          ['hubot', 'Thank you for asking.']
        ]
        done()
      , 1100

  it 'should leave it alone when it\'s not a how are you doing question', ->
    room.user.say('alice', 'how are you going to succeed').then =>
      expect(room.messages).to.eql [
        ['alice', 'how are you going to succeed']
      ]

  it 'should respond to who are you', ->
    room.user.say('alice', 'who are you').then =>
      expect(room.messages).to.eql [
        ['alice', 'who are you']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should respond to who\'s hubot', ->
    room.user.say('alice', 'who\'s hubot').then =>
      expect(room.messages).to.eql [
        ['alice', 'who\'s hubot']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should ignore who are you talking about', ->
    room.user.say('alice', 'who are you talking about').then =>
      expect(room.messages).to.eql [
        ['alice', 'who are you talking about']
      ]

  it 'should respond to who the fuck is hubot', ->
    room.user.say('alice', 'who the fuck is hubot').then =>
      expect(room.messages).to.eql [
        ['alice', 'who the fuck is hubot']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should respond to what are you @hubot?', ->
    room.user.say('alice', 'what are you @hubot?').then =>
      expect(room.messages).to.eql [
        ['alice', 'what are you @hubot?']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should respond to are you a bot', ->
    room.user.say('alice', 'are you a bot?').then =>
      expect(room.messages).to.eql [
        ['alice', 'are you a bot?']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should respond to are you a human or a robot', ->
    room.user.say('alice', 'are you a human or a robot').then =>
      expect(room.messages).to.eql [
        ['alice', 'are you a human or a robot']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]

  it 'should respond to is hubot human', ->
    room.user.say('alice', 'is hubot human').then =>
      expect(room.messages).to.eql [
        ['alice', 'is hubot human']
        ['hubot', 'http://i.imgur.com/QxCKIM5.jpg']
      ]