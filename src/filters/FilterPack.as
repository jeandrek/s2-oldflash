/*
 * Scratch Project Editor and Player
 * Copyright (C) 2014 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

// FilterPack.as
// John Maloney, July 2010
//
// Scratch image filters. Uses compiled "pixel-bender" shaders for performance.
// Use setFilter() to set filter parameters. buildFilters() returns a list of filters
// to be assigned to the filters property of s DisplayObject (e.g. a sprite).

package filters {
	import flash.display.*;
	import flash.filters.*;
import flash.geom.ColorTransform;
import flash.system.Capabilities;
	import scratch.*;
	import util.*;

public class FilterPack {
	public static var filterNames:Array = [
		"color", "fisheye", "whirl", "pixelate", "mosaic", "brightness", "ghost"];

	public var targetObj:ScratchObj;
	private var filterDict:Object;


	public function FilterPack(targetObj:ScratchObj) {
		this.targetObj = targetObj;
		this.filterDict = new Object();
		resetAllFilters();
	}

	public function getAllSettings():Object {
		return filterDict;
	}

	public function resetAllFilters():void {
		for (var i:int = 0; i < filterNames.length; i++) {
			filterDict[filterNames[i]] = 0;
		}
	}

	public function getFilterSetting(filterName:String):Number {
		var v:* = filterDict[filterName];
		if (!(v is Number)) return 0;
		return v;
	}

	public function setFilter(filterName:String, newValue:Number):Boolean {
		if (newValue != newValue) return false;
		if (filterName == "brightness") newValue = Math.max(-100, Math.min(newValue, 100));
		if (filterName == "color") newValue = newValue % 200;
		if (filterName == "ghost") newValue = Math.max(0, Math.min(newValue, 100));

		var oldValue:Number = filterDict[filterName];
		filterDict[filterName] = newValue;

		return (newValue != oldValue);
	}

	public function duplicateFor(target:ScratchObj):FilterPack {
		var result:FilterPack = new FilterPack(target);
		for (var i:int = 0; i < filterNames.length; i++) {
			var fName:String = filterNames[i];
			result.setFilter(fName, filterDict[fName]);
		}
		return result;
	}

	private static var emptyArray:Array = [];
	private var newFilters:Array = [];
	public function buildFilters(force:Boolean = false):Array {
		// disable filters not running on x86 because PixelBender is really slow
		return emptyArray;
	}
}}
