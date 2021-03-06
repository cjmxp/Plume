package plume.atlas;

import kha.graphics2.Graphics;
import kha.Image;

/**
 *	Represents a region inside a image
 */
class Region
{
	public var image:Image;

	/** The x position inside the image */
	public var sx:Float;

	/** The y position inside the image */
	public var sy:Float;

	/** Width of the region */
	public var w:Int;

	/** Height of the region */
	public var h:Int;

	public function new(image:Image, sx:Float, sy:Float, w:Int, h:Int)
	{
		this.image = image;
		this.sx = sx;
		this.sy = sy;
		this.w = w;
		this.h = h;
	}

	/** This is a simple render. To use things like flipping and scaling, use the class Sprite. */
	inline public function render(g:Graphics, x:Float, y:Float):Void 
	{
		g.drawScaledSubImage(image, sx, sy, w, h, x, y, w, h);
	}

	public static function createFromImage(image:Image):Region
	{
		return new Region(image, 0, 0, image.width, image.height);
	}
}