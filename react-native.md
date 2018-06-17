# React Native

Setup Guide:

https://habiletechnologies.com/blog/getting-started-react-native-complete-setup-guide/

## Basics

* Embed variable in JSX with {}
* this.props allows you to store variables and reuse across your app
* Text component
* Image component
* View - container for other components

Component Example
```
export default class Example extends Component {

  constructor() {}
  render() {}
}
AppRegistry.registerComponent('Example', () => Example);
```

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
* alignItems allows for horz change
```
 <View style={{
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
      }}>
```

More layout options here - https://facebook.github.io/react-native/docs/layout-props.html

## Text Input

* TextInput - onChangeEvent fires off the back of this to allow you to update something
* Text - standard text view components

## Touches

Display a button with an alert

```
<Button
          onPress={() => {
            Alert.alert('Yowie!');
          }}
          title="Click Me"/>
```

If the basic button doesn't work for you then you can create your own touchable components.

* TouchableHighlight - button
* TouchableNativeFeedback - android trails after press
* TouchableOpacity - when you want to dim everything ele
* TouchableWithoutFeedback - tap, but no feedback

Long press - pass a function to the onLongPress props of any of the "Touchable" components.

## Scrollviews

