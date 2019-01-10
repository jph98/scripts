# Phaser Notes

See: 

https://photonstorm.github.io/phaser3-docs/index.html

## Resources

* Tutorials - http://labs.phaser.io/
* Phaser Youtube - https://www.youtube.com/results?search_query=phaser+game
* HTML5 Games Programming With Phaser 
* Phaser Learn - https://phaser.io/learn
* Examples - https://leanpub.com/html5shootemupinanafternoon/readJonathans-MacBook-Pro:003-shootemup
* Phaser 3 Graphics - https://phaser.io/news/2019/01/introduction-to-phaser-3-graphics
* 15 Games - https://academy.zenva.com/product/the-complete-mobile-game-development-course-platinum-edition/?zva_src=gda-topdown-tiled


## Techniques

* Real Time Socket Server Example - https://www.dynetisgames.com/2017/03/06/how-to-make-a-multiplayer-online-game-with-phaser-socket-io-and-node-js/
* Tilemaps - https://itnext.io/@michaelwesthadley
* Pathfinding - https://phaser.io/news/2018/03/pathfinding-and-phaser-3
* Game Analytics - http://phaser.io/tutorials/game-analytics

## Specific Game Exercises

* Mario - https://github.com/nkholski/phaser3-es6-webpack
* Turn Based RPG - https://gamedevacademy.org/phaser-rpg-tutorial/?a=13
* Space Hipster - https://gamedevacademy.org/html5-phaser-tutorial-spacehipster-a-space-exploration-game/
* Tower Defence - https://phaser.io/news/2018/12/tower-defense-tutorial
* zNumbers (Tile) - https://phaser.io/news/2017/10/znumbers-game-tutorial

## Specific Game - Complete Examples

* Theodoric (RPG) - https://github.com/tlmader/theodoric
* Salazar The Alchemist (Tile) - http://www.agame.com/game/salazar-the-alchemist
* 

## Image Work

* Shapes (+ Negative Space) > Cleanup > Shading > Choose Palette > Colour
* Piskels to create images
* Asperite to animate
* Tiled to create maps - https://www.mapeditor.org/

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








