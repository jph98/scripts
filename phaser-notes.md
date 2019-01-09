# Phaser Notes

See: 

https://photonstorm.github.io/phaser3-docs/index.html

## Resources

* Phaser Youtube - https://www.youtube.com/results?search_query=phaser+game
* HTML5 Games Programming With Phaser 
* Phaser Learn - https://phaser.io/learn
* Examples - https://leanpub.com/html5shootemupinanafternoon/readJonathans-MacBook-Pro:003-shootemup
* Phaser 3 GRaphics - https://phaser.io/news/2019/01/introduction-to-phaser-3-graphics

## Specific Game Types

* Mario - https://github.com/nkholski/phaser3-es6-webpack

## Images

* Shapes (+ Negative Space) > Cleanup > Shading > Choose Palette > Colour
* Piskels to create images
* Asperite to animate

## Game Katas

* Platform Basicss
* Tile game
* Parallax Scrolling Endless Runner (Horz)
* Parallax Scrolling Endless Runner (Top Down)

## Concepts

* Each screen - scene with separate resources etc...
* Scenes are added to the games configuration object
* Each class extends Phaser.Scene
* Each has a constructor(), preload() and create() function
* preload is used (during boot) to load images up, amongst other things
* You can transition to new scenes with this.scene.start() passing in the name

n.b. Always save images as PNG as this format has the advantages of being lossless – it does not lose quality when saved – and supports alpha channel (transparency).

Sprite - can be animated, unlike an image

## State Management

state.start
* Preload (after all assets loaded then...
* Create
* Game Loop: Update > Render

## Physics

Phaser comes with 2 physics systems, Arcade and P2.

Arcade physics is limited to axis-aligned bounding box (AABB) collision checking.

You can enable debug with:

```this.game.debug.body(this.thing);```

Collision checking can be done as follows (with a callback to trigger on success):

```update: function () {
    this.physics.arcade.overlap(
      this.bullet, this.enemy, this.enemyHitCallback, null, this
    );
  },```

## Groups

Instead of creating objects on the fly you can use groups

Revive sprites from the group with - https://phaser.io/docs/2.3.0/Phaser.Sprite.html#reset

All objects are added to the World - https://phaser.io/docs/2.3.0/Phaser.World.html

## Damage

Sprites can be damaged - https://phaser.io/docs/2.3.0/Phaser.Sprite.html#damage








