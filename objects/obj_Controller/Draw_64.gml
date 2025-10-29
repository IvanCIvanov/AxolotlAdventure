// Draw player lives
var draw_x, draw_y = 16;

for (var i = 0; i < global.lives; i++) {
	draw_x = 16 + 144 * i;
	draw_sprite(spr_life, 0, draw_x, draw_y);
}