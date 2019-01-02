# Phaser Notes

## Resources

* Phaser Youtube - https://www.youtube.com/results?search_query=phaser+game
* HTML5 Games Programming With Phaser 
* Phaser Learn - https://phaser.io/learn

## Images

* Shapes (+ Negative Space) > Cleanup > Shading > Choose Palette > Colour
* Piskels to create images
* Asperite to animate

## Concepts

* Each screen - scene with separate resources etc...
* Scenes are added to the games configuration object
* Each class extends Phaser.Scene
* Each has a constructor(), preload() and create() function
* preload is used (during boot) to load images up, amongst other things
* You can transition to new scenes with this.scene.start() passing in the name

n.b. Always save images as PNG as this format has the advantages of being lossless – it does not lose quality when saved – and supports alpha channel (transparency).
