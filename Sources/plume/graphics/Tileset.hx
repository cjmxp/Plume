package plume.graphics;

import kha.graphics2.Graphics;
import plume.atlas.Atlas;
import plume.atlas.Region;
import plume.atlas.Atlas.ImageType;

class Tileset
{
	public var region:Region;
	public var tileWidth:Int;
	public var tileHeight:Int;
	public var widthInTiles:Int;
	public var heightInTiles:Int;

	// temp variables
	var _x:Float;
	var _y:Float;	

	public function new(source:ImageType, tileWidth:Int, tileHeight:Int):Void
	{
		switch (source.type)
		{
			case First(image):
				this.region = Region.createFromImage(image);

			case Second(region):
				this.region = region;

			case Third(regionName):
				this.region = Atlas.getRegion(regionName);
		}

		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;

		widthInTiles = Std.int(region.w / tileWidth);
		heightInTiles = Std.int(region.h / tileHeight);
	}

	inline public function render(g:Graphics, index:Int, x:Float, y:Float):Void
	{
		_x = Std.int(index % widthInTiles);
		_y = Std.int(index / widthInTiles);
		g.drawScaledSubImage(region.image, region.sx + (_x * tileWidth), region.sy + (_y * tileHeight), tileWidth, tileHeight, x, y, tileWidth, tileHeight);
	}	
}