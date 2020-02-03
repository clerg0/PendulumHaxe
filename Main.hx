import h2d.Graphics;

class Main extends hxd.App {
    var pdl : Array<Pendulum>;
    var scene : Scene;

  override function init() {
    // creates a new object and put it at the center of the sceen
    pdl = [];
    scene = new Scene(s2d);
    scene.setSize(s2d.width, s2d.height);

    for (i in 0...10) {
      var tmpPdl = new Pendulum(s2d, 150 + 50 * i);
      tmpPdl.setOrigin(Std.int(s2d.width / 2),Std.int(s2d.height / 2 - s2d.height / 3));

      /*
      // load the haxe logo png into a tile
      var tile = hxd.Res.ball.toTile();

      // change its pivot so it is centered
      tile = tile.center();

      var bmp = new h2d.Bitmap(tile, tmpPdl);
      bmp.setScale(0.5);
      bmp.alpha = 1;
      */
      pdl.push(tmpPdl);
    }

  }

  override function update(dt:Float) {
    // rotate our object every frame
    for (item in pdl) {
      if( item != null ) {
          item.update(dt);
      }
    }
  }

  static function main() {
    hxd.Res.initEmbed();
    new Main();
  }
}