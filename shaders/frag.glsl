/*
 * GNU Zoomer --- Magnifying goodness
 * Copyright (C) 2023 Wasym A. Alonso
 *
 * This file is part of Zoomer.
 *
 * Zoomer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Zoomer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Zoomer.  If not, see <http://www.gnu.org/licenses/>.
 */


in mediump vec2 in_texcoord;
out mediump vec4 out_color;

uniform sampler2D u_tex;
uniform vec2 u_cursor_pos;
uniform vec2 u_win_size;
uniform float u_fl_shadow;
uniform float u_fl_radius;
uniform float u_cam_scale;

void main(void) {
  vec4 cursor = vec4(u_cursor_pos.x, u_win_size.y - u_cursor_pos.y, 0.0, 1.0);
  out_color = mix(texture(u_tex, in_texcoord),
                  vec4(0.0, 0.0, 0.0, 0.0),
                  length(cursor - gl_FragCoord) < (u_fl_radius * u_cam_scale) ? 0.0 : u_fl_shadow);
}
