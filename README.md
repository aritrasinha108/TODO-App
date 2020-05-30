# todo_app
App to store todos

## Getting Started


The app opens with the list of todos which have been assigned to today's date. A calendar is displayed on the top just below the app bar. As soon as we select any other date, the list of todos for that day(if any) will be displayed on the screen. For the calendar, I have used the table_calendar packge. We can also add a new todo using the floating action button with a '+' sign at the bottom. On  pressing the button, a dialog box opens which asks you to enter the todo. As soon as we press the 'ok' button, the add event wiil be triggered which will yield a get todo state and this state has an attribute which is a list of maps. The maps contain the todo and the real index which is the index of the todo inside the Hive database. I used list view to print the list of todos wrapped inside a card which is a custom widget TodoCard (see todo_card.dart). Inside this card, the todo and it's status will be displayed. There are 4 buttons (4 icon buttons for deleting ,postponing/preponing and editing and 1 raised button to complete the todo). We can manipulate the todos using these buttons. Also, I tried to add  notifications to the app which will notify us about the pending todos for the day. The Notification will be cancelled if the todo is already completed or is deleted. Also a notification will pop when a todo is shifted to another date.

<div> 
  <img src="Screenshots and Recording/image.png" height="400.0" width="200.0">
  
<img src="Screenshots and Recording/image2.png" height="400.0" width="200.0">




</div>
<div>

<img src="Screenshots and Recording/gif1.gif" height="400.0" width="200.0">

<img src="Screenshots and Recording/gif2.gif" height="400.0" width="200.0">

<img src="Screenshots and Recording/gif3.gif" height="400.0" width="200.0">

  </div>

## The BLoc Pattern
In the Bloc pattern, there are 5 events and 1 state that is being used. Also Equatable has been used to check if there has been any change in the state(see the BLoc directory inside the lib directory).


## The Notification 
Flutter_local_notifications has been used as a third party package. I used a different file called notification.dart for handling notifications. There I declared a class NotificationManager.
The initialization, the getters and setters have been added there as functions. When a todo is added, the function showDailyNotification is called which will schedule the notification for the day it has been added. If the todo is deleted or completed before the day comes, the notification will be canceled. I think there is some problem with the code here. It works sometimes while it doesn't sometimes. Also, when I have added an instant notification after adding the todo and it works fine.

## Date comparison 
The date comparison has been done indivisually for day, month and year to avoid use of a third party package.
