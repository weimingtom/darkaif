/**
* ...
* @author Default
* @version 0.1
*/

package {
    import flash.display.Sprite;

    public class InteractiveObjectExample extends Sprite {

        public function InteractiveObjectExample() {
            var child:Sprite = new ChildSprite();
            addChild(child);
        }
    }
}

import flash.display.Sprite;
import flash.events.MouseEvent;

class ChildSprite extends Sprite {
    private var size:uint = 50;
    private var overSize:uint = 60;
    private var backgroundColor:uint = 0xFFCC00;
    private var overColor:uint = 0xCCFF00;
    private var downColor:uint = 0x00CCFF;

    public function ChildSprite() {
        buttonMode = true;
        draw(size, size, backgroundColor);
        addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
    }

    private function draw(w:uint, h:uint, bgColor:uint):void {
        graphics.clear();
        graphics.beginFill(bgColor);
        graphics.drawRect(0, 0, w, h);
        graphics.endFill();
    }

    public function mouseOverHandler(event:MouseEvent):void {
        trace("mouseOverHandler");
        draw(overSize, overSize, overColor);
    }

    public function mouseOutHandler(event:MouseEvent):void {
        trace("mouseOutHandler");
        draw(size, size, backgroundColor);
    }

    public function mouseDownHandler(event:MouseEvent):void {
        trace("mouseDownHandler");
        draw(overSize, overSize, downColor);
    }

    public function mouseUpHandler(event:MouseEvent):void {
        trace("mouseUpHandler");
        draw(overSize, overSize, overColor);
    }
}