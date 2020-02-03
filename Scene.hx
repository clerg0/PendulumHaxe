import h2d.Object;
import h2d.Graphics;
import h2d.RenderContext;

class Scene extends Object {
    var graphic:h2d.Graphics;
    var w : Float;
    var h : Float;


    public function new( ?parent : h2d.Object){
        super(parent);
        graphic = new h2d.Graphics(parent);
    }

    public function setSize(x:Float, y:Float) {
        w = x;
        h = y;
    }

    override public function draw( ctx : RenderContext ) {
        graphic.beginFill(0x0000FF);
        graphic.drawRect(0, 0, w, h);
        graphic.endFill();    
    }
}