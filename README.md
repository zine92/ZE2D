ZE2D [![Build Status](https://travis-ci.org/zine92/ZE2D.png?branch=master)](https://travis-ci.org/zine92/ZE2D)
====

An openfl gameobject/component system game framework for Haxe. Inspired by FlashPunk, Unity.

###Purpose
Aims to create a simple and working proof of concept engine/framework for easy usage for creating games in flash/haxe/openfl context.


###Hello, World!
1. Create a blank main.hx.
    
        static function main() 
        {
            new Engine(new MyScene());
        }
        
2. Create a blank MyScene.hx.
        
        package;
        import ze.component.rendering.Text;
        import ze.object.GameObject;
        import ze.object.Scene;
        import ze.util.Color;
        
        class MyScene extends Scene //Important to extend from Scene
        {
            private var _text:Text;
            private var _gameObject:GameObject;

            override private function added():Void
            {
                _text = new Text("Hello, World!", Color.WHITE);             //Create a new component called Text
                _gameObject = new GameObject("GameObject", 300, 300);       //Create a new gameObject called GameObject
                _gameObject.addComponent(_text);                            //Add the component to gameObject
                
                addGameObject(_gameObject);                                 //Add the gameObject to scene
            }
        }
        
There you have your first attempt at using Ze2D.


###To create new gameObjects, just extend gameObject. (Extending from above).
1. Create a blank Player.hx.


        package;
        import ze.component.rendering.Text;
        import ze.object.GameObject;
        import ze.util.Color;
        
        class Player extends GameObject
        {
            private var _text:Text;
            override private function added():Void
            {
                _text = new Text("Hello, World!", Color.WHITE);
                addComponent(_text);
            }
        }
        
2. and in MyScene.hx.

        package;
        import ze.object.Scene;
        
        class MyScene extends Scene //Important to extend from Scene
        {
            private var _player:Player;
            
            override private function added():Void
            {
                _player = new Player();
                addGameObject(_player);
            }
        }
    