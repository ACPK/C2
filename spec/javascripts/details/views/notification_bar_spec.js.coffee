#= require jquery
#= require ladda/ladda.min
#= require ladda/ladda.jquery.min
#= require details/views/notifications
#= require details/details_helper
#= require ladda/spin.min

describe 'Notification', ->

  describe '#setup', ->
    it "set in view mode", ->
      notification = new Notifications(getNotificationContent())  
      expect(notification instanceof Notifications).to.eql(true)
  
  describe '#_postNotification', ->
    it "create a notification", ->

  describe '#_closeButton', ->
    it "make sure the close button deletes the notification", ->
  
  describe '#_prepare', ->
    it "prepare a notification", ->
    it "handle a notification without a title", ->
    it "handle a notification without a content", ->
    it "handle a notification without a type", ->
    it "handle a notification with a timeout", ->
  
  describe '#clearAll', ->
    it "remove all four notifications", ->
  
  describe '#clearOne', ->
    it "remove a single notification", ->
  
  describe '#initClose', ->
    it "make sure notification bar closes after the init period with timeout", ->
    it "cancel the auto close on click of the notification", ->

  describe '#generate', ->
    it "create the expected notification bar", ->
    it "change params without timeout", ->
    it "change params without title", ->
    it "change params without type", ->
