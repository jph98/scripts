# React Native

## Resources

* Components - http://www.awesome-react-native.com/
* Showcase - https://facebook.github.io/react-native/showcase.html
* JS Coach - https://js.coach/?collection=React+Native
* Components and API's - https://facebook.github.io/react-native/docs/components-and-apis.html

Setup Guide - https://habiletechnologies.com/blog/getting-started-react-native-complete-setup-guide/

* Use Expo - previewing the apps

Platform Specific Code - https://facebook.github.io/react-native/docs/platform-specific-code.html

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

* Provide way for simple scrolling
* Can also enable swiping (pageindEnabled) and zooming with this

https://facebook.github.io/react-native/docs/using-a-scrollview.html

## FlatList

ListView provides a way to display simple lists of items:
* data - list of items
* renderItem - return a formatted display component

https://facebook.github.io/react-native/docs/using-a-listview.html

## Networking

* Provides the fetch API
* e.g. fetch('https://mywebsite.com/mydata.json');
* POST example follows:

```
 async componentDidMount() {
    try {
      let response = await fetch('https://facebook.github.io/react-native/movies.json');
      let responseJson = await response.json();
      this.setState({
        isLoading: false,
        dataSource: responseJson.movies,
      }, function(){
  
      });
    } catch (error) {
      console.error(error);
    }
  }
```

See: https://developer.mozilla.org/en-US/docs/Web/API/Request
* Async, returns a promise
* Can also use the standard async/await example

n.b. iOS will block requests that aren't encrypted - https://facebook.github.io/react-native/docs/integration-with-existing-apps.html#test-your-integration

You can also use XMLHttpRequest - https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest

React Native also supports WebSockets
