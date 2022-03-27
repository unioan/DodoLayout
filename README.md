# DodoLayout MVP

The UI is inspired by the app belonging to one of the best pizza makers☺️

The app have been designed to resemble DodoPizza app. 

## Demo

![DodoDemo](https://user-images.githubusercontent.com/76248402/160278695-51e5becc-aa39-49f8-a449-534387e832a9.gif)

## Objectives
- to design UI of the first screen to have resemblence with DodoPizza app;
- to make section with food categories stick to navigation bar;
- to scroll catagory view until the first item from the selected category appears in the upper side of the screen;
- to make categories section button change it's appearence if one was selected;
- to display a badge with a nuber of items added to the cart button in the tab controller;    
- to constraint UI elements to look good on different screen sizes. 

## Implementation
The main screen consist of tab bar controller and collection view. 
  - Tab bar controller have several controllers for different scenes. "Cart" bar button is able to display a badge when item is selected on the main controller. 
  - Collection view is composed of two sections and a header view. One section displays baner and the other menu items. Header is also a collection view which enables full controll over button selection and what apearence a particular button has to take.  

