var _i = 0;
var _player = noone;

var _x = 0;
var _y = 0;
var _x1 = 0;
var _y1 = 0;
var _x2 = 0;
var _y2 = 0;
var _width = 0;
var _height = 0;
var _color = c_white;
var _alpha = 1;
var _value = 0;
var _space = 0;

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

if(gpu_get_blendmode() != bm_normal) {
    gpu_set_blendmode(bm_normal);
}

if(game.stage == GAME_STAGE.GAME_START) {
    _i = 0;
    repeat(array_length(game.player_list)) {
        _player = game.player_list[_i];
        
        if(_i != game.client.player) {
            draw_set_valign(fa_bottom);
            draw_text_transformed(_player.x, _player.y - 24, string_ext("{0}", [game.user_list[_i].name]), 0.25, 0.25, 0);
            
            if(_player.unit.dead) {
                
            }
            else {
                _x = _player.x;
                _y = _player.y + 24;
                _width = 48;
                _height = 8;
                _alpha = 0.75;
                _value = median(0, _player.unit_durability_draw/_player.unit.frame.durability_max, 1);
                
                _x1 = _x - _width * 0.5;
                _y1 = _y - _height * 0.5;
                _x2 = _x + _width * 0.5;
                _y2 = _y + _height * 0.5;
                draw_rectangle_line_vertex(_x1, _y1, _x2, _y2, 1, c_orange, c_orange, c_red, c_red, _alpha, _alpha, _alpha * 0.5, _alpha * 0.5);
                draw_rectangle_vertex(_x1, _y1, _x1 + _width * _value, _y2, c_orange, c_orange, c_red, c_red, _alpha, _alpha, _alpha, _alpha, false);
            }
        }
        
        _i += 1;
    }
    
    draw_ring_vertex(2500, 2500, 360, 90, game.range * 1.75, 20000, c_orange, c_red, 0, 1, 0, false);
    draw_ring_vertex(2500, 2500, 360, 90, game.range * 2, game.range * 2 + 8, c_red, c_red, 1, 1, 0, false);
}
