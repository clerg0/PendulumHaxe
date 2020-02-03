class Main extends hxd.App {
    var pdl : Pendulum;
    var tf : h2d.Text;

  override function init() {
    // creates a new object and put it at the center of the sceen
    pdl = new Pendulum(s2d, 100);
    pdl.setOrigin(Std.int(s2d.width / 2),Std.int(s2d.height / 2));

    // load the haxe logo png into a tile
    var tile = hxd.Res.ball.toTile();

    // change its pivot so it is centered
    tile = tile.center();

    var bmp = new h2d.Bitmap(tile, pdl);
    bmp.setScale(0.5);
    bmp.alpha = 1;
  }

  override function update(dt:Float) {
    // rotate our object every frame
    if( pdl != null ) {
        pdl.update(dt);
    }
  }

  static function main() {
    hxd.Res.initEmbed();
    new Main();
  }
}