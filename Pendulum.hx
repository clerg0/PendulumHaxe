import h2d.Object;
import h2d.Graphics;
import h2d.RenderContext;

class Pendulum extends Object {
    var stringLength:Float;
    var angle:Float;
    var aVelocity:Float;
    var aAcceleration:Float;
    var damping:Float;
    var xOrigin:Float;
    var yOrigin:Float;

    var customGraphics:h2d.Graphics;

    static var gravity:Float = 0.4;

    public function new( ?parent : h2d.Object, ?length : Float ){
        super(parent);
        stringLength = length;
        
        angle = Math.PI / 3;
        aVelocity = 0.0;
        aAcceleration = 0.0;
        damping = 0.999;

        customGraphics = new h2d.Graphics(parent);
    }

    public function update(dt:Float) {
        aAcceleration = (-1 * gravity / stringLength) * Math.sin(angle);

        aVelocity += aAcceleration;
        angle += aVelocity;

        aVelocity *= damping;

        //change position
        x = Std.int(stringLength*Math.sin(angle));
        y = Std.int(stringLength*Math.cos(angle));
        x += xOrigin;
        y += yOrigin;
    }

    public function setOrigin(x:Float, y:Float) {
        xOrigin = x;
        yOrigin = y;
    }

    override public function draw( ctx : RenderContext ) {
        customGraphics.beginFill(0xFF0000);
        customGraphics.drawCircle(x,y,10);
        customGraphics.endFill();
    }
}