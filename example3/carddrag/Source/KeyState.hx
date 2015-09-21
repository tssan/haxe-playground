package;

import haxe.ds.IntMap;


class KeyState {
    public static var keys_down:IntMap<Bool> = new IntMap<Bool>();

    public static function is_down(key_code:UInt):Bool {
        return keys_down.get(key_code);
    }
}
