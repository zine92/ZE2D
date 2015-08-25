package ze.component.graphic.tilesheet;

/**
 * ...
 * @author Goh Zi He
 */
class TiledSprite extends TilesheetObject
{
	private var _tileRow:Int;
	private var _tileColumn:Int;
	private var _mapWidth:Float;
	private var _mapHeight:Float;
	private var _tileWidth:Float;
	private var _tileHeight:Float;
	private var _indices:Array<Array<Int>>;
	
	public function new(name:String, tileWidth:Int, tileHeight:Int, mapWidth:Int, mapHeight:Int, tileRow:Int, tileColumn:Int)
	{
		super(name);
		_indices = [[]];
		_tileWidth = tileWidth;
		_tileHeight = tileHeight;
		_mapWidth = mapWidth;
		_mapHeight = mapHeight;
		_tileRow = tileRow;
		_tileColumn = tileColumn;
		
		var row:Int = Math.floor(_mapHeight / _tileHeight);
		var column:Int = Math.floor(_mapWidth / _tileWidth);
		
		for (r in 0 ... row)
		{
			_indices[r] = [];
			for (c in 0 ... column)
			{
				_indices[r][c] = -1;
			}
		}
	}
	
	public function setTile(column:Int, row:Int, tx:Int, ty:Int):Void
	{
		var tiles:Array<Int> = _tileSheetLayer.getSpriteIndices(_name);
		if (_indices[row] == null)
		{
			return;
		}
		_indices[row][column] = tiles[tx + (ty * _tileRow)];
		_tileID = _indices[row][column];
	}
	
	override public function draw():Void 
	{
		if (_tileSheetLayer == null)
		{
			return;
		}
		
		var x:Float = transform.x;
		var y:Float = transform.y;
		
		for (row in 0 ... _indices.length)
		{
			for (column in 0 ... _indices[row].length)
			{
				if (_indices[row][column] == -1)
				{
					continue;
				}
				var index:Int = 0;
				_tileData[index++] = x + (column * _tileWidth);
				_tileData[index++] = y + (row * _tileHeight);
				_tileData[index++] = _indices[row][column];
				_tileData[index++] = 1;
				_tileData[index++] = 0;
				_tileData[index++] = 0;
				_tileData[index++] = 1;
				_tileSheetLayer.addToDraw(layer, _tileData);
			}
		}
	}
}