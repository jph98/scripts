# React Native

Setup Guide:

https://habiletechnologies.com/blog/getting-started-react-native-complete-setup-guide/

## Basics

* Embed variable in JSX with {}
* this.props allows you to store variables and reuse across your app
* Text component
* Image component
* View - container for other components

## State

* init in constructor and call setState when you need to change it
* Would use Redux to manage state rather than call setState directly elsewhere
* State - https://reactjs.org/docs/react-component.html#setstate

## Style

* Names are camel cased from CSS - backgroundColor for example
* styles is used to enccapsulate the various style information

```
const styles = StyleSheet.create({
  bigblue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});
```

## Layout

* All dimensions are unitless
* Density independent pixels
* Fixed dimensions (1)
* Flex dimensions (2) - use flex: 1 to fill all space

For FlexLayout:
* Default is column, can change to row then use width/height
* justifyContent options (flex-start, center, flex-end, and stretch) can be used to distribute the children

```
<View style={{
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'space-between',
      }}>
```


