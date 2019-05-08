# React Next JS

## Shared Components

* As common header components.
* As Layouts

Layouts could be higher order components or could take content as a prop and display

## Props 

Pass props with:

```
<PostLink id="hello-nextjs" title="Hello Next.js" />

<Link as={`/p/${props.id}`} href={`/post?title=${props.title}`}>
  <a>{props.title}</a>
</Link>
```

## Routing

Custom Server Routing - https://github.com/zeit/next.js#custom-server-and-routing

## Server-Side

Retrieving data - use Axios or isomorphic unfetch

```
Index.getInitialProps = async function() {
}
```

## Styling

Next.js comes preloaded with a CSS in JS framework called styled-jsx

Global Selectors - https://github.com/zeit/styled-jsx#one-off-global-selectors

```
<style jsx global>{`
```
